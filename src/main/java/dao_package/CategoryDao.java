package dao_package;




import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Category;
import entities.User;

public class CategoryDao {
	public	SessionFactory factory=null;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
 public int addCategory(entities.Category cat)
 {
	Session session= factory.openSession();
	Transaction transaction= session.beginTransaction();
   int a=(Integer) session.save(cat);
   transaction.commit();
   session.close();
	return a;
	 
 }
 
 public List<Category> getAllCategory()
 {
	Session session= this.factory.openSession();
	Query query= session.createQuery("from Category");
	    List<Category> list=query.list();
	 return list;
 }
 
 public Category getSingleObject(int id)
 {
	 Session session= factory.openSession();
	Category cat= session.get(Category.class, id);
	return cat;
 }
 
 public String getCTitle(String category_title)
 {
	 String message=null;
	 System.out.println("passing value ="+category_title);
	Session session= this.factory.openSession();
	Query query= session.createQuery("from Category where categoryTitle=:t");
	query.setParameter("t",category_title);
	Category cat=(Category)query.uniqueResult();
	
	if(cat==null)
	{
	   return message="not exist";
	}
	else
	{
		 return message="exist";
	}
}
	
	
	
 
	 
}
