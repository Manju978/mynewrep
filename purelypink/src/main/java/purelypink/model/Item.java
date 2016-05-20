package purelypink.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="itempurchased")
public class Item {

	 @Id
	    @GeneratedValue
	    private int cartItemId;

	    @ManyToOne(targetEntity=Cart.class)
	    @JoinColumn(name = "cartId")
	    
	    private Cart cart;

	    @ManyToOne
	    @JoinColumn(name = "productId")
	    private ProductModel product;

	    private int quantity;
	    private double totalPrice;


	    public int getCartItemId() {
	        return cartItemId;
	    }

	    public void setCartItemId(int cartItemId) {
	        this.cartItemId = cartItemId;
	    }

	    public Cart getCart() {
	        return cart;
	    }

	    public void setCart(Cart cart) {
	        this.cart = cart;
	    }

	    public ProductModel getProduct() {
	        return product;
	    }

	    public void setProduct(ProductModel product) {
	        this.product = product;
	    }

	    public int getQuantity() {
	        return quantity;
	    }

	    public void setQuantity(int quantity) {
	        this.quantity = quantity;
	    }

	    public double getTotalPrice() {
	        return totalPrice;
	    }

	    public void setTotalPrice(double totalPrice) {
	        this.totalPrice = totalPrice;
	    }
	    
	} // The End of Class;
