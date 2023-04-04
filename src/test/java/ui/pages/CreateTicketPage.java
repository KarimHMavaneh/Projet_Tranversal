package ui.pages;
import ui.helpers.*;


import org.openqa.selenium.*;

public class CreateTicketPage extends GlpiPageObject {
    private static final String url_page_ticket = "http://localhost/glpi_10_0_6/front/ticket.form.php";

    public CreateTicketPage(MyTestDriver driver) {
        super(driver, url_page_ticket);
    }

    public CreateTicketPage ticketTitleNDescription(String title, String desc) {

//        new LoginPage(this.driver).login(LoginPage.TEST_USER_OK, LoginPage.TEST_PASSWORD_OK);

//        System.out.println( driver.getCurrentUrl() );
        //driver.clickAndSendKeys(By.cssSelector("input[name='name']"), ticketObj.getString("titre"));
        driver.clickAndSendKeys(By.cssSelector("input[name='name']"), title);

        // Scrolle down to the title's element

        //15 | Change the selenium driver to the iframe
        WebDriver iframe = driver.getDriver().switchTo().frame(driver.getDriver().findElement(By.className("tox-edit-area__iframe")));
        //iframe.findElement(By.id("tinymce")).sendKeys(ticketObj.getString("content"));
        iframe.findElement(By.id("tinymce")).sendKeys(desc);
        //16 | don't forget to change the focus from iframe to the default content

        driver.getDriver().switchTo().defaultContent();
        driver.click(By.cssSelector("button[name='add']"));

        return this;

    }

    public CreateTicketPage createATicket() {
//        MyTestDriver test_driver = new MyTestDriver(driver);
//        TestElement assistance = test_driver.findElement(By.xpath("//*[@title= 'Assistance']"));
        driver.click(By.cssSelector(".navbar-toggler-icon"));
        driver.click(By.xpath("//*[@title= 'Assistance']"));
//        test_driver.click( By.cssSelector(".show > .menu-label") );
        driver.click(By.cssSelector("a[title= 'Cr\u00E9er un ticket']"));

        return new CreateTicketPage(driver);
    }

    public void specifyDate(String date) {
        driver.findElement(By.cssSelector("input.form-control.rounded-start.ps-2.input"))
                .sendKeys(date + "\n");
        driver.findElement(By.xpath("/html/body/div[2]/div/div/main/div/div/div[2]/div/div/div/div/form/div[1]/div[2]/div/div[1]/div/div/div[2]/div/span/span[1]/span/span[1]")).click();

    }
    public void specifyDemandeType(){
        driver.findElement(By.xpath("/html/body/span/span/span[2]/ul/li[2]/span")).click();
    }
    public void findNScroll() {
        WebElement span = driver.getDriver().findElement(By.xpath("/html/body/div[2]/div/div/main/div/div/div[2]/div/div/div/div/form/div[1]/div[2]/div/div[1]/div/div/div[8]/label"));
        driver.scrollToElement(span);
    }

    public void selectValidationDemand() {

        driver.click(By.xpath("/html/body/div[2]/div/div/main/div/div/div[2]/div/div/div/div/form/div[1]/div[2]/div/div[1]/div/div/div[9]/div/span[1]/span[1]"));
    }

    public void findValidator() {
//        TestElement dropBox = driver.findElement(By.xpath("//*[@id=\"item-main\"]/div/div[9]/div/span[1]/span[1]/span/span[2]"));
//        Select dropdown = new Select((WebElement) dropBox);
//        dropdown.selectByIndex(2);
        driver.click(By.xpath("/html/body/span/span/span[2]/ul/li[2]"));


    }

    public void clickValidator() {

        driver.click(By.xpath("/html/body/div[2]/div/div/main/div/div/div[2]/div/div/div/div/form/div[1]/div[2]/div/div[1]/div/div/div[9]/div/span[2]/div/span/span[1]/span/span[1]/span"));
        //find the input and send keys

        driver.findElement(By.xpath("/html/body/span/span/span[2]/ul/li[1]/span")).click();

//        driver.findElement(By.xpath("/html/body/span/span/span[1]/input")).sendKeys("\n");
//        driver.click(By.xpath("/html/body/div[2]/div/div/main/div/div/div[2]/div/div/div/div/form/div[1]/div[2]/div/div[1]/div/div/div[9]/div/span[2]/div/span/span[1]/span/span[1]"));

    }

    public void finalClick(){

        driver.click(By.xpath("/html/body/span/span/span[2]/ul/li[8]/span"));
    }
}