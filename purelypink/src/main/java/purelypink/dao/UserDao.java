package purelypink.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import purelypink.model.UserDetails;

@Repository
@Transactional
public class UserDao implements UserDaoInterface
{
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void addUser(UserDetails userDetails) {
		Session session = sessionFactory.getCurrentSession();

        
		userDetails.getBillingAddress().setUserDetails(userDetails);;
		        
		userDetails.getBillingAddress().setUserDetails(userDetails);

		        
		session.saveOrUpdate(userDetails);
		        
		
	}

	@Override
	public UserDetails getUserById(int user_Id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserDetails> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDetails getUserByUsername(String user_Name) {
		// TODO Auto-generated method stub
		return null;
	}

}
