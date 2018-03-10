package pl.coderslab.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import pl.coderslab.app.Cookies;
import pl.coderslab.entities.Address;
import pl.coderslab.entities.CarClass;
import pl.coderslab.entities.Extras;
import pl.coderslab.entities.Order;
import pl.coderslab.entities.User;
import pl.coderslab.repositories.AddressRepository;
import pl.coderslab.repositories.CarClassRepository;
import pl.coderslab.repositories.ExtrasRepository;
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
	@Autowired
	ExtrasRepository extrasRepository;
	
	@GetMapping("/panelAdmin")
	public String panelAdmin(Model model, @RequestParam(defaultValue="-1") long userId, @RequestParam(defaultValue="") String name, 
			@RequestParam(defaultValue="") String email, @RequestParam(defaultValue="") String startDate, @RequestParam(defaultValue="") String endDate, 
			@RequestParam(defaultValue="") String showAll, @RequestParam(defaultValue="") String referenceNumber,
			
			@RequestParam(defaultValue="-1") long userUserId, @RequestParam(defaultValue="-1") int userUserUserAge, @RequestParam(defaultValue="-1") int userUserPhone, @RequestParam(defaultValue="") String userShowBannedUsers, @RequestParam(defaultValue="") String userShowAllUsers,
			HttpServletRequest request, HttpSession session,
			
			@RequestParam(defaultValue="") String extrasShowAllExtras, @RequestParam(defaultValue="") String extrasShowActiveExtras, 
			@RequestParam(defaultValue="") String extrasShowDisabledExtras, @RequestParam(defaultValue="-1") long extrasExtrasId) {
	
		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		User user = (User) session.getAttribute("loggedUser");
		if(user != null) {
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
		}
		
//		System.out.println("Param userId: " + userId);
//		System.out.println("Param name: " + name);
//		System.out.println("Param email: " + email);
		System.out.println("Param startDate: " + startDate);
		System.out.println("Param endDate: " + endDate);
//		System.out.println("Param showAll: " + showAll);
		
		
		//orders
		
		model.addAttribute("howManyOrdersInDatabase", orderRepository.count());
		model.addAttribute("orders", orderRepository.show5LatestOrders());
		model.addAttribute("searchResultMessage", "Oto ostatnich 5 rezerwacji:");
		
		
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
			model.addAttribute("orders", orderRepository.findAllOrderByCreatedDesc());
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania:");
		}
		
		if(!referenceNumber.isEmpty()) {
			model.addAttribute("orders", orderRepository.findAllByReferenceNumber(referenceNumber));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania:");
		}
		
		//System.out.println(new Date().);
		
		
		
		
		
		
		//users
		
		
		
		
		
		
		
		
		if(userUserId > 0 ) {
			model.addAttribute("users", userRepository.findAllById(userUserId));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania użytkowników:");
		}
		
		if(userUserUserAge > 0 ) {
			model.addAttribute("users", userRepository.findAllByAge(userUserUserAge));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania użytkowników:");
		}
		
		if(userUserPhone > 0 ) {
			model.addAttribute("users", userRepository.customFindAllByPhone(userUserPhone));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania użytkowników:");
		}
		
		if(userShowBannedUsers.equals("true") ) {
			model.addAttribute("users", userRepository.findAllByEnabled(false));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania użytkowników:");
		}
		
		
		if(userShowAllUsers.equals("true") ) {
			model.addAttribute("users", userRepository.findAll());
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania użytkowników:");
		}
		
		
		
		
		
		
		
		
		//extras
		
		if(extrasExtrasId > 0 ) {
			model.addAttribute("extras", extrasRepository.findAllById(extrasExtrasId));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania dodatków:");
		}
		
		if(extrasShowActiveExtras.equals("true") ) {
			model.addAttribute("extras", extrasRepository.findAllByActive(true));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania dodatków:");
		}
		
		if(extrasShowDisabledExtras.equals("true") ) {
			model.addAttribute("extras", extrasRepository.findAllByActive(false));
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania dodatków:");
		}
		
		if(extrasShowAllExtras.equals("true") ) {
			model.addAttribute("extras", extrasRepository.findAll());
			model.addAttribute("searchResultMessage", "Oto wyniki wyszukiwania dodatków:");
		}
		
		
		
		return "panelAdmin";
	}
	
	
	
	
	
	@GetMapping("/adminEditOrder/{id}")
	public String editId(Model model, @PathVariable Long id, HttpSession session, HttpServletRequest request)
	{	
		
		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		User user = (User) session.getAttribute("loggedUser");
		if(user != null) {
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
		}
		
		Order order = orderRepository.findOneById(id);
		
		if(order == null) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		
		HashSet<Extras> extras = new HashSet<>();
		extras.addAll(extrasRepository.findAll());
		
		model.addAttribute("extras", extras);
		model.addAttribute("order", order);
		return "adminOrderEditForm";
	}
	
	@PostMapping("/adminEditOrder/{id}")
	public String editId(@Valid Order order, BindingResult result, @PathVariable Long id, Model model, HttpSession session, HttpServletRequest request)
	{
		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		User user = (User) session.getAttribute("loggedUser");
		if(user != null) {
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
		}
		
		
		if (result.hasErrors())
		{
			HashSet<Extras> extras = new HashSet<>();
			extras.addAll(extrasRepository.findAll());
			model.addAttribute("extras", extras);
			return "adminOrderEditForm";
		}
		
		order.calculateAndSetNumberOfDaysAndPrice(order, carClassRepository);
		order.updatePriceWithSelectedExtras(order, order.getExtras());
		model.addAttribute("searchResultMessage", "Dane rezerwacji zmieniono pomyślnie.");
		orderRepository.save(order);
		return "redirect:/panelAdmin";
	}
	
	
	
	
	
	@GetMapping("/deleteOrderAdmin/{id}")
	public String deleteOrderId(@PathVariable Long id, Model model)
	{
		Order order = orderRepository.findFirstById(id);
		if(order != null) {
			orderRepository.delete(order);
			model.addAttribute("searchResultMessage", "Zamówienie usunięto.");
		}
		return "redirect:/panelAdmin";
	}
	
	
	

	
	
	
	
	
	
	
	
	
	@GetMapping("/adminEditUser/{id}")
	public String adminEditUserProfile(Model model, @PathVariable Long id, HttpSession session, HttpServletRequest request)
	{
		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		User user = (User) session.getAttribute("loggedUser");
		if(user != null) {
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
		}
		
		
		User loggedUser = (User) session.getAttribute("loggedUser");
		User userToEdit = userRepository.findFirstById(id);
		
		if(user == null || !loggedUser.isAdmin()) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		model.addAttribute("user", userToEdit);
		return "adminUserEditForm";
	}
	
	
	@PostMapping("/adminEditUser/{id}")
	public String adminEditUserProfile(@Valid User user, BindingResult result, @PathVariable Long id, Model model, HttpSession session)
	{
		User loggedUser = (User) session.getAttribute("loggedUser");
		
		if(user == null || !loggedUser.isAdmin()) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		
		if (result.hasErrors())
		{
			return "adminUserEditForm";
		}
		
		userRepository.save(user);
		model.addAttribute("searchResultMessage", "Dane użytkownika zmieniono pomyślnie.");
		
		return  "redirect:http://localhost:8080/EndProject-CarRental/panelAdmin";
	}
	
	

	
	
	@GetMapping("/deleteUserAdmin/{id}")
	public String deleteUserId(@PathVariable Long id)
	{
		User user = userRepository.findFirstById(id);
		if(user != null) {
			userRepository.delete(user);
		}
		return "redirect:/panelAdmin";
	}
	
	
	
	
	
	
	
	
	
	@ModelAttribute("addresses")
	public List<Address> getAddresses() {
		return addressRepository.findAll();
	}
	
	@ModelAttribute("cars")
	public List<CarClass> getCars() {
		return carClassRepository.findAll();
	}
	
	
	
	
//	@ModelAttribute("users")
//	public List<User> getUsers() {
//		return userRepository.findAll();
//	}
//	
//	@ModelAttribute("orders")
//	public List<Order> getOrders() {
//		return orderRepository.findAll();
//	}

}
