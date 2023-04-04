package api;

import org.junit.*;
import static junit.framework.TestCase.*;
import static org.junit.Assert.assertNotEquals;
import com.gargoylesoftware.htmlunit.*;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class TestGlpiApi {

    String urlApi = "http://localhost/glpi_10_0_6/apirest.php/";
    String appToken = "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK";
    String userToken = "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP";
    int id = 185;
    int demId = 7; // MANAGER_RH
    int ass1Id = 9; // RESP_TECHNIQUE
    int ass2Id = 10; // ADMIN_SYS
    int validId = 8; // MANAGER_EQUIPE
    String sessionToken = "s1d3q9e5kl5sg1t8a9ejdp120m";
    int ticketId;

    @Before


    @BeforeClass
    public static void initialisation() {

    }

    @AfterClass

    @After

    @Test
    public void testGetSessionToken() throws IOException {
        URL url = new URL(urlApi + "initSession");
        GlpiApiCall glpiApiCall = new GlpiApiCall();
        WebResponse response = glpiApiCall.sendHttpRequest(url, HttpMethod.GET, appToken,
                userToken, null, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);
        JSONObject jsonObject = glpiApiCall.getJsonObject(response);
        sessionToken = jsonObject.getString("session_token");
        System.out.println(sessionToken);
        // Appel init session et vérification que le json contient un token
        assertTrue("Le session token existe",jsonObject.has("session_token"));
    }

    @Test
    public void testGetTicketsList() throws IOException {
        URL url = new URL(urlApi + "ticket");
        GlpiApiCall glpiApiCall = new GlpiApiCall();
        WebResponse response = glpiApiCall.sendHttpRequest(url, HttpMethod.GET, appToken,
                userToken, sessionToken, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);
        JSONArray ticketsArray = glpiApiCall.getJsonArray(response);
        int ticketsNb = ticketsArray.length();
        JSONObject lastTicket = ticketsArray.getJSONObject(ticketsNb-1);
        int lastTicketId = lastTicket.getInt("id");
        System.out.println(lastTicketId);
        assertEquals(200, response.getStatusCode());
    }

    @Test
    public void testCreateTicket() throws IOException {
        URL url = new URL("http://localhost/glpi_10_0_6/apirest.php/ticket");
        GlpiApiCall glpiApiCall = new GlpiApiCall();
        WebResponse response = glpiApiCall.sendHttpRequest(url, HttpMethod.POST, "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK",
                "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP", "atffg3pvso75croarqkd6fgp7t",
                "{" +
                        "\"input\": {" +
                        "\"name\": \"Creation ticket Code\"," +
                        "\"content\":\"POST Ticket\"," +
                        "\"type\":2," +
                        "\"users_id_recipient\":8}" +
                        "}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null
        );
        JSONObject ticket = glpiApiCall.getJsonObject(response);
        assertTrue(ticket.has("id"));
        assertTrue(ticket.getString("message").contains("Élément ajouté"));
        ticketId = ticket.getInt("id");
    }

    @Test
    public void testGetTicket() throws IOException {
        URL url = new URL("http://localhost/glpi_10_0_6/apirest.php/ticket/186");
        GlpiApiCall glpiApiCall = new GlpiApiCall();
        WebResponse response = glpiApiCall.sendHttpRequest(url, HttpMethod.GET, "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK",
                "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP", "atffg3pvso75croarqkd6fgp7t", null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);

        JSONObject ticket = glpiApiCall.getJsonObject(response);
        int ticketId = ticket.getInt("id");
        String ticketName = ticket.getString("name");
        int ticketStatus = ticket.getInt("status");
        String ticketContent = ticket.getString("content");
        int ticketType = ticket.getInt("type");
        int ticketValid = ticket.getInt("global_validation");
        assertEquals(186, ticketId);
        assertEquals("Creation ticket Code", ticketName);
        assertEquals(1, ticketStatus);
        assertEquals("POST Ticket", ticketContent);
        assertEquals(2, ticketType);
        assertEquals(1, ticketValid);
    }

    @Test
    public void testRemoveTicket() throws IOException {
        System.out.println(ticketId);
        URL url = new URL(urlApi + "Ticket/" + ticketId + "?force_purge=true");
        GlpiApiCall glpiApiCall = new GlpiApiCall();
        WebResponse response = glpiApiCall.sendHttpRequest(url, HttpMethod.DELETE, "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK",
                "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP", "atffg3pvso75croarqkd6fgp7t", null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);
    }
}