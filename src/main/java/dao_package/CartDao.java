package dao_package;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Cart;
import entities.Product;

public class CartDao {
	public	SessionFactory factory=null;

	/**
	 * @param factory
	 */
	public CartDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
  public int saveCart(Cart cart)
  {
	  Session session= factory.openSession();
		Transaction transaction= session.beginTransaction();
	   int id=(Integer) session.save(cart);
	   transaction.commit();
	   session.close();
		return id;
  }
  public List<Product> getProductUserById(int UserId)
  {
	  Session session=this.factory.openSession();
		 Query  query=  session.createQuery("select product from  Cart where userId=:id");
		 query.setParameter("id", UserId);
		 List<Product> product=query.list();		
		 return product;
  }
  
 public int  productDelete(int p_id) {
		
		Session session=this.factory.openSession();
		Transaction transaction=session.beginTransaction();
		 Query  query=  session.createQuery("delete from  Cart where product.pId=:id");		
		 query.setParameter("id", p_id);
		// Product product=(Product) query.uniqueResult();
	      int id=query.executeUpdate();
		 transaction.commit();
		return id;			
	}
 
 public Product getSingleObjectOfProduct(int id)
 {
	 Session session=this.factory.openSession();
	 Query query=session.createQuery("from Cart where product.pId=:id");
	 query.setParameter("id",id);
	 Product product=(Product)query.uniqueResult();
	 return product;
 }
	
}
