package pl.coderslab.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import pl.coderslab.app.Cookies;
import pl.coderslab.entities.Address;
import pl.coderslab.entities.CarClass;
import pl.coderslab.entities.Order;
import pl.coderslab.entities.User;
import pl.coderslab.repositories.AddressRepository;
import pl.coderslab.repositories.CarClassRepository;
import pl.coderslab.repositories.OrderRepository;
import pl.coderslab.repositories.UserRepository;

@Controller
public class AdminController {
	@Autowired
	AddressRepository addressRepository;
	@Autowired
	CarClassRepository carClassRepository;
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("/panelAdmin")
	public String panelAdmin(Model model, @RequestParam(defaultValue="-1") long userId, @RequestParam(defaultValue="") String name, 
			@RequestParam(defaultValue="") String email, @RequestParam(defaultValue="") String startDate, @RequestParam(defaultValue="") String endDate, 
			@RequestParam(defaultValue="") String showAll, HttpServletRequest request, HttpSession session) {

		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		
//		System.out.println("Param userId: " + userId);
//		System.out.println("Param name: " + name);
//		System.out.println("Param email: " + email);
		System.out.println("Param startDate: " + startDate);
		System.out.println("Param endDate: " + endDate);
//		System.out.println("Param showAll: " + showAll);
		
		
		if(userId > 0) {
			model.addAttribute("orders", orderRepository.findByUserId(userId));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania:");
		}
		
		if(!name.isEmpty()) {
			model.addAttribute("orders", orderRepository.customFindOrdersByUserName(name));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania:");
		}
		
		if(!email.isEmpty()) {
			model.addAttribute("orders", orderRepository.customFindOrdersByUserEmail(email));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania:");
		}
		
		if(!startDate.isEmpty() && !endDate.isEmpty() ) {
			
			DateTime jodaEndtDate = new DateTime(endDate);
			DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd");
			endDate = fmt.print(jodaEndtDate.plusDays(1));
			model.addAttribute("orders", orderRepository.customFindOrdersCreatedBetweenGivenDates(startDate, endDate));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania:");
		}
		
		
		
		if(!startDate.isEmpty() && endDate.isEmpty() ) { //szukamy od dnia wskazanego do dzisiejszego
			DateTime jodaStartDate = new DateTime(startDate);
			DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd");
			//String tomorrowDate = fmt.print(jodaStartDate.plusDays(1));
			endDate = fmt.print(new DateTime().plusDays(1)); //data dzisiejsza + 1

			model.addAttribute("orders", orderRepository.customFindOrdersCreatedBetweenGivenDatesAscending(startDate, endDate));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania od wybranego dnia początkowego:");
		}
		
		if(startDate.isEmpty() && !endDate.isEmpty() ) { //szukamy początku do  dnia dzisiejszego
			startDate = "2000-01-01";
			DateTime jodaEndDate = new DateTime(endDate);
			DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd");
			endDate = fmt.print(jodaEndDate.plusDays(1));
			System.out.println(endDate);
			model.addAttribute("orders", orderRepository.customFindOrdersCreatedBetweenGivenDates(startDate, endDate));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania do wybranego dnia końcowego:");
		}
		
		
		
		if(showAll.equals("true") ) {
			model.addAttribute("orders", orderRepository.findAll());
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania:");
		}
		
		//System.out.println(new Date().);
		
		return "panelAdmin";
	}
	
	
	
	
	
	@GetMapping("/adminEditOrder/{id}")
	public String editId(Model model, @PathVariable Long id)
	{
		Order order = orderRepository.findOneById(id);
		
		if(order == null) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		model.addAttribute("order", order);
		return "adminOrderEditForm";
	}
	
	@PostMapping("/adminEditOrder/{id}")
	public String editId(@Valid Order order, BindingResult result, @PathVariable Long id)
	{
		if (result.hasErrors())
		{
			return "adminOrderEditForm";
		}
		orderRepository.save(order);
		return "redirect:/panelAdmin";
	}
	
	
	@GetMapping("/deleteOrderAdmin/{id}")
	public String deleteId(@PathVariable Long id)
	{
		Order order = orderRepository.findFirstById(id);
		if(order != null) {
			orderRepository.delete(order);
		}
		return "redirect:/panelAdmin";
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("/adminEditUser/{id}")
	public String adminEditUserProfile(Model model, @PathVariable Long id, HttpSession session)
	{
		User loggedUser = (User) session.getAttribute("loggedUser");
		User user = userRepository.findFirstById(id);
		
		if(user == null || !loggedUser.isisAdmin()) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		model.addAttribute("user", user);
		return "adminUserEditForm";
	}
	
	
	@PostMapping("/adminEditUser/{id}")
	public String adminEditUserProfile(@Valid User user, BindingResult result, @PathVariable Long id, Model model, HttpSession session)
	{
		User loggedUser = (User) session.getAttribute("loggedUser");
		
		if(user == null || !loggedUser.isisAdmin()) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		
		if (result.hasErrors())
		{
			return "adminUserEditForm";
		}
		
		userRepository.save(user);
		//model.addAttribute("userProfileChangedSuccessfully", "Dane użytkownika zmieniono pomyślnie.");
		
		return "redirect:http://localhost:8080/EndProject-CarRental/panelAdmin";
	}
	
	
	
	
	
	
	
	
	
	@ModelAttribute("addresses")
	public List<Address> getAddresses() {
		return addressRepository.findAll();
	}
	
	@ModelAttribute("cars")
	public List<CarClass> getCars() {
		return carClassRepository.findAll();
	}

}
