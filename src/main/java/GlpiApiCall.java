import com.gargoylesoftware.htmlunit.*;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * COPYRIGHT MATHIEU MULOT
 * @author Mathieu MULOT
 */
public class GlpiApiCall {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {

        /*
        BDD : glpi_users | glpi_profiles_users | glpi_tickets_users | glpi_ticketvalidations
        User 2 glpi : Super Admin (profil 4)
        User 7 MANAGER_RH : Supervisor (profil 7)
        User 8 MANAGER_EQUIPE : Supervisor (profil 7)
        User 9 RESP_TECHNIQUE : Technician (profil 6)
        User 10 ADMIN_SYS : Technician (profil 6)
        User 11 DPO : Observer (profil 2)
        */

        GlpiApiCall glpiApiCall = new GlpiApiCall();

        String urlApi = "http://localhost/glpi_10_0_6/apirest.php/";
        String appToken = "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK";
        // UserToken SUPER ADMIN :
        //String userToken = "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP";
        // UserToken MANAGER_RH :
        String userToken = "LlScEGrJpIbr6kaExqODoYhaEh25nPjvqbJ1QtAD";
        int demId = 7; // MANAGER_RH
        int ass1Id = 9; // RESP_TECHNIQUE
        int ass2Id = 10; // ADMIN_SYS
        int validId = 8; // MANAGER_EQUIPE

        System.out.println("\n**************** Token de session ****************");
        String sessionToken = glpiApiCall.getSessionToken(urlApi, appToken, userToken);
        System.out.println("Token de session : " + sessionToken);

        System.out.println("\n**************** Liste Tickets ****************");
        glpiApiCall.getTicketsList(urlApi, appToken, userToken, sessionToken);

        System.out.println("\n**************** Création Ticket ****************");
        int ticketId = glpiApiCall.createTicket(urlApi, appToken, userToken, sessionToken, demId);
        glpiApiCall.addTicketUsers(urlApi, appToken, userToken, sessionToken, ticketId, demId, ass1Id, ass2Id);
        glpiApiCall.addTicketValidator(urlApi, appToken, userToken, sessionToken, ticketId, validId);

        System.out.println("\n**************** Détail Ticket ****************");
        glpiApiCall.getTicket(urlApi, appToken, userToken, sessionToken, ticketId);

        System.out.println("\n**************** Validation Ticket ****************");
        glpiApiCall.validTicket(urlApi, appToken, userToken, sessionToken, ticketId, validId);

        System.out.println("\n**************** Suppression Ticket ****************");
        //glpiApiCall.removeTicket(urlApi, appToken, userToken, sessionToken, ticketId);
    }

    /**
     * Méthode qui exécute une requête HTTP et retourne un objet WebResponse
     * @param url indique l'url sur laquelle le WebClient doit se connecter
     * @param httpMethod précise la méthode HTTP à utiliser (GET, DELETE, POST, PUT, PATCH)
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param body contenu de la requête
     * @param contentType valeur de l'attribut du Request Header "Content-Type"
     * @param formEncodingType type d'encodage
     * @param accept valeur de l'attribut du Resquest Header "Accept"
     * @param responseCode valeur du retour de la response (200, 400...)
     * @param httpMethodToAllow valeur de Request Header qui spécifie la méthode HTTP à autoriser (facultatif)
     * @return la response fournie par l'API
     * @throws IOException signale si une erreur s'est produite
     */
    public WebResponse sendHttpRequest(URL url, HttpMethod httpMethod, String appToken, String userToken, String sessionToken,
                                       String body, String contentType, FormEncodingType formEncodingType,
                                       String accept, int responseCode, String httpMethodToAllow) throws IOException {

        // Ouverture session webClient
        WebClient webClient = new WebClient(BrowserVersion.BEST_SUPPORTED);
        webClient.getOptions().setJavaScriptEnabled(true);
        webClient.getOptions().setThrowExceptionOnScriptError(false);
        webClient.getOptions().setRedirectEnabled(true);
        webClient.getOptions().setCssEnabled(true);
        webClient.getOptions().setDoNotTrackEnabled(true);
        webClient.getOptions().setThrowExceptionOnFailingStatusCode(true);

        // Requête Http
        WebRequest request = new WebRequest(url, httpMethod);

        if (formEncodingType!=null) {
            request.setEncodingType(formEncodingType);
        }
        request.setHttpMethod(httpMethod);

        webClient.addRequestHeader("App-Token",appToken);
        webClient.addRequestHeader("Authorization","user_token " + userToken);
        
        if (sessionToken!=null && !sessionToken.isBlank()) {
            webClient.addRequestHeader("Session-Token", sessionToken);
        }

        // Headers
        webClient.addRequestHeader("access-control-allow-origin","*");
        webClient.addRequestHeader("cache-control","no-store, no-cache, must-revalidate");
        webClient.addRequestHeader("pragma","no-cache");

        if (accept!=null && !accept.isBlank()) {
            webClient.addRequestHeader("accept",accept);
        }
        if (contentType!=null && !contentType.isBlank()) {
            webClient.addRequestHeader("content-Type",contentType);
        }

        if (body!=null && !body.isBlank()) {
            request.setRequestBody(body);
        }

        // if (httpMethodToAllow!=null && !httpMethodToAllow.isBlank()) {
        //    webClient.addRequestHeader("X-HTTP-Method-Override",httpMethodToAllow);
        //    webClient.addRequestHeader("X-REST-Method",httpMethodToAllow);
        // }

        //System.out.println("RequestParameters : " + request.getRequestParameters()); // []
        //System.out.println("GetParameters : " + request.getParameters()); // []
        System.out.println("GetRequestBody : " + request.getRequestBody()); // null
        System.out.println("request : " + request);

        Page page= webClient.getPage(request);
        WebResponse response = page.getWebResponse();

        if (response.getStatusCode() != responseCode) {
            throw new IOException("Failed : HTTP error code : " + response.getStatusCode());
        }

        // Fermeture session webclient
        webClient.close();

        return response;
    }

