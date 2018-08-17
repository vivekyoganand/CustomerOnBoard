package bean;
import static org.junit.Assert.*;
import static net.sourceforge.jwebunit.junit.JWebUnit.*;
import org.junit.Test;

import org.openqa.selenium.remote.DesiredCapabilities;

import org.testng.Assert;


public class JunitTest {
		
	
	/*
	@Test
		public void testOne(){
			
			System.out.println("Junit test case to test getters and setters");
			String Uname = "Admin";
			User u = new User();
			u.setUname(Uname);
			String getName = u.getUname();
			assertEquals(getName, Uname);
		
		
		}*/
	@Test
	public void testOne(){
		beginAt("https://www.google.com/"); 
        
        assertTitleEquals("Google");
       
	}
	
		
}






