package ui;

import ui.helpers.*;
import ui.pages.*;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;

//
import org.json.JSONObject;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.junit.*;
import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class TestGlpiUi {

    public static String title =  "Kamkam RH";
    public static String desc =  "Mananger d'equipe veuillez valider la fiche de demande s'il vous plait. \n   Cordialement  \n  Carole Manager RH";
    public static String response = "Validate or Refuse :Hello Manager RH, I confirme your demande \n Thank you, \n Manager Equipe ";


    //    private HomePage page = null;
    private static HomePage page = null;
    private static MyTestDriver driver = null;

    @BeforeClass
    public static void setupWebdriverChromeDriver() {
        System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir") + "/src/test/resources/chromedriver.exe");
    }


    @Before
    public void setup() throws InterruptedException {
        this.driver = new MyTestDriver(new ChromeDriver());

//        this.driver = new MyTestDriver(new FirefoxDriver());
//      this.driver.maximizeWindow();

    }


    @After
    public void tearDown() throws InterruptedException {
        Thread.sleep(3000);
        Optional.ofNullable(page).map(GlpiPageObject::close);

    }

    @Test
    public void testSuccessLoginToGlpi() throws InterruptedException {
        this.page = new LoginPage(this.driver).login(LoginPage.TEST_USER_OK, LoginPage.TEST_PASSWORD_OK);

        // Assert
        assertEquals(
                "The home page is expected",
                page.getExpectedUrl(),
                page.getCurrentUrl()
        );
    }

//    @Test
//    public void testFailLoginToGlpi() throws InterruptedException {
//        this.page = new LoginPage(this.driver).login(LoginPage.TEST_USER_KO, LoginPage.TEST_PASSWORD_KO);
//        Thread.sleep(3000);
//
//        assertEquals(
//                "Authentification échouée mais pas sur page de reconnexion",
//                page.getCurrentUrl(),
//                LoginPage.PAGE_URL_KO
//        );
//    }

    @Test
    public void testCreateTicket() throws InterruptedException {
        this.page = new LoginPage(this.driver).login(LoginPage.TEST_Manager_RH, LoginPage.TEST_PASSWORD_Manager_RH);
        CreateTicketPage page= new CreateTicketPage(this.driver).createATicket();
        Thread.sleep(3000);
        page.specifyDate("2023-04-03 12:00:00");
        Thread.sleep(2000);
        page.specifyDemandeType();
        Thread.sleep(3000);
        page.findNScroll();
        Thread.sleep(3000);
        page.selectValidationDemand();
        Thread.sleep(3000);
        page.findValidator();
        Thread.sleep(5000);
        page.clickValidator();
        Thread.sleep(3000);
        page.finalClick();
        Thread.sleep(5000);
        page.ticketTitleNDescription(title, desc);
        Thread.sleep(3000);
        //get the inner text of the webelements
        TestElement element = this.driver.findElement(By.id("messages_after_redirect"));
        String innerText = element.getText();
        //Check if the innerText contains the ticket's title
//        System.out.println("Text = " + innerText.contains("Kamkam RH"));
        assertTrue("The innerText should contain ticket's title : Élément ajouté + title", innerText.contains(title));
    }
//    @Test
//    public void testValidateTicket() throws InterruptedException{
//        this.page = new LoginPage(this.driver).login(LoginPage.TEST_Manager_Equipe, LoginPage.TEST_PASSWORD_ManagerEquipe);
//        TicketsPage page= new TicketsPage(this.driver).ticketsListPage();
//        Thread.sleep(2000);
//        page.selectTicket(223);
//        Thread.sleep(4000);
//        page.ticketResponse(response);
//        Thread.sleep(5000);
//        page.approveIt();
//        Thread.sleep(4000);
//        TestElement ticketElement = this.driver.findElement(By.cssSelector("span.badge.user-select-auto.text-wrap.ms-1.d-none.d-md-block"));
//        String expectedMsg = ticketElement.getText();
//        System.out.println("confimration : " + expectedMsg);
////        String expectedMsg = "Dernière mise à jour : À l'instant par MANAGER_EQUIPE";
//        //WE can not validate a ticket more than three timees
//        assertTrue("Derniere mise a jour", expectedMsg.contains("par MANAGER_EQUIPE"));
//
//    }
//    @Test
//    public void testRefuseTicket() throws InterruptedException{
//        this.page = new LoginPage(this.driver).login(LoginPage.TEST_Manager_Equipe, LoginPage.TEST_PASSWORD_ManagerEquipe);
//        TicketsPage page= new TicketsPage(this.driver).ticketsListPage();
//        Thread.sleep(2000);
//        page.selectTicket(225);
//        Thread.sleep(4000);
//        page.ticketResponse(response);
//        Thread.sleep(5000);
//        page.refuseIt();
//        Thread.sleep(4000);
//        TestElement ticketElement = this.driver.findElement(By.xpath("/html/body/div[2]/div/div/main/div/div/div[2]/div[2]/div/div[1]/div/div[1]/div[1]/div/div[10]/div/div[3]/div/div/div[2]"));
//        String expectedMsg = ticketElement.getText();
//        System.out.println("confimration : " + expectedMsg);
////        String expectedMsg = "Dernière mise à jour : À l'instant par MANAGER_EQUIPE";
//        //WE can not validate a ticket more than three timees
//        assertTrue("Réponse à une demande de validation: Refusee", expectedMsg.contains("Refusée"));
//
//    }


//    @Test
//    public void testModifyTicket() throws InterruptedException{
//        this.page = new LoginPage(this.driver).login(LoginPage.TEST_USER_OK, LoginPage.TEST_PASSWORD_OK);
//        TicketsPage page= new TicketsPage(this.driver).ticketsListPage();
//        Thread.sleep(4000);
//        page.selectTicket(47);
//        Thread.sleep(3000);
//        page.switchToIframe();
//        Thread.sleep(5000);
//        page.modifyTicket(response);
//        Thread.sleep(6000);
////        page.confirm();
//        TestElement element = this.driver.findElement(By.id("messages_after_redirect"));
//        String innerText = element.getText();
////        //Check if the innerText contains the ticket's title
//        System.out.println("Text = " + innerText.contains(LoginPage.TEST_USER_OK));
//        assertTrue("The user's name doesn't contain in the innerText", innerText.contains(title));
//
//
//    }

}
