package purelypink.dao;

import java.util.List;

import purelypink.model.UserDetails;

public interface UserDaoInterface
{
	void addUser(UserDetails userDetails);

    UserDetails getUserById(int user_Id);

    List<UserDetails> getAllUsers();

    UserDetails getUserByUsername(String user_Name);


}
