package helper_class;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
public static	SessionFactory factory=null;

	public static SessionFactory getFactory()
	{
		if(factory==null)
		{
			Configuration configur=new Configuration();
			configur.configure("hibernate.cfg.xml");
			 factory=configur.buildSessionFactory();
			
			}
		else
		{
			
			return factory;
		}
		
		return factory;
		
	}
	
}
