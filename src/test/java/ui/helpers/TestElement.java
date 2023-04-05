package ui.helpers;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class TestElement {

    private final WebElement element;

    public TestElement(WebElement element) {
        this.element = element;
    }

    public WebElement sendKeys(String keys) {
        this.element.sendKeys(keys);
        return this.element;
    }
    public String getText(){
        return this.element.getText();
    }

    public TestElement click() {
        this.element.click();
        return null;
    }

    public TestDriver clear() {
        this.element.clear();
        return null;
    }
}
