package pl.coderslab.app;

import org.joda.time.DateTime;
import org.joda.time.Hours;
import org.springframework.validation.BindingResult;

import pl.coderslab.entities.Order;

public class OrderChecker {
	
	public static String checkOrderDates(Order order, BindingResult result) {
		
		DateTime startDate = new DateTime(order.getPickupDate());
		DateTime endDate = new DateTime(order.getReturnDate());
		DateTime nowDate = new DateTime();
		
		if(result.hasErrors()){
			return "Żadna z dat nie może być pusta!";
		}else if(Hours.hoursBetween(nowDate, startDate).getHours() < 1){
			return "Data wypożyczenia nie może być wcześniejsza niż teraz + 1 godzina!";
		}else if(Hours.hoursBetween(startDate, endDate).getHours() < 0){
			return "Data zwrotu nie może być wcześniejsza niż data wynajęcia!";
		}else if(Hours.hoursBetween(startDate, endDate).getHours() < 2){
			return "Nie możesz wynająć auta na mniej niż 2 godziny!";
		} else {
			return "ok";
		}
		
	}

}

