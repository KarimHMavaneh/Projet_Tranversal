package ui.helpers;

import org.openqa.selenium.WebDriver;
import ui.pages.HomePage;
import ui.pages.LoginPage;
import ui.helpers.MyTestDriver;

public class Helpers {

    public static HomePage login(MyTestDriver driver, String username, String password) {
        return new LoginPage(driver)
                .gotoPage()
                .setUser(username)
                .setPassword(password)
                .clickLoginButton();
    }
}