    /**
     * Méthode permettant de récupérer un objet JSONObject à partir d'une WebResponse
     * @param response réponse de la requête HTTP (objet Webresponse)
     * @return objet JSON
     */
    public JSONObject getJsonObject(WebResponse response) {
        String output = response.getContentAsString();
        JSONObject jsonObject = new JSONObject(output);
        return jsonObject;
    }

    /**
     * Méthode permettant de récupérer un tableau JSONArray avec clés associée à partir d'une WebResponse
     * @param response réponse de la requête HTTP (objet Webresponse)
     * @return tableau JSON
     */
    public JSONArray getJsonArray(WebResponse response) {
        String output = response.getContentAsString();
        JSONArray jsonArray = new JSONArray(output);
        return jsonArray;
    }

    /**
     * Méthode permettant d'obtenir le jeton de session dans l'API
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @return retourne le jeton de session de l'API
     * @throws IOException signale si une erreur s'est produite
     */
    public String getSessionToken(String urlApi, String appToken, String userToken) throws IOException {

        // création d'une requête HTTP vers la page PHP
        URL url = new URL(urlApi + "initSession");
        WebResponse response = sendHttpRequest(url, HttpMethod.GET, appToken, userToken, null, null,
                null, null, "application/json", HttpURLConnection.HTTP_OK, null);

        // lecture du flux JSON
        JSONObject jsonObject = getJsonObject(response);
        String sessionToken = jsonObject.getString("session_token");

        // Retourne le token session
        return sessionToken;
    }

    /**
     * Méthode permettant d'obtenir la liste des tickets de GLPI (local)
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @throws IOException signale si une erreur s'est produite
     */
    public ArrayList getTicketsList(String urlApi, String appToken, String userToken, String sessionToken) throws IOException {
        URL url = new URL(urlApi + "ticket");
        WebResponse response = sendHttpRequest(url, HttpMethod.GET, appToken,
                userToken, sessionToken, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);

        JSONArray ticketsArray = getJsonArray(response);

        int ticketsNb = ticketsArray.length();
        ArrayList ticketsList = new ArrayList();
        for (int i=0 ; i<ticketsNb ; i++) {
            JSONObject ticket = ticketsArray.getJSONObject(i);
            ticketsList.add(ticket.getInt("id"));
       } System.out.println("Liste des tickets : " + ticketsList);
        return ticketsList;
    }

