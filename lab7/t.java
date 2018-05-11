import java.util.*;

public class a
{	
	public static String num_regex = "\\d+";
	public static String id_regex  = "[a-zA-z]+[0-9]*";
	public static String term_regex = num_regex+"|"+id_regex;
	public static String expr_regex = "("+term_regex+")(-("+term_regex+"))*"; 
	public static String Stmt_regex = id_regex+"="+expr_regex;
	
	
	public static boolean isId(String t)
	{	return t.matches(id_regex);	}
	
	public static boolean isNumber(String t)
	{	return t.matches(num_regex);	}
	
	public static boolean isStmt(String t)
	{	return t.matches(Stmt_regex);	}
	
	public static boolean isExpr(String t)
	{	return t.matches(expr_regex);	}
	
	public static boolean isTerm(String t)
	{	return t.matches(term_regex);	}
	
	public static void printRow(String i,String o,String a1,String a2,String r)
	{		System.out.println();
			System.out.print("|| "+i);
			System.out.print("\t\t || "+o);
			System.out.print("\t\t || "+a1);
			System.out.print("\t\t || "+a2);
			System.out.print("\t\t || "+r);
-
	}
	public static void main(String[] args)
	{		
		Scanner in = new Scanner(System.in);
		String input = in.nextLine();

		if(input.matches(Stmt_regex))
		{	System.out.println(input+" is a valid Statement");	}
		else
		{	System.out.println(input+" is an invalid Statement\nTry again");	
			return;
		}
		System.out.print("|| INPUT\t\t || OP\t\t || ARG1\t || ARG2\t || RESULT");
		String[] token = input.split("=");
		String[] expr_token = token[1].split("-");
		
		int count = 0;

		if(expr_token.length == 1)
		{	
			printRow(input,"=",token[1],"nill",token[0]);
			return;
		}
		else
		{	String pretemp="";
			String temp="";
			for(int i = 0; i < expr_token.length-1; i++)
			{	pretemp = "temp"+count++;
				temp = "temp"+count;
				if( i==0 )
				{	printRow("        ","-",expr_token[i],expr_token[i+1],temp);	}
				else
				{	printRow("        ","-",pretemp,expr_token[i+1],temp);	}
			}
			printRow(input,"=",temp,"nil",token[0]);
		}
		
		
	}
}
