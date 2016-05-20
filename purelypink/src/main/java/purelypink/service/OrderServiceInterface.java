package purelypink.service;

import purelypink.model.Order;

public interface OrderServiceInterface 
{
	void addOrder(Order order);

    
	double getCustomerOrderGrandTotal(int cartId);

}
