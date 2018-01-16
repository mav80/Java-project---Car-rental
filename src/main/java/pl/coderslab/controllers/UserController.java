package pl.coderslab.controllers;

import java.util.List;

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

import pl.coderslab.entities.Address;
import pl.coderslab.entities.CarClass;
import pl.coderslab.entities.Order;
import pl.coderslab.entities.User;
import pl.coderslab.repositories.AddressRepository;
import pl.coderslab.repositories.CarClassRepository;
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
	
	@GetMapping("/panelUser")
	public String login(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedUser");
		
		if(user != null) {
			//model.addAttribute("orders", orderRepository.findAllByIdOrderByCreated(user.getId()));
			model.addAttribute("orders", orderRepository.findByUserId(user.getId()));
			//model.addAttribute("orders", orderRepository.findAllById(1));
			//model.addAttribute("orders", orderRepository.findAll());
			
		}

		return "panelUser";
	}
	

	@GetMapping("/editOrder/{id}")
	public String editId(Model model, @PathVariable Long id)
	{
		Order order = orderRepository.findOneById(id);
		
		if(order == null) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		model.addAttribute("order", order);
		return "orderEditForm";
	}
	
	
	@PostMapping("/editOrder/{id}")
	public String editId(@Valid Order order, BindingResult result, @PathVariable Long id)
	{
		if (result.hasErrors())
		{
			return "orderEditForm";
		}
		orderRepository.save(order);
		return "redirect:/panelUser";
	}
	
	
	@GetMapping("/deleteOrderUser/{id}")
	public String deleteId(@PathVariable Long id)
	{
		Order order = orderRepository.findFirstById(id);
		if(order != null) {
			orderRepository.delete(order);
		}
		return "redirect:/panelUser";
	}
	
	
	
	
	
	
	
	
	@GetMapping("/userEditProfile/{id}")
	public String editUserProfile(Model model, @PathVariable Long id)
	{
		User user = userRepository.findFirstById(id);
		
		if(user == null) {
			return "redirect:http://localhost:8080/EndProject-CarRental/";
		}
		model.addAttribute("user", user);
		return "userRegistrationForm";
	}
	
	
	@PostMapping("/userEditProfile/{id}")
	public String editUserProfile(@Valid User user, BindingResult result, @PathVariable Long id, Model model)
	{
		if (result.hasErrors())
		{
			return "userRegistrationForm";
		}
		
		user.setPassword(BCrypt.hashpw(user.getPassword(),  BCrypt.gensalt()));
		user.setEnabled(true);
		userRepository.save(user);
		
		model.addAttribute("userProfileChangedSuccessfully", "Dane użytkownika zmieniono pomyślnie.");
		
		return "/panelUser";
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
