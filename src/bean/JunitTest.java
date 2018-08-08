package bean;
import static org.junit.Assert.*;

import org.junit.Test;

public class JunitTest {
		
	
	
	@Test
		public void testOne(){
			
			System.out.println("Junit test case to test getters and setters");
			String Uname = "Admin";
			User u = new User();
			u.setUname(Uname);
			String getName = u.getUname();
			assertEquals(getName, Uname);
		
		
		}
	
		
}


