package dao_package;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.User;
import helper_class.FactoryProvider;

public class UserDao {
public	SessionFactory factory=null;

public UserDao(SessionFactory factory) {
	super();
	this.factory =  factory;
}

public User validEmailAndPasssword(String email, String password) {
	User user=null;
	Session session=factory.openSession();
//	Transaction transaction=session.beginTransaction();
Query q=session.createQuery(" from User where user_email=:e and user_password=:p");
q.setParameter("e",email);
q.setParameter("p",password);
	 user=(User) q.uniqueResult();
	 
	session.close();
	return user;
}
 


}
