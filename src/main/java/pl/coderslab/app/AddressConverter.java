package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import pl.coderslab.entities.Address;
import pl.coderslab.repositories.AddressRepository;

@Component
public class AddressConverter implements Converter<String, Address>{
	
@Autowired AddressRepository addressRepository;
	
	@Override
	public Address convert(String source) {
		Address address = addressRepository.findFirstById(Integer.parseInt(source));
		return address;
	}

}
