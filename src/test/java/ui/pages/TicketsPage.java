package ui.pages;

import ui.helpers.MyTestDriver;
import ui.helpers.TestElement;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

public class TicketsPage extends GlpiPageObject {
    private static final String url_page_tickets_page = "http://localhost/glpi_10_0_6/front/ticket.php";
    public TicketsPage(MyTestDriver driver) {

        super(driver, url_page_tickets_page);
    }

    public TicketsPage selectTicket(int ticket_id) {

           driver.findElement(By.cssSelector("a#Ticket"+ticket_id)).click();
        return this;

    }


    public TicketsPage ticketResponse(String response){
//        driver.click(By.cssSelector("button.btn.btn-primary.answer-action.mb-2"));
        // Change the selenium driver's focus to the iframe
        WebDriver iframe  = driver.getDriver().switchTo().frame(driver.getDriver().findElement(By.cssSelector(".tox-edit-area__iframe")));
        iframe.findElement(By.id("tinymce")).sendKeys(response);
        // don't forget to change the focus from iframe to the default content
        driver.getDriver().switchTo().defaultContent();


        return this;
    }
    public void approveIt(){
        driver.click(By.cssSelector("button.btn.btn-outline-green"));
    }
    public void refuseIt(){
        driver.click(By.cssSelector("button.btn.btn-outline-red"));

    }
    public TicketsPage switchToIframe(){
         //We need to perform mouse hover action to enable the elements inside the card body
//        Actions action = new Actions((WebDriver) driver);
//        action.moveToElement((WebElement) driver.findElement(By.cssSelector(".card-body")));
         driver.findElement(By.cssSelector(".card-body")).click();
         driver.click(By.cssSelector("button.btn.btn-sm.btn-ghost-secondary.timeline-more-actions"));
         driver.click(By.cssSelector("a.dropdown-item.edit-timeline-item"));

        // Change the selenium driver's focus to the iframe #tinymce > p:nth-child(1)
        WebElement iframe = driver.getDriver().findElement(By.cssSelector(".tox-edit-area__iframe"));
        driver.getDriver().switchTo().frame(iframe);


        return this;

    }
    public TicketsPage modifyTicket(String response){ ////body[@id='tinymce']/p:nth-child(1)
        TestElement tinymce = driver.findElement(By.id("tinymce"));
//        iframe.findElement(By.tagName("p")).clear();
//        List<WebElement> paragraphs = driver.getDriver().findElements(By.tagName("p"));
//        for (int i = 0; i <paragraphs.size() ; i++) {
//                paragraphs.get(0).clear();
//
//        }

//        System.out.println(paragraphs);
//        String actualContent = iframe.findElement(By.id("tinymce")).getText();
//        System.out.println("Text=" + actualContent);
        JavascriptExecutor jse = (JavascriptExecutor)  driver.getDriver();
        jse.executeScript("document.body.innerHTML='hello_text'");
//        // don't forget to change the focus from iframe to the default content
        driver.getDriver().switchTo().defaultContent();//#itil-object-container > div.row.d-flex.flex-column.alin-items-stretch.itil-object > div.itil-left-side.col-12.col-lg-8.order-last.order-lg-first.pt-2.pe-2.pe-lg-4.d-flex.flex-column-reverse.border-top.border-4 > div > div.timeline-item.mb-3.ITILContent > div > div.col-12.col-sm > div > div > div.edit-content.collapse > div > form > div.d-flex.card-footer.mx-n3.mb-n3 > button
        driver.click(By.cssSelector("button.btn.btn-primary.me-2"));
        return this;
    }

    public void confirm(){
        driver.click(By.cssSelector("button.btn.btn-primary"));
    }

    public TicketsPage ticketsListPage( ){
        //go to the tickets page
        driver.click( By.cssSelector(".navbar-toggler-icon") );
        driver.click( By.xpath("//*[@title= 'Assistance']") );
        driver.click(By.cssSelector("a[title= 'Tickets']"));
        return new TicketsPage(driver);
    }

}
