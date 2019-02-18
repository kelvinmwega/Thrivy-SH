package org.voltarent.Handlers;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.voltarent.util.encoders;

@Service
public class thrivyClientHandler {

    private static String deviceDBUser = "b85fd0ed-3cef-4a35-ba5b-95cc78effb53-bluemix";
    private static String deviceDBPass= "1ad1607027a0648358431c8329372467ae11261545ae62208ad8b02cb8407621";
    private static String deviceDBbaseUrl = "https://b85fd0ed-3cef-4a35-ba5b-95cc78effb53-bluemix.cloudant.com/";
    private static String devicesDB = "devices/";
    private static String loraemdDB = "lora_emd/";
    private static String trackerEmdDB = "tracker_db/";

    encoders enc = new encoders();
    JsonObject err = new JsonObject();

    @Autowired
    httpReqHandler reqHandler = new httpReqHandler();

    public JsonObject loraemdData(JsonObject reqData){

        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, loraemdDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 0, "", "lora").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject latestloraEmdData(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, loraemdDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 1, "", "lora").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So  many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject trackeremdData(JsonObject reqData){

        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, trackerEmdDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 0, "", "track").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    public JsonObject latesttrackerEmdData(JsonObject reqData){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, trackerEmdDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqData, 1, "", "track").toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }


    public JsonObject queryObjGen(JsonObject reqData, int lim, String qry, String devtype) {

//        System.out.println("### " + reqData + " -- " + devtype);

        JsonObject postDataParams = new JsonObject();
        JsonObject selector = new JsonObject();
        JsonObject timestamp = new JsonObject();
        JsonObject sorter = new JsonObject();
        JsonObject err = new JsonObject();

        JsonArray sort = new JsonArray();

        timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
        timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
        selector.add("timestamp", new Gson().toJsonTree(timestamp));

        if (devtype.equals("lora")){
            selector.addProperty("dev_id", reqData.get("device").getAsString());
        } else if (devtype.equals("track")){
            selector.addProperty("deviceid", reqData.get("device").getAsString());
        }

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