    /**
     * Méthode permettant d'obtenir les clés/valeurs d'un ticket
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param id id du ticket à interroger
     * @throws IOException signale si une erreur s'est produite
     */
    public void getTicket(String urlApi, String appToken, String userToken, String sessionToken, int id) throws IOException {
        URL url = new URL(urlApi + "ticket/" + id);
        WebResponse response = sendHttpRequest(url, HttpMethod.GET, appToken,
                userToken, sessionToken, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);

        JSONObject jsonObject = getJsonObject(response);

        int ticketId = jsonObject.getInt("id");
        System.out.println("Clés/Valeurs du ticket " + ticketId + " : ");
        for (Iterator iterator = jsonObject.keys(); iterator.hasNext();) {
            Object cle = iterator.next();
            Object val = jsonObject.get(String.valueOf(cle));
            System.out.println(cle  + " = " + val);
        }
    }

    /**
     * Méthode permettant de créer un ticket
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @return Le numéro de ticket
     * @throws IOException signale si une erreur s'est produite
     */
    public int createTicket(String urlApi, String appToken, String userToken, String sessionToken, int demId) throws IOException {
        URL url = new URL(urlApi + "ticket");

        // Type 2 = Demande | Type 1 = Incident
        WebResponse response = sendHttpRequest(url, HttpMethod.POST, appToken, userToken, sessionToken,
                "{" +
                        "\"input\": {" +
                            "\"name\": \"Creation ticket Code\"," +
                            "\"content\":\"POST Ticket\"," +
                            "\"type\":2," +
                            "\"users_id_recipient\":"+demId+"}" +
                        "}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null
                );

        JSONObject ticket = getJsonObject(response);

        int ticketId = ticket.getInt("id");
        System.out.println("Pourquoi le users_id_recipient ne se met pas à jour (reste à 2) ? " + response.getWebRequest().getRequestBody());
        //String urlUserTicket = response.getResponseHeaderValue("Location");
        System.out.println("Le ticket " + ticketId + " a été créé.");
        return ticketId;
    }

