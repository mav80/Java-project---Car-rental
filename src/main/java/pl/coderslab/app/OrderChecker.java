package pl.coderslab.app;

import org.joda.time.DateTime;
import org.springframework.validation.BindingResult;

import pl.coderslab.entities.Order;

public class OrderChecker {
	
	public static String checkOrderDates(Order order, BindingResult result) {
		
		DateTime startDate = new DateTime(order.getPickupDate());
		DateTime endDate = new DateTime(order.getReturnDate());
		DateTime nowDate = new DateTime();
		
		if(result.hasErrors()){
			return "Żadna z dat nie może być pusta!";
		}else if(startDate.isBefore(nowDate.plusMinutes(55))){
			return "Data wypożyczenia nie może być wcześniejsza niż teraz + 1 godzina!";
		}else if(startDate.isAfter(endDate)){
			return "Data zwrotu nie może być wcześniejsza niż data wynajęcia!";
		}else if(endDate.isBefore(startDate.plusHours(1))){
			return "Nie możesz wynająć auta na mniej niż 1 dzień!";
		} else {
			return "ok";
		}
		
	}

}
