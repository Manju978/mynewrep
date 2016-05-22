package purelypink.service;

import java.util.List;

import purelypink.model.UserDetails;

public interface UserServiceInterface 
{
	void addUser(UserDetails userDetails);

	UserDetails getUserById(int user_Id);

	List<UserDetails> getAllUsers();
    
    UserDetails getUserByUsername(String user_Name);
    

}
