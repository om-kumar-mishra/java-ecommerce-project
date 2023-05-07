package dao_package;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Product;

public class ProductDao {
	SessionFactory factory;

	/**
	 * @param factory
	 */
	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public int saveProduct(Product product)
	{
		Session session=this.factory.openSession();
	    Transaction transaction=session.beginTransaction();
		int id=(Integer) session.save(product);
		transaction.commit();
		session.close();
		return id;
	}
	
	public List<Product>  getAllProduct()
	{
		Session session=this.factory.openSession();
	 Query  query=  session.createQuery("from  Product");
	 List<Product> product=query.list();
	 return product;
	}
	
	public List<Product> getAllProductById(int cid)
	{
		Session session=this.factory.openSession();
		 Query  query=  session.createQuery("from  Product where category.categoryId=:id");
		 query.setParameter("id", cid);
		 List<Product> product=query.list();
		
		 return product;
	}

	public Product getSingleProduct(int p_id) {
		
		Session session=this.factory.openSession();
		 Query  query=  session.createQuery("from  Product where pId=:id");
		 query.setParameter("id", p_id);
		 Product product=(Product) query.uniqueResult();
		 return product;
		// TODO Auto-generated method stub
		
	}
	
     
}
