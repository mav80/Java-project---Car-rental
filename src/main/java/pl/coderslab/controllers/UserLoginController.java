package pl.coderslab.controllers;

import java.io.UnsupportedEncodingException;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.mysql.fabric.Response;

import pl.coderslab.entities.User;
import pl.coderslab.repositories.UserRepository;

@Controller
public class UserLoginController {
	@Autowired
	UserRepository userRepository;
	@GetMapping("/login")
	public String login() {
		return "userLoginForm";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model, HttpServletResponse response) {
				
		User user = userRepository.findFirstByEmail(email);
		if(user!=null && BCrypt.checkpw(password,  user.getPassword()) && user.isEnabled()) {
			
			//model.addAttribute("info", "Zalogowano");
			//System.out.println("It matches.");
			session.setAttribute("loggedUser", user);
			
			//cookie section
			try {
				Cookie userCookie = new Cookie("userCookie",URLEncoder.encode(user.getEmail(),"utf-8"));
				userCookie.setPath("/");
				userCookie.setMaxAge(60 * 60 * 24 * 7 * 4); //set cookie expiry time to ~1 month
				response.addCookie(userCookie);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//end of cookie section
			
		} else {
			session.setAttribute("loggedUser", null);
			//model.addAttribute("info", "Błędny login lub hasło");
			//System.out.println("It doesn't match.");
		}
		
		return "redirect:/";
	}
	
	
	@GetMapping("/logout")
	//@ResponseBody
	public String logout(HttpSession session, HttpServletRequest request,  HttpServletResponse response) {
		session.setAttribute("loggedUser",  null);
		
		//cookie section
		Cookie userCookie = WebUtils.getCookie(request, "userCookie");
		if(userCookie!=null) {
			userCookie.setPath("/");
			userCookie.setMaxAge(0);
			response.addCookie(userCookie);
		}
		//end of cookie section
		
		return "redirect:/";
		
	}
	
	
	
	@GetMapping("/test")
	//@ResponseBody
	public String test() {
		
		return "test";
		
	}
	
	

}
