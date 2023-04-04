package ui.pages;

import ui.helpers.MyTestDriver;
import org.openqa.selenium.By;

public class LoginPage extends GlpiPageObject {

    //    private static final String PAGE_URL = "https://tomavt.with16.glpi-network.cloud/index.php";
    public static final String PAGE_URL_OK = "http://localhost/glpi_10_0_6/index.php";
    public static final String PAGE_URL_KO = "http://localhost/glpi_10_0_6/front/login.php";

    public static final String TEST_USER_OK = "glpi";
    public static final String TEST_PASSWORD_OK = "glpi";
    public static final String TEST_Manager_Equipe = "MANAGER_EQUIPE";
    public static final String TEST_PASSWORD_ManagerEquipe = "glpi";
    public static final String TEST_Manager_RH = "MANAGER_RH";
    public static final String TEST_PASSWORD_Manager_RH = "glpi";
    public static final String TEST_USER_KO = "toto";
    public static final String TEST_PASSWORD_KO = "toto";

    public LoginPage(MyTestDriver driver) {
        super(driver, PAGE_URL_OK);
    }

    public LoginPage gotoPage() {
        this.driver.get(PAGE_URL_OK);
        return this;
    }

    public LoginPage setUser(String username)  {
        driver.clickAndSendKeys(By.id("login_name"), username);
        return this;
    }

    public LoginPage setPassword(String password) {
        driver.clickAndSendKeys(By.cssSelector("input[type='password']"), password);
        return this;
    }

    public HomePage clickLoginButton()  {
        driver.click(By.cssSelector("button[name='submit']"));
        return new HomePage(driver);
    }

    public HomePage login(String userName, String password) {
        return new LoginPage(driver)
                .gotoPage()
                .setUser(userName)
                .setPassword(password)
                .clickLoginButton();
    }



}
