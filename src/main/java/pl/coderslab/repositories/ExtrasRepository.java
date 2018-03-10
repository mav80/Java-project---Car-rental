package pl.coderslab.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pl.coderslab.entities.Extras;

public interface ExtrasRepository extends JpaRepository<Extras, Long>{
	Extras findFirstById(long id);
	List<Extras> findAllByActive(boolean value);
	List<Extras> findAllById(long id);
	
	@Query(value = "SELECT * FROM extras JOIN orders_extras ON id=extras_id WHERE orders_id = ?1", nativeQuery = true)
	List<Extras> findAllByOrderId(long id);

}
