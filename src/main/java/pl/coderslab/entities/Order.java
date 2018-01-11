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

	@Override
	public String toString() {
		return "Order [id=" + id + ", created=" + created + ", pickupDate=" + pickupDate + ", returnDate=" + returnDate
				+ ", user=" + user + ", address=" + address + ", carClass=" + carClass + "]";
	}

//	@Override
//	public String toString() {
//		return "Order [id=" + id + ", created=" + created + ", pickupDate=" + pickupDate + ", returnDate=" + returnDate+"]";
//	}
	
	
	
	
	
	

}
