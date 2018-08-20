package com.org.SeleTest;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.Test;

public class JunitTest {

	@Test
	public void login() {
		//System.out.println("Logging into my account");
		System.setProperty("webdriver.gecko.driver", "/var/lib/jenkins/workspace/testkar/geckodriver");
		WebDriver driver = new FirefoxDriver();
		driver.get("https://www.google.com/");
		String expectedTitle="Google";
		String actualTitle=driver.getTitle();
		if(actualTitle.equals(expectedTitle)){
	        System.out.println("Test Pass");
	    }
	    else{
	        System.out.println("Test Failed");
	    }

	}
}
