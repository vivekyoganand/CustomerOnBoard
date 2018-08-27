package com.org.SeleTest;

import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;


public class JunitTest {

	@Test
	public void login() throws Exception {
		System.out.println("Logging into my account");
		//System.setProperty("webdriver.gecko.driver", "/Users/krajput2/Documents/SOfts/geckodriver");
		WebDriver driver = new HtmlUnitDriver(true);
		((HtmlUnitDriver) driver).setJavascriptEnabled(true);
		driver.get("http://10.0.0.10:9090/CustomerOnBoard/index1.jsp");
		String expectedTitle="CustomerOnBoarding for DXC";
		System.out.println("Expected Title: "+expectedTitle);
		String actualTitle=driver.getTitle();
		if(actualTitle.equals(expectedTitle)){
	        System.out.println("Test Pass");
			
	    }
	    else{
	        System.out.println("Test Fail");
	    }
		
		/* HtmlUnitDriver unitDriver = new HtmlUnitDriver();
		 
		// open google.com webpage
		unitDriver.get("http://google.com");
 
		System.out.println("Title of the page is -> " + unitDriver.getTitle());
 
		// find the search edit box on the google page
		WebElement searchBox = unitDriver.findElement(By.name("q"));
 
		// type in Selenium
		searchBox.sendKeys("Selenium");
 
		// find the search button
		WebElement button = unitDriver.findElement(By.name("gbqfba"));
 
		// Click the button
		button.click();
 
		System.out.println("Title of the page is -> " + unitDriver.getTitle());
		*/
	}
}
