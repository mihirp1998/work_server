import java.util.*;
public class a
{
	public static void main(String[] args)
	{
		Scanner in = new Scanner(System.in);
		String input = "";

		System.out.println(".global main");
		System.out.println("msg:");
		System.out.println(".string \"Final result of LHS var = %d\\n\"");
		System.out.println(".comm   a,4");
		System.out.println(".comm   b,4");
		System.out.println(".comm   c,4");
		System.out.println(".comm   z,4");
		System.out.println("main:");
		System.out.println("pushl   %ebp");
		System.out.println("movl    %esp, %ebp");
		
		int FinalResult = 0;

		while(true)
		{	input = in.nextLine();
			if(input.equals(" "))
				break;

			StringTokenizer st = new StringTokenizer(input," ");
			while(st.hasMoreTokens())
			{	System.out.println();
				String operator = st.nextToken();
				String arg1     = st.nextToken();
				String arg2     = st.nextToken();
				String result   = st.nextToken();
				if(operator.equals("="))
				{	System.out.print("movl ");	}
				else if(operator.equals("+"))
				{	System.out.print("addl ");	}
				
				if(Character.isDigit(arg1.charAt(0)))
				{	System.out.print("$"+arg1);	
					FinalResult += Integer.parseInt(arg1);
				}
				else if(arg1.equals("eax"))
				{	System.out.print("%"+arg1);	}
				else
				{	System.out.print(arg1);		}

				if(result.equals("eax"))
				{       System.out.print(", %"+result);     }
				else
				{       System.out.print(" ,"+result);        }

			}
		}
		System.out.println("\npushl   z");
		System.out.println("pushl   $msg");
		System.out.println("call    printf");
		System.out.println("leave");
		System.out.println("ret");

		System.out.println("Final Result of LHS variable :"+FinalResult);

	}
}
