package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import pl.coderslab.entities.CarClass;
import pl.coderslab.repositories.CarClassRepository;

@Component
public class CarClassConverter implements Converter<String, CarClass>{
	
	@Autowired CarClassRepository carClassRepository;
	
	@Override
	public CarClass convert(String source) {
		CarClass carClass = carClassRepository.findFirstById(Integer.parseInt(source));
		return carClass;
	}
	

}
