package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import pl.coderslab.entities.User;
import pl.coderslab.repositories.UserRepository;

@Component
public class UserConverter implements Converter<String, User>{
	@Autowired UserRepository userRepository;
	
	@Override
	public User convert(String source) {
		User user = userRepository.findFirstById(Integer.parseInt(source));
		return user;
	}

}
