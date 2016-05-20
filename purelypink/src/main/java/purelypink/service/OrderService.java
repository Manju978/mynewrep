package purelypink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import purelypink.dao.OrderDaoInterface;
import purelypink.model.Cart;
import purelypink.model.Item;
import purelypink.model.Order;

@Service
public class OrderService 
{
	@Autowired
    private OrderDaoInterface orderDaoInterface;

    
@Autowired
    private CartService cartService;

    
public void addOrder(Order order){
       
 orderDaoInterface.addCustomerOrder(order);
    }

    
public double getCustomerOrderGrandTotal(int cartId){
        double grandTotal = 0;
        Cart cart = cartService.getCartById(cartId);
       
 List<Item> items = cart.getCartItems();

        
for (Item item : items){
            grandTotal += item.getTotalPrice();
        }

      
  return grandTotal;
    }

} // The End of Class;



