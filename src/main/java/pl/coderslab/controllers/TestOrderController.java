package pl.coderslab.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
//		order.setPickupDate(pickupDate);     //nie działa bo zmieniłem typ z DateTime na Timestamp
//		order.setReturnDate(returnDate);
		order.setAddress(address);
		order.setCarClass(carClass);
		order.setUser(user);
		
		orderRepository.save(order);
		
		
		//order.setPickupDate
		
		//address = addressRepository.
		
		return "Wykonano próbę dodania orderu do bazy";
		
	}
	
	
	//w poniższym adresie poprawnie wyliczamy ponownie liczbę dni i cenę dla każdeo znajdującego się w bazie zamówienia
	
	@GetMapping("/fixOrdersLengthAndPrice")
	String fixOrdersInDatabase(Model model) {

		
		List<Order> orders = orderRepository.findAll();
		for(Order order : orders) {
			order.calculateAndSetNumberOfDaysAndPrice(order, carClassRepository);
			orderRepository.save(order);
		}
		
		//a tutaj jeszcze generujemy numery referencyjne:
		
		orders = orderRepository.findAll();
		for(Order order : orders) {
			order.generateAndSetUniqueReferenceNumber(orderRepository);
			orderRepository.save(order);
		}
		
//		Order order = orderRepository.findFirstById(5);
//		order.generateAndSetUniqueReferenceNumber(orderRepository);
//		orderRepository.save(order);
		
		
		model.addAttribute("poprawka", "Wykonano poprawianie wpisów w bazie");
		return "redirect:/";
		
	}
	
	
	
	
	
	@GetMapping("/deleteOrder")
	@ResponseBody
	String deleteOrder(Model model) {
		
		Order order = orderRepository.findFirstById(28);
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nZnaleziony order: " + order + "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		//orderRepository.delete(order);
		orderRepository.deleteById((long) 28);
		System.out.println("Wykonano próbę kasowania.");

		return "Skasowano";
		
	}
	
	
	@GetMapping("/generateMissingReferenceNumbers")
	@ResponseBody
	String generateMissingReferenceNumbers(Model model) {
		
		List<Order> orders = orderRepository.findAll();
		
		int licznik = 0;
		
		for(Order order : orders) {
			licznik++;
			if(order.getReferenceNumber() == null) {
				order.generateAndSetUniqueReferenceNumber(orderRepository);
				orderRepository.save(order);
				System.out.println(licznik + " Brak numeru referencyjnego, nowy to: " + order.getReferenceNumber());
			} else {
				System.out.println(licznik + " Order już ma numer referencyjny: " + order.getReferenceNumber());
			}
		}

		return "Numery referencyjne uzupelniono.";
		
	}

}
