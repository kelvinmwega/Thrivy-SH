package org.voltarent.Handlers;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.voltarent.util.encoders;

/**
 * Created by KelvinMwegaKiana on 28/12/2018.
 */

@Service
public class devClientHandler {

    private static String deviceDBUser = "15489ce4-1884-46c2-ab6f-47798cad2a5b-bluemix";
    private static String deviceDBPass= "78f015059b952321ac22eaea9183f1d35f284074036220c07b59c9fe265e186d";
    private static String deviceDBbaseUrl = "https://15489ce4-1884-46c2-ab6f-47798cad2a5b-bluemix.cloudant.com/";
    private static String devicesDB = "devices/";
    private static String emdDB = "emd/";
    private static String lmDB = "wlm/";
    private static String emdwifiDB = "emdwifi/";
    private static String emdgpsDB = "emdgps/";
    private static String trackerDB = "tracker/";
    private static String settingsDB = "settings/";

    encoders enc = new encoders();
    JsonObject err = new JsonObject();

    @Autowired
    httpReqHandler reqHandler = new httpReqHandler();

    public JsonObject emdData(JsonObject reqData){

        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, emdDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 0, "").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject latestEmdData(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, emdDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 1, "").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject latestLevelData(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, lmDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 1, "").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject latestWifiData(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, emdwifiDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 1, "").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject getEMDWifiData(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, emdwifiDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 0, "").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }


    public JsonObject levelData(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, lmDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 0, "").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject emdEvents(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, emdDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 0, "events").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject queryObjGen(JsonObject reqData, int lim, String qry) {

        System.out.println("### " + reqData);

        JsonObject postDataParams = new JsonObject();
        JsonObject selector = new JsonObject();
        JsonObject timestamp = new JsonObject();
        JsonObject sorter = new JsonObject();
        JsonObject err = new JsonObject();

        JsonArray sort = new JsonArray();

        timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
        timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
        selector.add("timestamp", new Gson().toJsonTree(timestamp));
        selector.addProperty("deviceid", reqData.get("device").getAsString());

        if (qry.equals("events")){
            selector.addProperty("msgtype", reqData.get("msgtype").getAsString());
        }

        sorter.addProperty("timestamp", "desc");
        sort.add(sorter);

        postDataParams.add("selector", new Gson().toJsonTree(selector));
        postDataParams.add("sort", new Gson().toJsonTree(sort));

        if (lim != 0){
            postDataParams.addProperty("limit", lim);
        }

//            System.out.println(postDataParams.toString());
        return postDataParams;

    }
}
