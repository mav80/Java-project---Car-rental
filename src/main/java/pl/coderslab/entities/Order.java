package pl.coderslab.entities;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;

import pl.coderslab.repositories.CarClassRepository;
import pl.coderslab.repositories.OrderRepository;

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
	
	@ManyToMany(fetch=FetchType.EAGER)
	private List<Extras> extras = new ArrayList<>();
	
	
	
	

	@Column(nullable = false)
	private int rentLengthInDays;
	
	@Column(nullable = false)
	private int orderPrice;
	
	@NotBlank
	@NotNull
	@Column(nullable = false)
	private String referenceNumber;
	
	
	
	
	
	

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
	
	
	
	
	
	public String getReferenceNumber() {
		return referenceNumber;
	}

	public void setReferenceNumber(String referenceNumber) {
		this.referenceNumber = referenceNumber;
	}
	
	public void generateAndSetUniqueReferenceNumber(OrderRepository orderRepository) {
		
		String newGeneratedReferenceNumber = generateReferenceNumber();
		List<Order> orders = orderRepository.findAllByReferenceNumber(newGeneratedReferenceNumber);
		
		
		//sprawdzamy czy taki numer już istnieje w bazie - jeśli tak to generujemy nowy
		while(!orders.isEmpty()) {
			newGeneratedReferenceNumber = generateReferenceNumber();
			orders = orderRepository.findAllByReferenceNumber(newGeneratedReferenceNumber);
		}
		
		this.referenceNumber = newGeneratedReferenceNumber;
	}
	
	
	
	private static String generateReferenceNumber() {
		
		String allowedCharacters = "ABCDEFGHJKLMNPQRSTUWXYZ23456789";
		int referenceNumberLength = 6;
		String referenceNumber = "";
		
		Random r = new Random();
		int low = 0;
		int high = allowedCharacters.length();
		
		for(int i = 0 ; i < referenceNumberLength ; i++) {
			int result = r.nextInt(high-low) + low;
			referenceNumber = referenceNumber + allowedCharacters.charAt(result);
		}
		
		return referenceNumber;
		
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
	
	
	
	public List<Extras> getExtras() {
		return extras;
	}

	public void setExtras(List<Extras> extras) {
		this.extras = extras;
	}

	
	
	public void updatePriceWithSelectedExtras(Order order, List<Extras> extras) {
		
		int extrasPrice = 0;
		
		for(Extras extra : extras) {
			extrasPrice += extra.getPricePerDay() * order.getRentLengthInDays();
		}
		
		order.setOrderPrice(order.getOrderPrice() + extrasPrice);
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




//	@Override
//	public String toString() {
//		return "Order [id=" + id + ", created=" + created + ", pickupDate=" + pickupDate + ", returnDate=" + returnDate
//				+ ", user=" + user + ", address=" + address + ", carClass=" + carClass + ", rentLengthInDays="
//				+ rentLengthInDays + ", orderPrice=" + orderPrice + "]";
//	}




	
	@Override
	public String toString() {
		return "Order [id=" + id + ", created=" + created + ", pickupDate=" + pickupDate + ", returnDate=" + returnDate
				+ ", user=" + user + ", address=" + address + ", carClass=" + carClass + ", extras=" + extras
				+ ", rentLengthInDays=" + rentLengthInDays + ", orderPrice=" + orderPrice + ", referenceNumber="
				+ referenceNumber + "]";
	}
	
	
	
	

}
