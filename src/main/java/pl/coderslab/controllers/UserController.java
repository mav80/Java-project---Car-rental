package pl.coderslab.controllers;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
public class UserController {
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
	
	@GetMapping("/panelUser")
	public String login(Model model, HttpSession session, HttpServletRequest request, @RequestParam(defaultValue="") String showAll) {

		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		User user = (User) session.getAttribute("loggedUser");
		
		if(user != null) {
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
			
			//model.addAttribute("orders", orderRepository.findAllByIdOrderByCreated(user.getId()));
			//model.addAttribute("orders", orderRepository.findByUserId(user.getId())); // tego używałem poprzednio
			//List<Order> orders = orderRepository.findByUserIdOrderByCreatedDesc(user.getId());
			List<Order> orders = orderRepository.show5LatestOrdersByUserId(user.getId());
			model.addAttribute("orders", orders);
			if(orders.isEmpty()) {
				model.addAttribute("modelInfo","Nie masz jeszcze żadnych rezerwacji.");
			} else {
				model.addAttribute("modelInfo","Oto 5 Twoich ostatnich rezerwacji:");
			}
			//model.addAttribute("orders", orderRepository.findAllById(1));
			//model.addAttribute("orders", orderRepository.findAll());
			
			if(showAll.equals("true") ) {
				model.addAttribute("orders", orderRepository.findByUserIdOrderByCreatedDesc(user.getId()));
				model.addAttribute("modelInfo", "Oto wszystkie Twoje rezerwacje:");
			}
			
			
		}

		return "panelUser";
	}
	

	@GetMapping("/editOrder/{id}")
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
		
		//chcemy dodać do edycji wszystkie dodatki które są w bazie i nie są wyłączone oraz te które są w zamówieniu,
		//nawet jeśli są wyłączone - robimy więc hashSet w którym pozycje nie mogą się powtarzać i który w efekcie da nam część
		//wspólną obu wyszukiwań
		
		HashSet<Extras> extras = new HashSet<>();
		extras.addAll(extrasRepository.findAllByActive(true));
		extras.addAll(order.getExtras());
		
		model.addAttribute("extras", extras);
		model.addAttribute("order", order);
		return "orderEditForm";
	}
	
	
	@PostMapping("/editOrder/{id}")
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
			extras.addAll(extrasRepository.findAllByActive(true));
			extras.addAll(order.getExtras());
			model.addAttribute("extras", extras);
			
			return "orderEditForm";
		}
		
		 if(OrderChecker.checkOrderDates(order, result) != "ok") { 
			
			 model.addAttribute("dateError", OrderChecker.checkOrderDates(order, result));
			 
				HashSet<Extras> extras = new HashSet<>();
				extras.addAll(extrasRepository.findAllByActive(true));
				extras.addAll(order.getExtras());
				model.addAttribute("extras", extras);
				
			 return "orderEditForm"; 
		 }
		 
		order.calculateAndSetNumberOfDaysAndPrice(order, carClassRepository);
		order.updatePriceWithSelectedExtras(order, order.getExtras()); //tu działamy
		orderRepository.save(order);
		
		model.addAttribute("message", "Dane rezerwacji zmieniono pomyślnie.");
		return "redirect:/panelUser";
	}
	
	
	@GetMapping("/deleteOrderUser/{id}")
	public String deleteId(@PathVariable Long id, Model model)
	{
		Order order = orderRepository.findFirstById(id);
		if(order != null) {
			orderRepository.delete(order);
			model.addAttribute("message", "Rezerwację usunięto.");
		}
		return "redirect:/panelUser";
	}
	
	
	
	
	
	
	
	
	@GetMapping("/userEditProfile/{id}")
	public String editUserProfile(Model model, @PathVariable Long id, HttpSession session, HttpServletRequest request)
	{	
		Cookies.CheckCookiesAndSetLoggedUserAttribute(request, userRepository, session); //static method to check user cookie and set session attribute accordingly to avoid repeating code
		User user = (User) session.getAttribute("loggedUser");
		if(user != null) {
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
		}
		
		
		User userToEdit = userRepository.findFirstById(id);
		
		
		if(user == null) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		model.addAttribute("user", userToEdit);
		//return "userRegistrationForm";
		return "userEditOwnProfile";
	}
	
	
	@PostMapping("/userEditProfile/{id}")
	public String editUserProfile(@Valid User user, BindingResult result, @PathVariable Long id, Model model)
	{
		if (result.hasErrors())
		{
			model.addAttribute("info", "Jesteś zalogowany jako " + user.getUsername());
			return "userEditOwnProfile";
		}
		
		user.setPassword(BCrypt.hashpw(user.getPassword(),  BCrypt.gensalt()));
		user.setEnabled(true);
		userRepository.save(user);
		
		model.addAttribute("message", "Dane użytkownika zmieniono pomyślnie.");
		
		return "redirect:/panelUser";
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
