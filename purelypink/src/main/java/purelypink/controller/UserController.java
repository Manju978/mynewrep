package purelypink.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import purelypink.model.Address;
import purelypink.model.UserDetails;
import purelypink.service.UserServiceInterface;

@Controller
public class UserController 
{
	@Autowired
    UserServiceInterface userServiceInterface;
	@RequestMapping("/address")
    
	public String registerUser(Model model){
	       
	 UserDetails userDetails = new UserDetails();
	        
	Address address = new Address();
	        
	        userDetails.setBillingAddress(address);
	
	        
	model.addAttribute("userDetails", userDetails);

	        
	return "address";
	   
	}
	@RequestMapping(value = "/address", method = RequestMethod.POST)
    
	public String registerUserPost(@Valid @ModelAttribute("userDetails") UserDetails userDetails, BindingResult result, Model model){

	        
	if(result.hasErrors())
	{
	           
	 return "address";
	}

	     
	  //userDetails.setEnabled(true);
	      
	  userServiceInterface.addUser(userDetails);;
	        
	return "registerCustomerSuccess";
	    }

	
}
