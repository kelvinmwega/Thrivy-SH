package org.voltarent.controllers;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.voltarent.Handlers.cloudantHandler;
import org.voltarent.Handlers.devClientHandler;
import org.voltarent.Handlers.parkDevClient;
import org.voltarent.Handlers.thrivyClientHandler;

/**
 * Created by KelvinMwegaKiana on 07/11/2018.
 */
@RestController
public class RestControllers {

    private JsonParser parser = new JsonParser();
    private parkDevClient parkClient = new parkDevClient();
    private devClientHandler clientHandler = new devClientHandler();
    private thrivyClientHandler thrivyHandler = new thrivyClientHandler();

    @CrossOrigin
    @RequestMapping(value = "/getDevices",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getDevices(@RequestBody String data){
        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(parkClient.getAllDevices(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getRecentLevelData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getRecentLevelData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.latestLevelData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getRecentPowerData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getRecentPowerData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.latestEmdData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getRecentWifiData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getRecentWifiData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.latestWifiData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getLevelData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getLevelData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.levelData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getPowerData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getPowerData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.emdData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getEMDWifiData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getEMDWifiData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.getEMDWifiData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getDeviceEvents",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getDeviceEvents(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(clientHandler.emdEvents(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getLoraEMDData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getLoraEMDData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(thrivyHandler.loraemdData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getRecentLoraEMDData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getRecentLoraEMDData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(thrivyHandler.latestloraEmdData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getTrackerEMDData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getTrackerEMDData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(thrivyHandler.trackeremdData(req), HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping(value = "/getRecentTrackerEMDData",  method = RequestMethod.POST)
    public ResponseEntity<JsonObject> getRecentTrackerEMDData(@RequestBody String data) throws Exception{

        JsonObject req = parser.parse(data.trim()).getAsJsonObject();
        return new ResponseEntity<JsonObject>(thrivyHandler.latesttrackerEmdData(req), HttpStatus.OK);
    }

}
