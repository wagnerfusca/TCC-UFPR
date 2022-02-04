package chat;

import java.util.*;
import java.text.*;

public class Date {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception 
	{
			Date date = new Date( Long.parseLong("1123606800") * 1000l);
			System.out.println(date);
			
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss");
			
			System.out.println( sdf1.format(date) + "---" + sdf2.format(date) );
			
			Date d1 =  sdf1.parse("12/12/2004");
			
			System.out.println( d1 + " " + d1.getTime() );

			
	}

}
