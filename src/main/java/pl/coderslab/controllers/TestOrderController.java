package pl.coderslab.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.coderslab.entities.Address;
import pl.coderslab.entities.CarClass;
import pl.coderslab.entities.Order;
import pl.coderslab.entities.User;
import pl.coderslab.repositories.AddressRepository;
import pl.coderslab.repositories.CarClassRepository;
import pl.coderslab.repositories.OrderRepository;
import pl.coderslab.repositories.UserRepository;

@Controller
public class TestOrderController {
//	@Autowired
//	Order order;
//	@Autowired
//	Address address;
//	@Autowired
//	CarClass carClass;
//	@Autowired
//	User user;
	
	@Autowired
	AddressRepository addressRepository;
	@Autowired
	CarClassRepository carClassRepository;
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	UserRepository userRepository;
	
	
	
	@GetMapping("/addFixedOrder")
	@ResponseBody
	String addFixedOrder() {
		
		Address address = addressRepository.findFirstById(1);
		CarClass carClass = carClassRepository.findFirstById(1);
		User user = userRepository.findFirstById(1);
		
		//LocalDateTime pickupDate = LocalDateTime.parse("2018-01-12 12:10:31");
		//LocalDateTime returnDate = LocalDateTime.parse("2018-01-14 12:10:31");
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		LocalDateTime pickupDate = LocalDateTime.parse("2018-01-12 12:10:31", formatter);
		LocalDateTime returnDate = LocalDateTime.parse("2018-01-14 12:10:31", formatter);
		
		
		
		Order order = new Order();
		order.setPickupDate(pickupDate);
		order.setReturnDate(returnDate);
		order.setAddress(address);
		order.setCarClass(carClass);
		order.setUser(user);
		
		orderRepository.save(order);
		
		
		//order.setPickupDate
		
		//address = addressRepository.
		
		return "Wykonano próbę dodania orderu do bazy";
		
	}

}
