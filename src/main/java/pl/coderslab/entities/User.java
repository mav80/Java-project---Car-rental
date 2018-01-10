package pl.coderslab.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String username;
	
	//@NotBlank - powoduje bład 500 przy wysłaniu pustego formularza rejestracji
	@NotNull
	@Min(18)
	@Column(nullable = false)
	private int age;
	
	//@NotBlank - powoduje bład 500 przy wysłaniu pustego formularza rejestracji
	@NotNull
	@DecimalMin(value = "100000000")
	@Column(nullable = false)
	private int phone;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String password;
	
	@NotNull
	@Column(nullable = false)
	private boolean enabled; //może służyć do np. wyłączania użytkownikowi dostępu (banowania) - użytkownik może być niewidoczny, ale nie musimy kasować wszystkich związanych z nim rekordów w bazie
	
	@NotBlank
	@NotNull
	@Email
	@Column(nullable = false, unique = true)
	private String email;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	
	

}
