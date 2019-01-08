package org.voltarent.Handlers;


import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;

/**
 * Created by IBM on 10/18/2017.
 */

@Service
public class httpReqHandler {

    JsonObject objToReturn;
    JsonParser parser = new JsonParser();
    JsonObject err = new JsonObject();

    public JsonObject get(String urlToGet, String authString, String id, String addParams) {

        URI uri;
        HttpGet request = null;

        System.out.println(urlToGet + "    " + authString);
        HttpClient client = HttpClientBuilder.create().build();

        if (!addParams.equals("")){
            try {
                URIBuilder builder = new URIBuilder(urlToGet);
                builder.setParameter(id, addParams);
                uri = builder.build();
                request = new HttpGet(uri);
            } catch (Exception e){
                e.printStackTrace();
            }
        } else {
            request = new HttpGet(urlToGet);
        }

        try {
            if (!authString.equals("")){
                request.addHeader("Authorization", "Basic " + authString);
            }

            HttpResponse response = client.execute(request);

            int responseCode = response.getStatusLine().getStatusCode();

            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

            String line = "";
            String resp = "";

            while ((line = rd.readLine()) != null) {
                //System.out.println(line);
                resp += line;
            }

            //System.out.println(resp);

            try {
                objToReturn = parser.parse(resp.trim()).getAsJsonObject();
            } catch (Exception e){
                JsonObject respObj = new JsonObject();
                //objToReturn.add("resp", parser.parse(resp).getAsJsonArray());
                JsonArray dataResp = parser.parse(resp).getAsJsonArray();
                respObj.add("resp", dataResp.getAsJsonArray());
//                System.out.println(respObj);
                objToReturn = respObj;
            }

            request.releaseConnection();

        } catch (ClientProtocolException e) {
            err.addProperty("error", "Client Protocol");
            request.releaseConnection();
            objToReturn = err;
        } catch (UnsupportedOperationException e) {
            err.addProperty("error", "Unsupported");
            request.releaseConnection();
            objToReturn = err;
        } catch (IOException e) {
            err.addProperty("error", "Cannot Access Server");
            request.releaseConnection();
            objToReturn = err;
        }

        request.releaseConnection();
        return objToReturn;
    }

    public JsonObject post(String urlToPost, String authString, String reqObj) {

        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(urlToPost);
        post.addHeader("Authorization", "Basic " + authString);
        System.out.println(urlToPost);

        try {
            StringEntity params = new StringEntity(reqObj);
            post.setEntity(params);
            post.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");

            HttpResponse response = client.execute(post);

            int responseCode = response.getStatusLine().getStatusCode();
//            System.out.println("**POST** request Url: " + post.getURI());
//            System.out.println("Parameters : " + params);
//            System.out.println("Response Code: " + responseCode);
//            System.out.println("Content:-\n");
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            String resp = "";
            while ((line = rd.readLine()) != null) {
                //System.out.println(line);
                resp += line;
            }

            post.releaseConnection();
            objToReturn = parser.parse(resp.trim()).getAsJsonObject();

        } catch (IOException e) {
            e.printStackTrace();
            err.addProperty("error", "IOException");
            post.releaseConnection();
            objToReturn = err;
        }

        post.releaseConnection();
        return objToReturn;
    }

    public JsonObject sendPut(String url, String authString, String data) {
        System.out.println("PPUUTurl  " + url);
        System.out.println("PPUUTdata  " + data);
        int responseCode = -1;
        HttpClient httpClient = new DefaultHttpClient();
        HttpPut request = new HttpPut(url);
        request.addHeader("Authorization", "Basic " + authString);
        try {
            StringEntity params =new StringEntity(data,"UTF-8");
            params.setContentType("application/json");
            request.addHeader("content-type", "application/json");
            request.addHeader("Accept", "*/*");
//            request.addHeader("Accept-Encoding", "gzip,deflate,sdch");
//            request.addHeader("Accept-Language", "en-US,en;q=0.8");
            request.setEntity(params);
            HttpResponse response = httpClient.execute(request);
            responseCode = response.getStatusLine().getStatusCode();
            if (response.getStatusLine().getStatusCode() == 200 || response.getStatusLine().getStatusCode() == 204
                    || response.getStatusLine().getStatusCode() == 201) {

                BufferedReader br = new BufferedReader(
                        new InputStreamReader((response.getEntity().getContent())));

                String output = "";
                String resp = "";
                // System.out.println("Output from Server ...." + response.getStatusLine().getStatusCode() + "\n");
                while ((output = br.readLine()) != null) {
                    System.out.println(output);
                    resp += output;
                }
                request.releaseConnection();
                return parser.parse(resp.trim()).getAsJsonObject();
            }
            else{
                System.out.println("####  " + responseCode);
                err.addProperty("error", "Request Unsuccessfull");
                request.releaseConnection();
                return err;
            }

        }catch (Exception ex) {
            ex.printStackTrace();
            err.addProperty("error", "Client Protocol");
            request.releaseConnection();
            return err;
        } finally {
            request.releaseConnection();
            httpClient.getConnectionManager().shutdown();
        }
    }

}
