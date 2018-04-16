package pl.coderslab.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "carClasses")
@ToString(exclude="orders")
@Data public class CarClass {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String carClassa;
	
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String carClassDescription;
	
	
	@NotNull
	@Column(nullable = false)
	private int pricePerDay;
	
	
	
	
	@OneToMany(mappedBy = "carClass")
	private List<Order> orders = new ArrayList<>();

	
	
	@NotNull
	@Column(nullable = false)
	private boolean active;    // możemy włączyć lub wyłączyć pokazywanie danej klasy aut
	
	
	
	
	
	
	
//	public long getId() {
//		return id;
//	}
//
//	public void setId(long id) {
//		this.id = id;
//	}
//
//	public String getCarClassa() {
//		return carClassa;
//	}
//
//	public void setCarClassa(String carClassa) {
//		this.carClassa = carClassa;
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
//	public String getCarClassDescription() {
//		return carClassDescription;
//	}
//
//	public void setCarClassDescription(String carClassDescription) {
//		this.carClassDescription = carClassDescription;
//	}
//	
//	
//
//	public int getPricePerDay() {
//		return pricePerDay;
//	}
//
//	public void setPricePerDay(int pricePerDay) {
//		this.pricePerDay = pricePerDay;
//	}
//
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
//	
//
//	
//
////	@Override
////	public String toString() {
////		return "CarClass [id=" + id + ", carClass=" + carClass + ", carClassDescription=" + carClassDescription
////				+ "]";
////	}
//
//
////	@Override
////	public String toString() {
////		return "CarClass [id=" + id + ", carClass=" + carClass + ", carClassDescription=" + carClassDescription
////				+ ", pricePerDay=" + pricePerDay + "]";
////	}
//	
//	
//	@Override
//	public String toString() {
//		return "CarClass [id=" + id + ", carClassa=" + carClassa + ", carClassDescription=" + carClassDescription
//				+ ", pricePerDay=" + pricePerDay + ", active=" + active + "]";
//	}
	
	
	
	
	

}