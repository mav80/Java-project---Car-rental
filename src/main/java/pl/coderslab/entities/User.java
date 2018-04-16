package pl.coderslab.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "users")
@ToString(exclude="orders") //prevents stack overflow
@Data public class User {
	
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
	private java.lang.Integer age; // używamy java.lang.Integer zamiast int aby w formularzu rejestracji nie pokazywało się domyślnie 0 tylko puste pole. To samo trzeba ustawić w setterze i getterze! 
	
	//@NotBlank - powoduje bład 500 przy wysłaniu pustego formularza rejestracji
	@NotNull
	@DecimalMin(value = "100000000")
	@Column(nullable = false)
	private java.lang.Integer phone; // używamy java.lang.Integer zamiast int aby w formularzu rejestracji nie pokazywało się domyślnie 0 tylko puste pole. To samo trzeba ustawić w setterze i getterze! 
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String password;
	
	
	@NotBlank
	@NotNull
	@Email
	@Column(nullable = false, unique = true)
	private String email;
	
	@NotNull
	@Column(nullable = false)
	private boolean enabled; //może służyć do np. wyłączania użytkownikowi dostępu (banowania) - użytkownik może być niewidoczny, ale nie musimy kasować wszystkich związanych z nim rekordów w bazie
	
	@NotNull
	@Column(nullable = false)
	private boolean admin; //admin może mieć specjalne uprawnienia
	
	
	//@OneToMany(mappedBy = "user", fetch=FetchType.EAGER, cascade = CascadeType.ALL) //oryginalna linia - kaskadę trzeba określić jak poniżej, określenie jej jako .ALL powoduje że zamówienia nie usuwają się
	@OneToMany(mappedBy = "user", fetch=FetchType.EAGER, cascade =  {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH, CascadeType.REMOVE})
	private List<Order> orders = new ArrayList<>();
	
	
	
	

//	public List<Order> getOrders() {
//		return orders;
//	}
//
//	public void setOrders(List<Order> orders) {
//		this.orders = orders;
//	}
//
//	public long getId() {
//		return id;
//	}
//
//	public void setId(long id) {
//		this.id = id;
//	}
//
//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}
//
//	public String getPassword() {
//		return password;
//	}
//
//	public void setPassword(String password) {
//		this.password = password;
//	}
//
//	public boolean isEnabled() {
//		return enabled;
//	}
//
//	public void setEnabled(boolean enabled) {
//		this.enabled = enabled;
//	}
//
//	public String getEmail() {
//		return email;
//	}
//
//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//	public java.lang.Integer getAge() {
//		return age;
//	}
//
//	public void setAge(java.lang.Integer age) {
//		this.age = age;
//	}
//
//	public java.lang.Integer getPhone() { 
//		return phone;
//	}
//
//	public void setPhone(java.lang.Integer phone) {
//		this.phone = phone;
//	}
//	
//
//	public boolean isAdmin() {
//		return admin;
//	}
//
//	public void setAdmin(boolean admin) {
//		this.admin = admin;
//	}
//
//	@Override
//	public String toString() {
//		return "User [id=" + id + ", username=" + username + ", age=" + age + ", phone=" + phone + ", password="
//				+ password + ", enabled=" + enabled +  ", admin=" + admin +", email=" + email + "]";
//	}

	
	
	
	

}
