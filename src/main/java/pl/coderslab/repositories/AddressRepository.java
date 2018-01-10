package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.coderslab.entities.Address;

public interface AddressRepository extends JpaRepository<Address, Long>{
	Address findFirstById(long id);

}
