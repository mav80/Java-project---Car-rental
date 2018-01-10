package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.coderslab.entities.CarClass;

public interface CarClassRepository extends JpaRepository<CarClass, Long>{
	CarClass findFirstById(long id);

}
