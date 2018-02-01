package pl.coderslab.controllers;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import pl.coderslab.entities.User;
import pl.coderslab.repositories.UserRepository;

@Controller
public class UserRegistrationController {
	@Autowired UserRepository userRepository;
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		
		return "userRegistrationForm";
	}
	
	@PostMapping("/register")
	public String register(@Valid User user, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		
		//System.out.println("Odebrane z formy imię: " + user.getUsername());
		
		if(result.hasErrors()) {
			return "userRegistrationForm";
		}
		
		//szyfrujemy i zapisujemy hasło
		user.setPassword(BCrypt.hashpw(user.getPassword(),  BCrypt.gensalt()));
		user.setEnabled(true);
		userRepository.save(user);
		
		//return "success";
		
		return "redirect:http://localhost:8080/EndProject-CarRental/login";
		
	}
	
	

}
