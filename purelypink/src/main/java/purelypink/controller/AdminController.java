package purelypink.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import purelypink.model.Product;
import purelypink.service.ProductService;


@Controller
public class AdminController 
{

    private Path path;
@Autowired
ProductService pservice;
BindingResult result;
public void setProductService(ProductService ps)
{
	this.pservice=ps;
}
@RequestMapping(value="/admin")
public String hello(Model model)
{
	Gson gson=new Gson();
	List<Product> list = pservice.getProductList();
	System.out.println("list : "+list);
	String json=gson.toJson(list);
	System.out.println("MY JSON"+json);
	model.addAttribute("product", new Product());
    model.addAttribute("productList", json.toString());
	return "admin";
    
}
@RequestMapping(value = "/addnewproduct", method = RequestMethod.POST)
public String submit(@Valid @ModelAttribute("product")Product product, 
  BindingResult result, ModelMap model,HttpServletRequest request) {
	if(result.hasErrors())
	   {
	        return "admin";
	   }   
	   

	if(product.getProductId()== 0)
	{
          
		model.addAttribute("product", product);
	      pservice.addProduct(product);
	      MultipartFile productImage = product.getProductImage();
	        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
	        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getProductId() + ".png");

	        if(productImage != null && !productImage.isEmpty()){
	            try {
	                productImage.transferTo(new File(path.toString()));
	            } catch (Exception ex){
	                ex.printStackTrace();
	                throw new RuntimeException("Product image saving failed", ex);
	            }
	        }

	      ArrayList<Product> p= (ArrayList<Product>) pservice.getProductList();
			Gson gson=new Gson();
			String json=gson.toJson(p);
			System.out.println("ajson: "+json);
			model.addAttribute("productList",json);
	       }
	else
	{
       
    	model.addAttribute("product", product);
        pservice.editProduct(product);
        ArrayList<Product> p= (ArrayList<Product>) pservice.getProductList();
  		Gson gson=new Gson();
  		String json=gson.toJson(p);
  		System.out.println("ajson: "+json);
  		model.addAttribute("productList",json);
        
          return "admin";
        
      	  }
	return "admin";
}

@RequestMapping(value = "/deleteproduct", method = RequestMethod.POST)
public String delete(@ModelAttribute("product")Product product, 
  BindingResult result, ModelMap model) 
{
	
  model.addAttribute("product", product);
  pservice.deleteProduct(product);
  ArrayList<Product> p= (ArrayList<Product>) pservice.getProductList();
	Gson gson=new Gson();
	String json=gson.toJson(p);
	System.out.println("ajson: "+json);
	model.addAttribute("list",json);
  
    return "admin";

}
@RequestMapping(value = "/editproduct", method = RequestMethod.POST)
public String edit(@Valid @ModelAttribute("product")Product product, 
  BindingResult result, ModelMap model) 
{
  model.addAttribute("product", product);
  pservice.editProduct(product);
  ArrayList<Product> p= (ArrayList<Product>) pservice.getProductList();
	Gson gson=new Gson();
	String json=gson.toJson(p);
	System.out.println("ajson: "+json);
	model.addAttribute("productList",json);
	Gson g=new Gson();
	String j=g.toJson(product);
	model.addAttribute("productList",json);
    return "admin";
}

}
