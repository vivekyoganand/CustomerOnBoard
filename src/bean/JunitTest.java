package bean;
import static org.junit.Assert.*;
import static net.sourceforge.jwebunit.junit.JWebUnit.*;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.DesiredCapabilities;

import org.testng.Assert;


public class JunitTest {
		
	
	WebDriver driver = newFirefoxDriver();
	//it will open the goggle page
	driver.get("http://www.google.com"); 
	//we expect the title “Google “ should be present 
	String Expectedtitle = "Google";
	//it will fetch the actual title 
	String Actualtitle = driver.getTitle();
	System.out.println("Before Assetion " + Expectedtitle + Actualtitle);
	//it will compare actual title and expected title
	Assert.assertEquals(Actualtitle, Expectedtitle);
	//print out the result
	System.out.println("After Assertion " + Expectedtitle + Actualtitle + " Title matched ");
       
	
	
		
}






