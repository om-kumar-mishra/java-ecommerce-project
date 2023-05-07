package dao_package;

import java.util.List;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Product;
import entities.User;

public class RegisterDao {
	SessionFactory factory;

	/**
	 * @param factory
	 */
	public RegisterDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int registerSave(User user)
	{
		Session session=this.factory.openSession();
	    Transaction transaction=session.beginTransaction();
		int id=(Integer) session.save(user);
		transaction.commit();
		session.close();
		return id;
	}
	 public String getUserEmail(String email)
	 {
		 String message=null;
		 System.out.println("passing value ="+email);
		Session session= this.factory.openSession();
		
		Query query= session.createQuery("from User where userEmail=:e");
		
		query.setParameter("e",email);
	User user=	(User) query.uniqueResult();
	
		System.out.println("object of user ="+user);
		if(user==null)
		{
			 return message="not exist";
		}
		else
		{
			 
			 return message="exist";
		}
	}
	 
	    public List<User> getAllUser()
		{
			Session session=this.factory.openSession();
			 Query  query=  session.createQuery("from  User");
			
			 List<User> user=query.list();
			
			 return user;
          }
	    
	    public int updateAddress(String new_address , int id)
		{
			Session session=this.factory.openSession();
			Transaction transaction= session.beginTransaction();
			 Query  query=  session.createQuery("update User set userAddress=:address where userId=:id");
			 query.setParameter("address", new_address);
			 query.setParameter("id", id);
			 int addressId=query.executeUpdate();
			
			
			transaction.commit();
			 return addressId;
          }
	    
}