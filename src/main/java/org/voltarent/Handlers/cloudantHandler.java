package org.voltarent.Handlers;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.voltarent.util.encoders;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by IBM on 10/18/2017.
 */

@Service
public class cloudantHandler {

    @Autowired
    httpReqHandler reqHandler = new httpReqHandler();

    String voltuser = "b490a7dc-f667-4d2f-8011-9a8b01924f09-bluemix";
    String voltpass = "1e0bfefa7890e309a1567dfa545df86f1003e783301f6e1d86bbe086e94b2420";
    String voltbaseurl = "https://b490a7dc-f667-4d2f-8011-9a8b01924f09-bluemix.cloudant.com/";

    String powerMonitorDB = "trdldevices/_find";

    encoders enc = new encoders();
    JsonObject err = new JsonObject();


    public JsonObject powerMonitorData(JsonObject reqData, String cmd) {

        try {
            JsonObject resp = reqHandler.post(voltbaseurl + powerMonitorDB, enc.base44En(voltuser, voltpass), queryObjGen(reqData, cmd).toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }



    public JsonObject queryObjGen(JsonObject reqData, String src) {

        JsonObject postDataParams = new JsonObject();
        JsonObject selector = new JsonObject();
        JsonObject timestamp = new JsonObject();
        JsonObject sorter = new JsonObject();
        JsonObject err = new JsonObject();

        JsonArray sort = new JsonArray();

        try {

            if (src.equals("ttn")) {
                timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
                timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
            } else if (src.equals("obd")) {
                timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
                timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
                selector.addProperty("devId", reqData.get("device").getAsString());
            } else if (src.equals("trdl")) {
                timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
                timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
                selector.addProperty("deviceId", reqData.get("device").getAsString());
            } else if (src.equals("kwsalerts")) {
                timestamp.addProperty("$gt", reqData.get("stop").getAsString());
                timestamp.addProperty("$lt", reqData.get("start").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
            } else if (src.equals("trackers")) {
                timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
                timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
                selector.addProperty("ID", reqData.get("device").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
            } else if (src.equals("coldchain")) {
                timestamp.addProperty("$gt", reqData.get("stop").getAsString());
                timestamp.addProperty("$lt", reqData.get("start").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
            } else if (src.equals("ccasset")) {
                timestamp.addProperty("ownerid", reqData.get("deviceid").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
            } else if (src.equals("events")){
                timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
                timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
                selector.addProperty("deviceId", reqData.get("device").getAsString());
                selector.addProperty("msgtype", reqData.get("msgtype").getAsString());
            }
            else {
                timestamp.addProperty("$gt", reqData.get("stopTime").getAsString());
                timestamp.addProperty("$lt", reqData.get("startTime").getAsString());
                selector.add("timestamp", new Gson().toJsonTree(timestamp));
                selector.addProperty("deviceId", reqData.get("device").getAsString());
                selector.addProperty("eventType", reqData.get("eventType").getAsString());
            }

            sorter.addProperty("timestamp", "desc");
            sort.add(sorter);

            postDataParams.add("selector", new Gson().toJsonTree(selector));
            postDataParams.add("sort", new Gson().toJsonTree(sort));
            //postDataParams.addProperty("limit", 100);

//            System.out.println(postDataParams.toString());
            return postDataParams;
        } catch (Exception e) {
            e.printStackTrace();
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }
}