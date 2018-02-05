package pl.coderslab.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pl.coderslab.entities.Order;
import pl.coderslab.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findFirstByUsername(String username);
	User findFirstByEmail(String email);
	User findFirstById(long id);
	
	List<User> findAllByEnabled(boolean enabled);
	List<User> findAllByPhone(int userUserPhone);
	List<User> findAllById(long id);
	
	@Query(value = "SELECT * FROM users WHERE phone LIKE %?1% ORDER BY id ASC", nativeQuery = true)
	List<User> customFindAllByPhone(int userUserPhone);
	
	List<User> findAllByAge(int userUserAge);
	
	@Query(value = "SELECT * FROM users WHERE age LIKE %?1% ORDER BY id ASC", nativeQuery = true)
	List<User> customFindAllByAge(int userUserAge);

}