    /**
     * Méthode permettant d'attribuer un demandeur et d'assigner le traitement d'un ticket
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ticketId id du ticket
     * @param demId id du demandeur
     * @param ass1Id id d'un utilisateur assigné
     * @param ass2Id id d'un utilisateur assigné
     * @throws IOException signale si une erreur s'est produite
     */
    public void addTicketUsers(String urlApi, String appToken, String userToken, String sessionToken, int ticketId, int demId, int ass1Id, int ass2Id) throws IOException {

        URL url = new URL(urlApi + "ticket/" + ticketId + "/ticket_User");
        // type 1 = "demandeur", type 2 = "attribué à"
        WebResponse response = sendHttpRequest(url, HttpMethod.POST, appToken, userToken, sessionToken,
                "{" +
                        "\"input\":[" +
                            "{\"tickets_id\":"+ticketId+",\"users_id\":"+demId+",\"type\":1}," +
                            "{\"tickets_id\":"+ticketId+",\"users_id\":"+ass1Id+",\"type\":2}," +
                            "{\"tickets_id\":"+ticketId+",\"users_id\":"+ass2Id+",\"type\":2}" +
                        "]}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null);
        System.out.println("Le ticket " + ticketId + " demandé par " + demId + " a été assigné à " + ass1Id + " et " + ass2Id);
    }

    /**
     * Méthode permettant de demander la validation d'un ticket par un user
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ticketId id du ticket
     * @param validId id d'un utilisateur en charge de la validation du ticket
     * @throws IOException signale si une erreur s'est produite
     */
    public void addTicketValidator(String urlApi, String appToken, String userToken, String sessionToken, int ticketId, int validId) throws IOException {

        URL url = new URL(urlApi + "Ticket/" + ticketId + "/TicketValidation");
        WebResponse response = sendHttpRequest(url, HttpMethod.POST, appToken, userToken, sessionToken,
                "{" +
                        "\"input\":[" +
                            "{\"tickets_id\":"+ticketId+",\"users_id_validate\":"+validId+",\"validation_date\":null,\"comment_validation\":null}" +
                        "]}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null);
        System.out.println("Le ticket " + ticketId + " est en validation auprès de " + validId);
    }

    /**
     * Méthode permettant de valider un ticket
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ticketId id du ticket
     * @param validId id d'un utilisateur en charge de la validation du ticket
     * @throws IOException signale si une erreur s'est produite
     */
    public void validTicket(String urlApi, String appToken, String userToken, String sessionToken, int ticketId, int validId) throws IOException {
        URL url = new URL(urlApi + "Ticket/" + ticketId);
        WebResponse response = sendHttpRequest(url, HttpMethod.PATCH, appToken, userToken, sessionToken,
                "{" +
                        "\"input\":" +
                        "{\"global_validation\":3}" +
                        "}",
                "application/json", null, null, HttpURLConnection.HTTP_OK, null);
        System.out.println("Le ticket " + ticketId + " a été validé par " + validId);
    }

    /**
     * Méthode permettant de supprimer un ticket de l'appli GLPI
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ticketId id du ticket
     * @throws IOException signale si une erreur s'est produite
     */
    public void removeTicket(String urlApi, String appToken, String userToken, String sessionToken, int ticketId) throws IOException {
        URL url = new URL(urlApi + "Ticket/" + ticketId + "?force_purge=true");
        WebResponse response = sendHttpRequest(url, HttpMethod.DELETE, appToken, userToken, sessionToken,
                "",
                "application/json", null, null, HttpURLConnection.HTTP_OK, null);
        System.out.println("Le ticket " + ticketId + " a été supprimé de GLPI, mais pas de la BDD !");
    }


//----------------------------------------FIN----------------------------------------------------------------------

    public void getGlpiAssetTypes(String sessionToken) throws IOException {

        /*URL url = new URL("http://mmform.infinityfreeapp.com/glpi_10_0_6_auto/apirest.php/getGlpiConfig");

        WebResponse response = sendHttpRequest(url, HttpMethod.GET, "AujpzubaG8lmRX1iU95dMxN954JFUl4M1dJXQAAK",
                "zGHas6QObT4s4EF32xVt9lhrmHCUAmkrEMnI418X", sessionToken, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);*/

        // Get GLPI Config
        URL url = new URL("http://localhost/glpi_10_0_6/apirest.php/getGlpiConfig");

        WebResponse response = sendHttpRequest(url, HttpMethod.GET, "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK",
                "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP", sessionToken, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);

        JSONObject jsonObject = getJsonObject(response);
        JSONArray assetTypes = jsonObject.getJSONObject("cfg_glpi").getJSONArray("asset_types");

        System.out.println("\nRésultat parsing config GLPI, asset types :\n");

        int nbAssetTypes = assetTypes.length();

        for (int i = 0; i < nbAssetTypes; i++) {
            String assetType = assetTypes.getString(i);
            System.out.println(assetType);
        }
    }

    public void addComputer(String sessionToken) throws IOException {

        /*URL url = new URL("http://mmform.infinityfreeapp.com/glpi_10_0_6_auto/apirest.php/Computer");

        WebResponse response = sendHttpRequest(url, HttpMethod.POST, "AujpzubaG8lmRX1iU95dMxN954JFUl4M1dJXQAAK",
                "zGHas6QObT4s4EF32xVt9lhrmHCUAmkrEMnI418X", sessionToken,
                "{\"input\": {\"name\": \"pc5\", \"serial\": \"555\"}}", "application/json", null, "application/json",
                HttpURLConnection.HTTP_CREATED, null);*/

        URL url = new URL("http://localhost/glpi_10_0_6/apirest.php/Computer");

        WebResponse response = sendHttpRequest(url, HttpMethod.POST, "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK",
                "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP", sessionToken,
                "{\"input\": {\"name\": \"pc5\", \"serial\": \"555\"}}",
                "application/json", null, null,
                HttpURLConnection.HTTP_CREATED, null);

        System.out.println(response.getContentAsString());
    }

    public void removeComputer(String sessionToken) throws IOException {

        /*URL url = new URL("http://mmform.infinityfreeapp.com/glpi_10_0_6_auto/apirest.php/Computer/1?force_purge=true");

        WebResponse response = sendHttpRequest(url, HttpMethod.DELETE, "AujpzubaG8lmRX1iU95dMxN954JFUl4M1dJXQAAK",
                "zGHas6QObT4s4EF32xVt9lhrmHCUAmkrEMnI418X", sessionToken, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);*/

        URL url = new URL("http://localhost/glpi_10_0_6/apirest.php/Computer/21?force_purge=true");

        WebResponse response = sendHttpRequest(url, HttpMethod.DELETE, "Sqj5ZWtdgwEtPOq81qYU6JmIiPpIb3WwhhgVIasK",
                "WBVngFYj3IqozWlkXYrgmygoelopRG9ZCScuvzGP", sessionToken, null, null, null, null,
                HttpURLConnection.HTTP_OK, null);

        System.out.println(response.getContentAsString());
    }
}
