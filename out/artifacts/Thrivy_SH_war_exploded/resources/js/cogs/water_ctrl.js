var getDevDataURL = ctx + "/getRecentLevelData";
var batlevelChart, templevelChart, humlevelChart, levelChart;

var target = document.getElementById('tempGauge'); // your canvas element
var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
gauge.animationSpeed = 32;
gauge.setTextField(document.getElementById("preview-textfield"));

var humtarget = document.getElementById('humGauge'); // your canvas element
var humgauge = new Gauge(humtarget).setOptions(humopts); // create sexy gauge!
humgauge.animationSpeed = 32;
humgauge.setTextField(document.getElementById("hum-textfield"));

var lighttarget = document.getElementById('lightGauge'); // your canvas element
var lightgauge = new Gauge(lighttarget).setOptions(wateropts); // create sexy gauge!
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
    reqData["tyoe"] = "wlm";
    //reqData["eventType"] = "status";
    countData = jQuery.extend(true, {}, reqData);

    //showLoading();

    reqFN(reqData, getDevDataURL, 'post').done(processDevData);
}

function processDevData(data){

    console.log(data);

    try {

        var lastseen = new Date(data.docs[0].timestamp);
        var curTime = new Date();

        $('#lastseen').text("Last Seen : " + lastseen.toString().substring(0, 25));
        $('#batlevel').text("Battery : " + data.docs[0].battery + " mV");
        $('#lastsig').text("Signal   : " + ((data.docs[0].signal*2)-113) + " dBm");
        $('#templevel').text("Temperature   : " + data.docs[0].temp + " C");
        $('#humlevel').text("Humidity   : " + data.docs[0].humidity + " %");
        $('#errors').text("Tx Errors   : " + data.docs[0].err);
        $('#waterlevel').text("Water Level   : " + (100-data.docs[0].height) + " %");
        // $('#evnttype').text("Message Type   : " + data.docs[0].msgtype);

        if ((curTime.getTime() - lastseen.getTime()) > 1800000){
            $('#devstatus').text("Device : Offline");
        } else {
            $('#devstatus').text("Device : Online");
        }



    } catch(e){


        $('#lastseen').text("Last Seen : Unknown" );
        $('#devstatus').text("Offline");
        //$('#devbat').text("Battery : Unknown");
        $('#lastsig').text("Signal   : Unknown");
        //$('#devtemp').text("Temperature : Unknown");
        //$('#devhum').text("Humidity   : Unknown");

    } finally {
        loadTempGauge(data.docs[0].temp);
        loadHumGauge(data.docs[0].humidity);
        loadLightGauge((100-data.docs[0].height));
        loadBatteryGauge(data.docs[0].battery);
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