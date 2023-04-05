package ui.helpers;

//import ui.helpers.MyTestDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.remote.RemoteWebDriver;

public class MyTestDriver implements TestDriver {

    private final RemoteWebDriver driver;

    public MyTestDriver(RemoteWebDriver driver) {
        this.driver = driver;
    }

    @Override
    public TestElement findElement(By by) {
        WebElement webElt = this.driver.findElement(by);
        scrollToElement(webElt);
//        System.out.println("Element found");
        var elt = new TestElement(webElt);
        try {
            Thread.sleep(0);
        } catch (InterruptedException e) {
            throw new RuntimeException("Sleep in findElement decorator interrupted", e);
        }
        return elt;
    }

    @Override
    public void get(String url) {
        this.driver.get(url);
    }

    @Override
    public String getCurrentUrl() {
        return this.driver.getCurrentUrl();
    }

    @Override
    public TestElement click(By by)  {
        findElement(by);

        // wait for element to be clickable
        WebDriverWait wait = new WebDriverWait(this.driver, java.time.Duration.ofSeconds(15));
        WebElement element = wait.until( ExpectedConditions.elementToBeClickable(by) );

        element.click();
//        Thread.sleep(2000);

        return new TestElement(element);
    }

    @Override
    public TestElement clickAndSendKeys(By by, String content) {
        TestElement elt = click(by);
        elt.sendKeys(content);
        return elt;
    }

    @Override
    public void quit() {
        if (driver != null) {
            driver.quit();
        }
//        this.driver.quit();
    }
      public void scrollToElement(WebElement element) {
        JavascriptExecutor jse = (JavascriptExecutor)this.driver;
        jse.executeScript("arguments[0].scrollIntoView(true);", element);
    }

    public RemoteWebDriver getDriver() {
        return driver;
    }

    public void maximizeWindow() {
        driver.manage().window().maximize();
    }
}
