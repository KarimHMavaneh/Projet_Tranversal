package ui.pages;

import ui.helpers.*;

import org.openqa.selenium.By;

public class HomePage extends GlpiPageObject {

    //    private static final String PAGE_URL = "https://tomavt.with16.glpi-network.cloud/front/central.php";
    private static final String PAGE_URL = "http://localhost/glpi_10_0_6/front/central.php";

    public HomePage(MyTestDriver driver) {
        super(driver, PAGE_URL);
    }

    /*public CreerPageTicket creerUnTicket( ){
//        MyTestDriver test_driver = new MyTestDriver(driver);
//        TestElement assistance = test_driver.findElement(By.xpath("//*[@title= 'Assistance']"));
        driver.click( By.cssSelector(".navbar-toggler-icon") );
        driver.click( By.xpath("//*[@title= 'Assistance']") );
//        test_driver.click( By.cssSelector(".show > .menu-label") );
        driver.click(By.cssSelector("a[title= 'Cr\u00E9er un ticket']"));

        return new CreerPageTicket(driver);

    }*/

}
