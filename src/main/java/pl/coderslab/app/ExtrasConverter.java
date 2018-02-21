package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import pl.coderslab.entities.Extras;
import pl.coderslab.repositories.ExtrasRepository;

@Component
public class ExtrasConverter implements Converter<String, Extras>{
	
	@Autowired ExtrasRepository extrasRepository;
	
	@Override
	public Extras convert(String source) {
		Extras extras = extrasRepository.findFirstById(Integer.parseInt(source));
		return extras;
	}

}
