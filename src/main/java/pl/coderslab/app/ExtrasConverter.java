package pl.coderslab.app;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		
		//I use below code to extract id number of an extras - without it converter doesn't work when user is editing existing order - 
		//it gives error like "nested exception is java.lang.NumberFormatException: For input string: "OrderExtras [id=1, name=nawigacjaTomTom, description=Nawigacja TomTom, pricePerDay=10, active=true]"]]"
		//meaning input for .parseInt is wrong
		Pattern pattern = Pattern.compile("(\\[id=+\\d{1,})");
		Matcher matcher = pattern.matcher(source);
		matcher.find();
		String sourceRegexed = (matcher.group(1).toString());
		String sourceFinal = sourceRegexed.substring(4, sourceRegexed.length());
		//System.out.println("String ostateczny: " + sourceRegexed);	
		
		Extras extras = extrasRepository.findFirstById(Integer.parseInt(sourceFinal));
		return extras;
	}

}
