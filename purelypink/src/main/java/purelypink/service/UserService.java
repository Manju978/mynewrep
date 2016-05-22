package purelypink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import purelypink.dao.UserDaoInterface;
import purelypink.model.UserDetails;

@Service
public class UserService  implements UserServiceInterface
{
	@Autowired
    UserDaoInterface userDaoInterface;

	@Override
	public void addUser(UserDetails userDetails) 
	{
		// TODO Auto-generated method stub
		 userDaoInterface.addUser(userDetails);
		
	}

	@Override
	public UserDetails getUserById(int user_Id) {
		// TODO Auto-generated method stub
		return userDaoInterface.getUserById(user_Id);
	}

	@Override
	public List<UserDetails> getAllUsers() {
		// TODO Auto-generated method stub
		return userDaoInterface.getAllUsers();
	}

	@Override
	public UserDetails getUserByUsername(String user_Name) {
		// TODO Auto-generated method stub
		return userDaoInterface.getUserByUsername(user_Name);
	}
	
    

}
