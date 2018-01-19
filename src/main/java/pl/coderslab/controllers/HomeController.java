package pl.coderslab.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
public class HomeController {
	@Autowired
	AddressRepository addressRepository;
	@Autowired
	CarClassRepository carClassRepository;
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	UserRepository userRepository;
	
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
		
		if(result.hasErrors()){
			model.addAttribute("dateError", "Wybierz poprawną datę!");
			return "index";
		}
		
		 if(user == null) {
			 return "redirect:http://localhost:8080/EndProject-CarRental/";
		 }
		
		order.setUser(user);
		orderRepository.save(order);

		return "summary";
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
