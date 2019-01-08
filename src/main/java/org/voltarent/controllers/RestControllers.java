package org.voltarent.controllers;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.voltarent.Handlers.cloudantHandler;
import org.voltarent.Handlers.devClientHandler;

/**
 * Created by KelvinMwegaKiana on 07/11/2018.
 */
@RestController
public class RestControllers {

    JsonParser parser = new JsonParser();
    cloudantHandler cloudantHandler = new cloudantHandler();
    devClientHandler clientHandler = new devClientHandler();

    @CrossOrigin
    @RequestMapping(value = "/getPowerData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getPowerData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.emdData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getRecentPowerData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getRecentPowerData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.latestEmdData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getRecentLevelData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getRecentLevelData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.latestLevelData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getDeviceEvents",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getDeviceEvents(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(cloudantHandler.powerMonitorData(req, "events"), HttpStatus.OK);
    }

}
