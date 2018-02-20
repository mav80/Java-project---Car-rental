package pl.coderslab.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import pl.coderslab.app.Cookies;
import pl.coderslab.app.OrderChecker;
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
public class HomeController {
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
	
	@GetMapping("")	
	public String home(Model model, HttpSession session, HttpServletRequest request) {
		
		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		
		if(session.getAttribute("loggedUser") != null ) {
			User user = (User)session.getAttribute("loggedUser"); //w sesji zapisujemy obiekty więc musimy zrobić rzutowanie na usera
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
		}
		model.addAttribute("order", new Order()); //przekazujemy order do zbindowania z formularzem znajdującym się na stronie głównej
		return "index";
	}
	
	
	
	@PostMapping("")
	//@ResponseBody
	public String home(@Valid Order order, BindingResult result, HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("loggedUser");
		
		if(session.getAttribute("loggedUser") != null ) {
			user = (User)session.getAttribute("loggedUser"); //w sesji zapisujemy obiekty więc musimy zrobić rzutowanie na usera
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
		}
		
		 if(user == null) {
			 return "redirect:/login";
		 }
		 
		 String validationResult = OrderChecker.checkOrderDates(order, result);
		 if(validationResult != "ok") { 
			 model.addAttribute("dateError", validationResult);
			 return "index"; 
		 }
		 
		order.calculateAndSetNumberOfDaysAndPrice(order, carClassRepository);
		order.generateAndSetUniqueReferenceNumber(orderRepository);
			
		model.addAttribute("rentLengthInDays", order.getRentLengthInDays());
		//model.addAttribute("rentLengthInHours", Hours.hoursBetween(startDate, endDate).getHours());
		model.addAttribute("rentCost", order.getOrderPrice());
		model.addAttribute("rentReferenceNumber", order.getReferenceNumber());
		
		order.setUser(user);
		orderRepository.save(order);
		
		model.addAttribute("order", order);

		return "summary";
	}
	
	
	
	@GetMapping("/summary2")	
	public String summary(Model model, HttpSession session, HttpServletRequest request) {
		
		
		return "summary2";
	}
	
	
	
	
	
	@PostMapping("/summary2")
	//@ResponseBody
	public String summary(@Valid Order order, BindingResult result, HttpSession session, Model model) {
		
//		if(result.hasErrors()) {
//			return "summary"; 
//		}
		List<Extras> extras = extrasRepository.findAll();
		
		order.setExtras(extras);
		orderRepository.save(order);
		


		return "summary2";
	}
	
	
	
	
	
	
	
	@ModelAttribute("addresses")
	public List<Address> getAddresses() {
		return addressRepository.findAll();
	}
	
	@ModelAttribute("cars")
	public List<CarClass> getCars() {
		return carClassRepository.findAll();
	}
	
	@ModelAttribute("extras")
	public List<Extras> getExtras() {
		return extrasRepository.findAll();
	}
	
	

}
