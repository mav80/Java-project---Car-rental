package pl.coderslab.entities;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;

import pl.coderslab.repositories.CarClassRepository;

@Entity
@Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@CreationTimestamp
	@Column(updatable=false)
	private Timestamp created;
	
	//@NotBlank
	@NotNull
	@Column(nullable = false)
	private Timestamp pickupDate;
	
	//@NotBlank
	@NotNull
	@Column(nullable = false)
	private Timestamp returnDate;
	
	@ManyToOne
	@JoinColumn(name = "users_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "addresses_id")
	private Address address;
	
	@ManyToOne
	@JoinColumn(name = "carClasses_id")
	private CarClass carClass;
	
	
	
	

	@Column(nullable = false)
	private int rentLengthInDays;
	
	@Column(nullable = false)
	private int orderPrice;
	
	
	
	
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}


	public Timestamp getPickupDate() {
		return pickupDate;
	}

	public void setPickupDate(Timestamp pickupDate) {
		this.pickupDate = pickupDate;
	}

	public Timestamp getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public CarClass getCarClass() {
		return carClass;
	}

	public void setCarClass(CarClass carClass) {
		this.carClass = carClass;
	}
	
	public int getRentLengthInDays() {
		return rentLengthInDays;
	}

	public void setRentLengthInDays(int rentLengthInDays) {
		this.rentLengthInDays = rentLengthInDays;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	
	public void calculateAndSetNumberOfDaysAndPrice(Order order, CarClassRepository carClassRepository) {
		DateTime startDate = new DateTime(order.getPickupDate());
		DateTime endDate = new DateTime(order.getReturnDate());
		
		int rentLengthInDays = Days.daysBetween(startDate, endDate).getDays();
		if(Hours.hoursBetween(startDate, endDate).getHours() % 24 != 0) { 		// jeśli zostają jakieś luźne godziny to znaczy że zaczęty jest następny dzień i liczymy go jako dodatkowy pełny dzień wynajmu
			rentLengthInDays++;
		}
		int orderPrice = rentLengthInDays * carClassRepository.findFirstById( order.getCarClass().getId() ).getPricePerDay(); //cenę musimy pobrać z załadowanej z bazy klasy samochodu ponieważ klasa samochodu noto utworzonego zamówienia posiada tylko id, pozostałe pola są null
		order.setRentLengthInDays(rentLengthInDays);
		order.setOrderPrice(orderPrice);
	}
	
//	@Override
//	public String toString() {
//		return "Order [id=" + id + ", created=" + created + ", pickupDate=" + pickupDate + ", returnDate=" + returnDate+"]";
//	}
	
	

//	@Override
//	public String toString() {
//		return "Order [id=" + id + ", created=" + created + ", pickupDate=" + pickupDate + ", returnDate=" + returnDate
//				+ ", user=" + user + ", address=" + address + ", carClass=" + carClass + "]";
//	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", created=" + created + ", pickupDate=" + pickupDate + ", returnDate=" + returnDate
				+ ", user=" + user + ", address=" + address + ", carClass=" + carClass + ", rentLengthInDays="
				+ rentLengthInDays + ", orderPrice=" + orderPrice + "]";
	}


	
	
	
	
	
	

}
