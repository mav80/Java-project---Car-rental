package pl.coderslab.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.coderslab.entities.Address;

public interface AddressRepository extends JpaRepository<Address, Long>{
	Address findFirstById(long id);
	
	List<Address> findAllByActive(boolean value);

}
