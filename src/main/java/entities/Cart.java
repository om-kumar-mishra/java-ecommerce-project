package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class Cart {
	
    @Id	
    @GeneratedValue(strategy =GenerationType.IDENTITY)
	private int cart_id;
	private int userId;
	@OneToOne
	@JoinColumn(name="pId")
	private Product product;
	
	public Cart(int cart_id, int userId, Product product) {
		super();
		this.cart_id = cart_id;
		this.userId = userId;
		this.product = product;
	}
	
	public Cart(int userId, Product product) {
		super();
		this.userId = userId;
		this.product = product;
	}
	public Cart() {
		super();
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Cart [cart_id=" + cart_id + ", userId=" + userId + ", product=" + product + "]";
	}
	

}
