package ui.helpers;

//import ui.helpers.TestElement;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public interface TestDriver {

    public TestElement findElement(By by);

    void get(String url);

    String getCurrentUrl();

    TestElement click(By by) ;

    TestElement clickAndSendKeys(By by, String content);

    void quit();
}
