package bean;
import static org.junit.Assert.*;
import static org.junit.Assert.*;
import org.junit.Test;
import java.lang.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
//import org.testng.annotations.Test;
import org.testng.Assert;
import org.junit.Test;

public class JunitTest {
		
	
	
	/*@Test
		public void testOne(){
			
			System.out.println("Junit test case to test getters and setters");
			String Uname = "Ashwini";
			User u = new User();
			u.setUname(Uname);
			String getName = u.getUname();
			assertEquals(getName, Uname);
		
		
		}*/
	/*@Test
		public void testOne(){
			beginAt("http://localhost:8080/CustomerOnBoard/index1.jsp"); 
	       		Assert.assertTitleEquals("Registration Form");
		}*/
	
	WebDriver driver=new FirefoxDriver();
    	String baseUrl="http://www.google.com";
    	String expectedTitle="Google";
    	driver.get(baseUrl);
    	String actualTitle=driver.getTitle();
    	if(actualTitle.equals(expectedTitle)){
        		System.out.println("Test Pass");
    		}
   	else{
        		System.out.println("Test Failed");
    		}
	
	
	
		
}
