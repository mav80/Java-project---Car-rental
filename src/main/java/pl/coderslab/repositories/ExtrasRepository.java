package pl.coderslab.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entities.Extras;

public interface ExtrasRepository extends JpaRepository<Extras, Long>{
	Extras findFirstById(long id);
	List<Extras> findAllByActive(boolean value);

}
