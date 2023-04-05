package api;

import org.junit.*;
import static junit.framework.TestCase.*;
import com.gargoylesoftware.htmlunit.*;

import java.io.IOException;
import java.util.ArrayList;

import org.json.JSONObject;

public class TestGlpiApi {

    private static GlpiApiCall glpiApiCall;
    private static String urlApi;
    private static String appToken;
    private static String userToken;
    private static String sessionToken;
    private static JSONObject ticketRef;
    private static int ticketRefId;
    private static int ticketsNbBefore;
    private final static int demId = 7; // MANAGER_RH

    @BeforeClass
    public static void setUpClass() throws IOException {
        GlpiApiCall glpiApiCall = new GlpiApiCall();
        urlApi = "http://localhost/glpi_10_0_6/apirest.php/";
        appToken = "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK";
        userToken = "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP"; // MANAGER_RH
        // Obtention du Token de Session
        sessionToken = glpiApiCall.getSessionToken(urlApi, appToken, userToken);
        // Initialisation de la liste des tickets avant création
        ArrayList ticketsListBefore = glpiApiCall.getTicketsList(urlApi, appToken, userToken, sessionToken);
        ticketsNbBefore = ticketsListBefore.size();
        // Création d'un ticket de référence
        ticketRef = glpiApiCall.getJsonObject(glpiApiCall.createTicket(urlApi, appToken, userToken, sessionToken, demId));
        ticketRefId = ticketRef.getInt("id");
    }

    @Before
    public void setUp() {
        glpiApiCall = new GlpiApiCall();
    }

    @AfterClass
    public static void tearDownClass() throws IOException {
        GlpiApiCall glpiApiCall = new GlpiApiCall();
        // Suppression du ticket de référence
        glpiApiCall.removeTicket(urlApi, appToken, userToken, sessionToken, ticketRefId);
    }

    @Test
    public void testGetSessionToken() {
        // Vérification que le sessionToken existe
        assert sessionToken.length() > 0;
    }

    @Test
    public void testGetTicketsList() {
        // Vérification de l'alimentation de la liste des tickets
        assertTrue("La liste de tickets est vide", ticketsNbBefore!=0);
    }

    @Test
    public void testCreateTicket() throws IOException {
        ArrayList ticketsListAfter = glpiApiCall.getTicketsList(urlApi, appToken, userToken, sessionToken);
        int ticketsNbAfter = ticketsListAfter.size();
        // Vérification du message d'ajout du ticket dans le JSONObject (response)
        assertTrue("Le ticket n'a pas été ajouté", ticketRef.getString("message").contains("Élément ajouté"));
        // Vérification de la création de l'id du ticket dans le JSONObject (response)
        assertTrue("Le ticket n'a pas été créé", ticketRef.has("id"));
        // Vérification que la liste des tickets comporte un élément supplémentaire
        assertEquals("La liste des tickets ne contient pas un élément supplémtaire", ticketsNbBefore+1, ticketsNbAfter);
        // Vérification de la présence de l'id du ticket dans la liste des tickets
        assertTrue("Le ticket de référence n'est pas dans la liste des tickets", ticketsListAfter.contains(ticketRefId));

        //assertEquals();
    }

    @Test
    public void testGetTicket() throws IOException {
        WebResponse response = glpiApiCall.getTicket(urlApi, appToken, userToken, sessionToken, ticketRefId);
        JSONObject ticket = glpiApiCall.getJsonObject(response);
        assertEquals(ticketRefId, ticket.getInt("id"));
        assertEquals("Demande droits et materiel pour Jack MARTIN",ticket.getString("name"));
    }
}