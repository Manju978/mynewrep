package purelypink.dao;

import java.util.List;

import purelypink.model.ProductModel;

public interface ProductDaoInterface 
{
	public List<ProductModel> getproductlist();
	public void saveProduct(ProductModel prod);
	public void addProduct(ProductModel p);
    public void updateProduct(ProductModel p);
    
    public void removeProduct(int id);


}
