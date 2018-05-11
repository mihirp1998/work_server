import java.util.*;
import java.io.*;

class HashTable
{
	public static void main(String[] args)
  	{
  		Scanner inp = new Scanner(System.in);
  		String input = inp.nextLine();
  		int hashvalue = 0;
      		int count = 0;
  		Hashtable Hashes = new Hashtable();
  		Enumeration s2h;
      System.out.println("this is "+ input);
      	while(!input.equals(" "))
  		{	int a =0,b=0;
          	for (int i=0; i<input.length(); i++)
 			{	int c = (int)input.charAt(i);
				if ((c >=65 && c <=90) ||(c >=97 && c <=122))
		        	{  a += c;  }
     			  	else if (c >=48 && c <=57)
       				{  b += c;  }
			
				hashvalue = ((a + b*2)*17+5) % 6;
				Hashes.put(input,hashvalue);
      			input = inp.nextLine();
			}
		}
		//System.out.println("no");
		s2h = Hashes.keys();
    //System.out.println(s2h.hasMoreElements());
		String str;
  		
		while(s2h.hasMoreElements()) 
    		{	
          str = (String) s2h.nextElement();
       			System.out.println(str + ": " + Hashes.get(str));
    		} 		
	}
}