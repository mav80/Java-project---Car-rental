package pl.coderslab.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "addresses")
@ToString(exclude="orders")
@Data public class Address { //@Data - projekt lombok - automatycznie generuje gettery, settery, toString, eguals/hascode oraz konstruktory
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String name;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String street;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String city;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String zipCode;
	
	@OneToMany(mappedBy = "address",fetch=FetchType.EAGER)
	private List<Order> orders = new ArrayList<>();
	
	@NotNull
	@Column(nullable = false)
	private boolean active;    // możemy włączyć lub wyłączyć pokazywanie danego adresu
	
	
	
	
	

//	public long getId() {
//		return id;
//	}
//
//	public void setId(long id) {
//		this.id = id;
//	}
//
//	public String getName() {
//		return name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//	public String getStreet() {
//		return street;
//	}
//
//	public void setStreet(String street) {
//		this.street = street;
//	}
//
//	public String getCity() {
//		return city;
//	}
//
//	public void setCity(String city) {
//		this.city = city;
//	}
//
//	public String getZipCode() {
//		return zipCode;
//	}
//
//	public void setZipCode(String zipCode) {
//		this.zipCode = zipCode;
//	}
//
//	public List<Order> getOrders() {
//		return orders;
//	}
//
//	public void setOrders(List<Order> orders) {
//		this.orders = orders;
//	}
//
//	public boolean isActive() {
//		return active;
//	}
//
//	public void setActive(boolean active) {
//		this.active = active;
//	}
//
//
//
////	@Override
////	public String toString() {
////		return "Address [id=" + id + ", name=" + name + ", street=" + street + ", city=" + city + ", zipCode=" + zipCode
////				+ "]";
////	}
//	
//	//tego poniżej używamy - nie zawiera "orders" aby nie wpaść w pętlę i nie przepełnić bufora
//	@Override
//	public String toString() {
//		return "Address [id=" + id + ", name=" + name + ", street=" + street + ", city=" + city + ", zipCode=" + zipCode
//				+ ",  active=" + active + "]";
//	}
//	
//	
////	@Override
////	public String toString() {
////		return "Address [id=" + id + ", name=" + name + ", street=" + street + ", city=" + city + ", zipCode=" + zipCode
////				+ ", orders=" + orders + ", active=" + active + "]";
////	}
	
	
	
	

	
	
	
	

}
