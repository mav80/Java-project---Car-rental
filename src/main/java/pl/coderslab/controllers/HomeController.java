package pl.coderslab.controllers;

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
		
		 if(user == null) {
			 return "redirect:/login";
		 }
		 
		 String validationResult = OrderChecker.checkOrderDates(order, result);
		 if(validationResult != "ok") { 
			 model.addAttribute("dateError", validationResult);
			 return "index"; 
		 }
		 
		 
		 
		 
		 
		DateTime startDate = new DateTime(order.getPickupDate());
		DateTime endDate = new DateTime(order.getReturnDate());
		//DateTime nowDate = new DateTime();
		 
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println("Długość wynajmu w dniach: " + Days.daysBetween(startDate, endDate).getDays());
		System.out.println("Długość wynajmu w godzinach: " + Hours.hoursBetween(startDate, endDate).getHours());
		
		int rentLengthInDays = Days.daysBetween(startDate, endDate).getDays();
		if(Hours.hoursBetween(startDate, endDate).getHours() % 24 != 0) { 		// jeśli zostają jakieś luźne godziny to znaczy że zaczęty jest następny dzień i liczymy go jako dodatkowy pełny dzień wynajmu
			rentLengthInDays++;
		}
		
		System.out.println("Długość wynajmu w dniach po doliczeniu niepełnych dni: " + rentLengthInDays);
		
		int orderCost = rentLengthInDays * carClassRepository.findFirstById(order.getCarClass().getId()).getPricePerDay(); //cenę musimy pobrać z załadowanej z bazy klasy samochodu ponieważ klasa samochodu noto utworzonego zamówienia posiada tylko id, pozostałe pola są null
		System.out.println(carClassRepository.findFirstById(order.getCarClass().getId()));
		System.out.println("Całkowity koszt wynajmu (liczba dni * koszt klasy za dzień): " + rentLengthInDays + " * " + carClassRepository.findFirstById(order.getCarClass().getId()).getPricePerDay() + " = " + orderCost);
		
		
//		CarClass orderCarClass = carClassRepository.findFirstById(order.getCarClass().getId());
//		System.out.println(orderCarClass);
//		
//		orderCost = rentLengthInDays * orderCarClass.getPricePerDay();
//		System.out.println("Całkowity koszt wynajmu poprawione (klasa auta wczytana osobno) (liczba dni * koszt klasy za dzień): " + rentLengthInDays + " * " + orderCarClass.getPricePerDay() + " = " + orderCost);
		
		model.addAttribute("rentLengthInDays", rentLengthInDays);
		model.addAttribute("rentLengthInHours", Hours.hoursBetween(startDate, endDate).getHours());
		model.addAttribute("rentCost", orderCost);
		 
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
