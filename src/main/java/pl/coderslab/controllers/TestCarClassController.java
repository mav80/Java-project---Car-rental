package pl.coderslab.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import pl.coderslab.entities.CarClass;
import pl.coderslab.repositories.CarClassRepository;

@Controller
public class TestCarClassController {
	@Autowired
	CarClassRepository carClassRepository;
	
	@GetMapping("/carclass")
	//@ResponseBody
	public String test() {
		
		return "testCarClass";
		
	}
	
	
	@ModelAttribute("carclasses")
	public List<CarClass> getCarClasses() {
		return carClassRepository.findAll();
	}

}
