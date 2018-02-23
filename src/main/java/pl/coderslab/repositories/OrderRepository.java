package pl.coderslab.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pl.coderslab.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{
	
	Order findFirstById(long id);
	List<Order> findAllByIdOrderByCreated(long id);
	List<Order> findAllById(long id);
	List<Order> findByUserId(long id);
	List<Order> findByUserIdOrderByCreatedDesc(long id);
	List<Order> findAllByReferenceNumber(String referenceNumber);
	Order findOneById(long id);
	
	@Query(value = "SELECT * FROM orders JOIN users ON users_id=users.id WHERE users.username LIKE %?1% ORDER BY created DESC", nativeQuery = true)
	List<Order> customFindOrdersByUserName(String name);
	
	@Query(value = "SELECT * FROM orders JOIN users ON users_id=users.id WHERE users.email = ?1 ORDER BY created DESC", nativeQuery = true)
	List<Order> customFindOrdersByUserEmail(String email);
	
	@Query(value = "SELECT * FROM `EndProject-CarRental`.orders WHERE created BETWEEN ?1 AND ?2 ORDER BY created DESC", nativeQuery = true)
	List<Order> customFindOrdersCreatedBetweenGivenDates(String startDate, String endDate);
	
	@Query(value = "SELECT * FROM `EndProject-CarRental`.orders WHERE created BETWEEN ?1 AND ?2 ORDER BY created ASC", nativeQuery = true)
	List<Order> customFindOrdersCreatedBetweenGivenDatesAscending(String startDate, String endDate);
	
	@Query(value = "SELECT * FROM `EndProject-CarRental`.orders WHERE users.id = ?1 AND referenceNumber LIKE %?2% ORDER BY created ASC", nativeQuery = true)
	List<Order> findAllByReferenceNumberUserVersion(String referenceNumber, long userId);
	
	@Query(value = "SELECT * FROM `EndProject-CarRental`.orders ORDER BY created DESC", nativeQuery = true)
	List<Order> findAllOrderByCreatedDesc();

}
