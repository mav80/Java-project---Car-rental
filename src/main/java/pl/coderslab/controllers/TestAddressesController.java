package pl.coderslab.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import pl.coderslab.entities.Address;
import pl.coderslab.repositories.AddressRepository;

@Controller
public class TestAddressesController {
	@Autowired
	AddressRepository addressRepository;
	
	@GetMapping("/addresses")
	//@ResponseBody
	public String test() {
		
		return "testAddresses";
		
	}
	
	
	@ModelAttribute("addresses")
	public List<Address> getAddresses() {
		return addressRepository.findAll();
	}

}
