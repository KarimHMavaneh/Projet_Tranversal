package api;

import com.gargoylesoftware.htmlunit.*;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONObject;

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
        // UserToken MANAGER_EQUIPE
        //String userTokenME = "yc3CkDqFSSELb6IVRy5DrdMHUbFsZqJrFQgvCam5";

        int demId = 7; // MANAGER_RH
        int ass1Id = 9; // RESP_TECHNIQUE
        int ass2Id = 10; // ADMIN_SYS
        int validId = 8; // MANAGER_EQUIPE

        System.out.println("\n**************** Token de session ****************");
        String sessionToken = glpiApiCall.getSessionToken(urlApi, appToken, userToken);
        System.out.println("Token de session : " + sessionToken);

        System.out.println("\n**************** Liste Tickets ****************");
        ArrayList ticketsList = glpiApiCall.getTicketsList(urlApi, appToken, userToken, sessionToken);
        System.out.println("Liste des tickets : " + ticketsList);

        System.out.println("\n**************** Création Ticket par le MANAGER_RH ****************");
        WebResponse ticketResponse = glpiApiCall.createTicket(urlApi, appToken, userToken, sessionToken, demId);
        JSONObject ticket = glpiApiCall.getJsonObject(ticketResponse);
        int ticketId = ticket.getInt("id");
        System.out.println("Le ticket " + ticketId + " a été créé");
        glpiApiCall.addTicketValidator(urlApi, appToken, userToken, sessionToken, ticketId, validId);
        System.out.println("Le ticket " + ticketId + " est en validation auprès de " + validId);
        glpiApiCall.validTicket(urlApi, appToken, userToken, sessionToken, ticketId);
        System.out.println("Le ticket " + ticketId + " a été validé par " + validId);
        glpiApiCall.addTicketUsers(urlApi, appToken, userToken, sessionToken, ticketId, demId, ass1Id, ass2Id);
        System.out.println("Le ticket " + ticketId + " a été assigné à " + ass1Id + " et " + ass2Id);

        //System.out.println("\n**************** Détail Ticket ****************");
        glpiApiCall.getTicket(urlApi, appToken, userToken, sessionToken, ticketId);

        System.out.println("\n**************** Validation Ticket par le MANAGER_EQUIPE  ****************");
        glpiApiCall.validTicket(urlApi, appToken, userToken, sessionToken, ticketId);
        System.out.println("Le ticket " + ticketId + " a été validé par " + validId);

        //System.out.println("\n**************** Transfert Ticket par le MANAGER_RH ****************");
        //glpiApiCall.addValidRequestAS(urlApi, appToken, userToken, sessionToken, ass1Id, ticketId);
        //glpiApiCall.addValidRequestRT(urlApi, appToken, userToken, sessionToken, ass2Id, ticketId);

        System.out.println("\n**************** Suppression Ticket ****************");
        glpiApiCall.removeTicket(urlApi, appToken, userToken, sessionToken, ticketId-1);
        System.out.println("Le ticket " + ticketId + " a été supprimé de GLPI");
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

        //System.out.println("RequestParameters : " + request.getRequestParameters()); // []
        //System.out.println("GetParameters : " + request.getParameters()); // []
        //System.out.println("GetRequestBody : " + request.getRequestBody()); // null
        //System.out.println("request : " + request);

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
        JSONObject token = getJsonObject(response);
        String sessionToken = token.getString("session_token");

        // Retourne le token session
        return sessionToken;
    }

    /**
     * Méthode permettant d'obtenir la liste des tickets de GLPI (local)
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @return retourne la liste des tickets
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
       }
        return ticketsList;
    }

    /**
     * Méthode permettant d'obtenir les clés/valeurs d'un ticket
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param id id du ticket à interroger
     * @return retourne la réponse à la requête HTTP
     * @throws IOException signale si une erreur s'est produite
     */
    public WebResponse getTicket(String urlApi, String appToken, String userToken, String sessionToken, int id) throws IOException {
        URL url = new URL(urlApi + "ticket/" + id);
        WebResponse response = sendHttpRequest(url, HttpMethod.GET, appToken,
                userToken, sessionToken, null, null, null, "application/json",
                HttpURLConnection.HTTP_OK, null);

        JSONObject jsonObject = getJsonObject(response);

        int ticketId = jsonObject.getInt("id");
        //System.out.println("Clés/Valeurs du ticket " + ticketId + " : ");
        for (Iterator iterator = jsonObject.keys(); iterator.hasNext();) {
            Object cle = iterator.next();
            Object val = jsonObject.get(String.valueOf(cle));
            //System.out.println(cle  + " = " + val);
        }
        return response;
    }

    /**
     * Méthode permettant de créer un ticket
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @return retourne la réponse à la requête HTTP
     * @throws IOException signale si une erreur s'est produite
     */
    public WebResponse createTicket(String urlApi, String appToken, String userToken, String sessionToken, int demId) throws IOException {
        URL url = new URL(urlApi + "ticket");

        // Type 2 = Demande | Type 1 = Incident
        WebResponse response = sendHttpRequest(url, HttpMethod.POST, appToken, userToken, sessionToken,
                "{" +
                        "\"input\": {" +
                            "\"name\": \"Demande droits et materiel pour Jack MARTIN\"," +
                            "\"content\":\"Bonjour, je vous remercie de bien vouloir traiter cette demande pour le nouvel arrivant Jack MARTIN.\"," +
                            "\"type\":2," +
                            "\"users_id_recipient\":"+demId+"}" +
                        "}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null
                );

        JSONObject ticket = getJsonObject(response);

        int ticketId = ticket.getInt("id");
        String urlUserTicket = response.getResponseHeaderValue("Location");
        return response;
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
     * @return retourne la réponse à la requête HTTP
     * @throws IOException signale si une erreur s'est produite
     */
    public WebResponse addTicketUsers(String urlApi, String appToken, String userToken, String sessionToken, int ticketId, int demId, int ass1Id, int ass2Id) throws IOException {

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
        return response;
    }

    /**
     * Méthode permettant de demander la validation d'un ticket par un user
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ticketId id du ticket
     * @param validId id d'un utilisateur en charge de la validation du ticket
     * @return retourne la réponse à la requête HTTP
     * @throws IOException signale si une erreur s'est produite
     */
    public WebResponse addTicketValidator(String urlApi, String appToken, String userToken, String sessionToken, int ticketId, int validId) throws IOException {

        URL url = new URL(urlApi + "Ticket/" + ticketId + "/TicketValidation");
        WebResponse response = sendHttpRequest(url, HttpMethod.POST, appToken, userToken, sessionToken,
                "{" +
                        "\"input\":[" +
                            "{\"tickets_id\":"+ticketId+",\"users_id_validate\":"+validId+",\"validation_date\":null,\"comment_validation\":\"Demande validee\"}" +
                        "]}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null);
        return response;
    }

    /**
     * Méthode permettant de valider un ticket
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user
     * @param sessionToken jeton d'authentification de la session API
     * @param ticketId id du ticket
     * @return retourne la réponse à la requête HTTP
     * @throws IOException signale si une erreur s'est produite
     */
    public WebResponse validTicket(String urlApi, String appToken, String userToken, String sessionToken, int ticketId) throws IOException {
        URL url = new URL(urlApi + "Ticket/" + ticketId);
        WebResponse response = sendHttpRequest(url, HttpMethod.PATCH, appToken, userToken, sessionToken,
                "{" +
                        "\"input\":" +
                            "{\"global_validation\":3}" +
                        "}",
                "application/json", null, null, HttpURLConnection.HTTP_OK, null);
        return response;
    }

    /**
     * Méthode permettant de transférer la demande (validation) à l'ADMIN_SYS
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ass1Id id de l'ADMIN_SYS
     * @param ticketId id du ticket
     * @throws IOException signale si une erreur s'est produite
     */
    public void addValidRequestAS(String urlApi, String appToken, String userToken, String sessionToken, int ass1Id, int ticketId) throws IOException {
        URL url = new URL(urlApi + "Ticket/" + ticketId + "/TicketValidation");
        WebResponse response = sendHttpRequest(url, HttpMethod.POST, appToken, userToken, sessionToken,
                "{" +
                        "\"input\":[" +
                        "{\"tickets_id\":"+ticketId+",\"users_id_validate\":"+ass1Id+",\"validation_date\":null,\"comment_submission\":\"Merci de traiter la demande pour les droits\"}" +
                        "]}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null);
    }

    /**
     * Méthode permettant de transférer la demande (validation) au RESP_TECH
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ass2Id id du RESP_TECH
     * @param ticketId id du ticket
     * @throws IOException signale si une erreur s'est produite
     */
    public void addValidRequestRT(String urlApi, String appToken, String userToken, String sessionToken, int ass2Id, int ticketId) throws IOException {
        URL url = new URL(urlApi + "Ticket/" + ticketId + "/TicketValidation");
        WebResponse response = sendHttpRequest(url, HttpMethod.POST, appToken, userToken, sessionToken,
                "{" +
                        "\"input\":[" +
                        "{\"tickets_id\":"+ticketId+",\"users_id_validate\":"+ass2Id+",\"validation_date\":null,\"comment_submission\":\"Merci de traiter la demande pour le materiel\"}" +
                        "]}",
                "application/json", null, null, HttpURLConnection.HTTP_CREATED, null);
    }

    /**
     * Méthode permettant de supprimer un ticket de l'appli GLPI
     * @param urlApi url de l'API GLPI
     * @param appToken jeton d'authentification GLPI app (local)
     * @param userToken jeton d'authentification GLPI user (local)
     * @param sessionToken jeton d'authentification de la session API
     * @param ticketId id du ticket
     * @return retourne la réponse à la requête HTTP
     * @throws IOException signale si une erreur s'est produite
     */
    public WebResponse removeTicket(String urlApi, String appToken, String userToken, String sessionToken, int ticketId) throws IOException {
        URL url = new URL(urlApi + "Ticket/" + ticketId + "?force_purge=true");
        WebResponse response = sendHttpRequest(url, HttpMethod.DELETE, appToken, userToken, sessionToken,
                "",
                "application/json", null, null, HttpURLConnection.HTTP_OK, null);
        return response;
    }
}