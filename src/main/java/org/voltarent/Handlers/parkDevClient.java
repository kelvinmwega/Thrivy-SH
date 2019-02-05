package org.voltarent.Handlers;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.voltarent.util.encoders;

public class parkDevClient {

    private static String deviceDBUser = "b16c61ff-e23d-4654-8a15-ddd0d6e65cc8-bluemix";
    private static String deviceDBPass= "89b4d1569d568cf39e5fdd79e01372aaae386921c9a52540c3f8058e0e35c8c2";
    private static String deviceDBbaseUrl = "https://b16c61ff-e23d-4654-8a15-ddd0d6e65cc8-bluemix.cloudant.com/";
    private static String devicesDB = "devices_db/";
    private static String fmDB = "fence_monitor_db/";
    private static String tmDB = "tower_monitor_db/";
    private static String settingsDB = "settings_db/";

    encoders enc = new encoders();
    JsonObject err = new JsonObject();

    @Autowired
    httpReqHandler reqHandler = new httpReqHandler();

    //Function to collect all the devices from DB
    public JsonObject getAllDevices(JsonObject reqObj){
        try {
            JsonObject resp = reqHandler.post(String.format("%s%s%s", deviceDBbaseUrl, devicesDB, "_find"),
                    enc.base44En(deviceDBUser, deviceDBPass), queryObjGen(reqObj, "devs", 0).toString());
            return resp;
        } catch (Exception e) {
            err.addProperty("error", "So many things could be wrong at this point.");
            return err;
        }
    }

    private JsonObject queryObjGen(JsonObject reqData,String reqType, int lim) {

        JsonObject postDataParams = new JsonObject();
        JsonObject selector = new JsonObject();
        JsonObject timestamp = new JsonObject();
        JsonObject sorter = new JsonObject();
        JsonObject err = new JsonObject();
        JsonArray sort = new JsonArray();

        if (reqType.equals("devs")){
            selector.addProperty("key", reqData.get("key").getAsString());
            postDataParams.add("selector", new Gson().toJsonTree(selector));
        }

        if (lim != 0){
            postDataParams.addProperty("limit", lim);
        }

        System.out.println(postDataParams.toString());
        return postDataParams;
    }

}
