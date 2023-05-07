package helper_class;

public class ReturnDescription {
	
	  public static String get10Word(String Description) 
	  {
		 String strs[]= Description.split(" ");
		  if(strs.length>15)
		  {
			  String result="";
			  for(int i=0; i<15; i++)
			  {
				  result=result+strs[i]+" ";
			  }
			  return (result+"...");
		  }
		  else
		  {
			  return (Description+"...");
		  }
		  
	  }
}
