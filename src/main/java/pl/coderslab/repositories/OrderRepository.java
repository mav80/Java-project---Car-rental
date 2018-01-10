package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.coderslab.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{
	
	Order findFirstById(long id);

}
