/**
 * Created by KelvinMwegaKiana on 07/11/2018.
 */
var getDevDataURL = ctx + "/getRecentWifiData";

var target = document.getElementById('tempGauge'); // your canvas element
var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
gauge.animationSpeed = 32;
gauge.setTextField(document.getElementById("preview-textfield"));

var humtarget = document.getElementById('humGauge'); // your canvas element
var humgauge = new Gauge(humtarget).setOptions(humopts); // create sexy gauge!
humgauge.animationSpeed = 32;
humgauge.setTextField(document.getElementById("hum-textfield"));

var lighttarget = document.getElementById('lightGauge'); // your canvas element
var lightgauge = new Gauge(lighttarget).setOptions(lightopts); // create sexy gauge!
lightgauge.animationSpeed = 32;
lightgauge.setTextField(document.getElementById("light-textfield"));

var battarget = document.getElementById('batGauge'); // your canvas element
var batgauge = new Gauge(battarget).setOptions(batopts); // create sexy gauge!
batgauge.animationSpeed = 32;
batgauge.setTextField(document.getElementById("bat-textfield"));

function selectDev(lmdevName){

    var timeStamp = new Date();
    var stopTime = new Date();

    stopTime.setHours(stopTime.getHours() - 72);

    $('#devName').text(lmdevName);

    reqProcessor(lmdevName, timeStamp.toISOString(), stopTime.toISOString());

    console.log("Selected Device : " + lmdevName + " --- " + timeStamp.toISOString() + " ---- " + stopTime.toISOString());
}


function reqProcessor(lmdevName, startTime, stopTime){
    var reqData = {};
    var countData = {};

    reqData["device"] = lmdevName;
    reqData["startTime"] = startTime;
    reqData["stopTime"] = stopTime;
    reqData["tyoe"] = "emd";
    //reqData["eventType"] = "status";
    countData = jQuery.extend(true, {}, reqData);

    //showLoading();

    reqFN(reqData, getDevDataURL, 'post').done(processDevData);
}

function fetchHistoricalData(){
    var startTimeRaw = document.getElementById("datetimepicker_dark1").value;
    var stopTimeRaw = document.getElementById('datetimepicker_dark').value;
    var mylmdevName = "EMDWIFITEST";

    var startTime = replaceAll("/", "-", startTimeRaw + ':00.000Z');
    var stopTime = replaceAll("/", "-", stopTimeRaw + ':00.000Z');

    startTime = replaceAll(" ", "T", startTime);
    stopTime = replaceAll(" ", "T", stopTime);

    startTime = new Date(startTime);
    stopTime = new Date(stopTime);

    startTime.setHours(startTime.getHours() - 3);
    stopTime.setHours(stopTime.getHours() - 3);

    //reqProcessor(mylmdevName, startTime.toISOString(), stopTime.toISOString());
    reqProcessor(mylmdevName, startTime.toISOString(), stopTime.toISOString());

    console.log(mylmdevName + "  " + startTime.toISOString() + "  " + stopTime.toISOString());
}

function processDevData(data){

    console.log(data);

    try {

        var lastseen = new Date(data.docs[0].timestamp);
        var curTime = new Date();
        var doorstatus, powerstatus;

        if (data.docs[0].door === '0'){
            doorstatus = "Closed";
        } else {
            doorstatus = "Open"
        }

        if (data.docs[0].power === '1'){
            powerstatus = "ON";
        } else {
            powerstatus = "OFF";
        }

        $('#lastseen').text( lastseen.toString().substring(0, 25));
        $('#doorstat').text(doorstatus);
        $('#powerstat').text(powerstatus);
        $('#doorcnt').text("Door Opened : " + data.docs[0].doorcnt + " Times");
        $('#powercnt').text("Power Switched On   : " + data.docs[0].powercnt + " Times");
        //$('#devbat').text("Battery : " + data.docs[0].bat + " mV");
        $('#lastsig').text("Signal   : " + data.docs[0].sig + " dBm");
        //$('#devtemp').text("Temperature   : " + data.docs[0].tmpt + " C");
        //$('#devhum').text("Humidity   : " + data.docs[0].hum + " %");
        //$('#errors').text("Tx Errors   : " + data.docs[0].err);
        //$('#lightstat').text("Light Intensity   : " + Math.round(data.docs[0].light) + " %");
        $('#evnttype').text("Event Type   : " + data.docs[0].eventType);

        if ((curTime.getTime() - lastseen.getTime()) > 1800000){
            $('#devstatus').text("Device : Offline");
        } else {
            $('#devstatus').text("Device : Online");
        }



    } catch(e){


        $('#lastseen').text("Last Seen : Unknown" );
        $('#devstatus').text("Offline");
        $('#doorstat').text("Door Status : Unknown");
        $('#powerstat').text("Power Status   : Unknown" );
        $('#doorcnt').text("Door Opened : Unknown");
        $('#powercnt').text("Power Switched On   : Unknown");
        //$('#devbat').text("Battery : Unknown");
        $('#lastsig').text("Signal   : Unknown");
        //$('#devtemp').text("Temperature : Unknown");
        //$('#devhum').text("Humidity   : Unknown");

    } finally {
        loadTempGauge(data.docs[0].temperature);
        loadHumGauge(data.docs[0].humidity);
        loadLightGauge(Math.round(data.docs[0].light*0.09766));
        // loadBatteryGauge(data.docs[0].bat);
        loadBatteryGauge(4200);
    }
}

function loadTempGauge(tempValue){
    gauge.maxValue = 60; // set max gauge value
    gauge.setMinValue(10);  // set min value
    gauge.set(tempValue); // set actual value
}

function loadHumGauge(humvalue){
    humgauge.maxValue = 100; // set max gauge value
    humgauge.setMinValue(0);  // set min value
    humgauge.set(humvalue);
}

function loadLightGauge(lightvalue){
    lightgauge.maxValue = 100; // set max gauge value
    lightgauge.setMinValue(0);  // set min value
    lightgauge.set(lightvalue);
}

function loadBatteryGauge(batteryvalue){
    batgauge.maxValue = 4400; // set max gauge value
    batgauge.setMinValue(3400);  // set min value
    batgauge.set(batteryvalue);
}