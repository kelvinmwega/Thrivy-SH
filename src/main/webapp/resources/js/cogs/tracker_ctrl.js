var getDataURL = ctx + "/getRecentTrackerEMDData";
var markers = [];

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

var speedtarget = document.getElementById('speedGauge'); // your canvas element
var speedgauge = new Gauge(speedtarget).setOptions(speedopts); // create sexy gauge!
speedgauge.animationSpeed = 32;
speedgauge.setTextField(document.getElementById("speed-textfield"));

var signaltarget = document.getElementById('signalGauge'); // your canvas element
var signalgauge = new Gauge(signaltarget).setOptions(signalopts); // create sexy gauge!
signalgauge.animationSpeed = 32;
signalgauge.setTextField(document.getElementById("signal-textfield"));

function initMap() {
    var myLatLng = new google.maps.LatLng(-1.366950, 36.852228);
    var mapProp={
        mapTypeId:google.maps.MapTypeId.HYBRID
    };
    map = new google.maps.Map(document.getElementById('googleMap'), {
        zoom: 18,
        center: new google.maps.LatLng(-1.358291, 36.833340),
        mapTypeId: google.maps.MapTypeId.HYBRID
    });
}

function getDevices() {
    var data = {};
    data.key = "device";
    reqFN(data, getDataURL, 'post').done(processDevData);
}

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

    reqFN(reqData, getDataURL, 'post').done(processDevData);
}

function processDevData(data){
    console.log(data.docs);

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
        $('#doorstat').text("Door : " + doorstatus);
        $('#powerstat').text("Power : " + powerstatus);
        // $('#doorcnt').text("Door Opened : " + data.docs[0].doorcnt + " Times");
        // $('#powercnt').text("Power Switched On   : " + data.docs[0].powercnt + " Times");
        $('#devbat').text("Battery : " + data.docs[0].battery + " mV");
        $('#signal').text("Signal   : " + data.docs[0].signal + " ");
        $('#tmp').text("Temperature   : " + data.docs[0].temperature + " C");
        $('#hum').text("Humidity   : " + data.docs[0].humidity + " %");
        //$('#errors').text("Tx Errors   : " + data.docs[0].err);
        $('#light').text("Light Intensity   : " + Math.round(data.docs[0].light*0.098) + " %");
        $('#evnttype').text("Event Type   : " + data.docs[0].eventType);
        $('#msgstat').text("Msg Type   : " + data.docs[0].msgtype);
        $('#gpsstat').text("GPS Status   : " + data.docs[0].gpsstat);
        $('#speed').text("Speed   : " + data.docs[0].speed + " Km/hr");
        $('#course').text("Course   : " + data.docs[0].course + " Degrees");
        $('#alt').text("Altitude   : " + data.docs[0].altitude + " Meters");


        if ((curTime.getTime() - lastseen.getTime()) > 1800000){
            $('#devstatus').text("Device : Offline");
        } else {
            $('#devstatus').text("Device : Online");
        }

    } catch (e) {

        // $('#lastseen').text("Last Seen : Unknown" );
        $('#devstatus').text("Offline");
        // $('#doorstat').text("Door Status : Unknown");
        // $('#powerstat').text("Power Status   : Unknown" );
        // $('#doorcnt').text("Door Opened : Unknown");
        // $('#powercnt').text("Power Switched On   : Unknown");
        // //$('#devbat').text("Battery : Unknown");
        // $('#lastsig').text("Signal   : Unknown");
        //$('#devtemp').text("Temperature : Unknown");
        //$('#devhum').text("Humidity   : Unknown");

    } finally {
        loadTempGauge(data.docs[0].temperature);
        loadHumGauge(data.docs[0].humidity);
        loadLightGauge(Math.round(data.docs[0].light*0.09766));
        loadBatteryGauge(data.docs[0].battery);
        loadSpeedGauge(data.docs[0].speed);
        loadSignalGauge(data.docs[0].signal);
        loadDeviceMarkers(data.docs);
    }
}

function procDevTypeSelect() {

    var selectBox = document.getElementById("devTypeSelect");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;

    console.log(selectedValue);
}

function procDevSelect(){
    var selectBox = document.getElementById("deviceSelector");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;

    console.log(selectedValue);
}

function loadDeviceMarkers(respObject){

    var locations = [];
    var tempLocation = [];
    var i = 0;

    console.log(JSON.stringify(respObject));

    for (var key in respObject) {
        if (respObject.hasOwnProperty(key)) {
            console.log(JSON.stringify(respObject[i]));
            var val = respObject[key];
            var infoString = val.id + "\n" + val.temp + "\n" + val.hum;
            var utcDate = new Date(val.timestamp);
            var timeStr = respObject[i]._id.date;
            var contentString = sprintf('<div style = "line-height: 10px;" id="content">'+
                '<div id="siteNotice">'+
                '</div>'+
                '<h3 id="firstHeading" class="firstHeading">Device Info</h3>'+
                '<div id="bodyContent">'+
                '<p><b>ID</b> : %s </p>'+
                '<p><b>Course</b> : %s</p>'+
                '<p><b>Speed</b> : %s </p>'+
                '<p><b>Altitude</b> : %s </p>'+
                '<p><b>Battery</b> : %s </p>'+
                '<p><b>Signal</b> : %s </p>'+
                '<p><b>Temperature</b> : %s </p>'+
                '<p><b>Humidity</b> : %s </p>'+
                '<p><b>Light</b> : %s </p>'+
                '<p><b>Power</b> : %s </p>'+
                '<p><b>Door</b> : %s </p>'+
                '<p><b>Seen</b> : %s </p>'+
                '</div>'+
                '</div>', [respObject[i].deviceid, respObject[i].course, respObject[i].speed, respObject[i].altitude,
                respObject[i].battery, respObject[i].signal, respObject[i].temperature, respObject[i].humidity, respObject[i].light,
                respObject[i].power, respObject[i].door,
                new Date(respObject[i].timestamp).toLocaleString().substring(0,25)]);

            tempLocation.push(contentString);
            tempLocation.push(respObject[i].latitude);
            tempLocation.push(respObject[i].longitude);
            tempLocation.push(i++);
            locations.push(tempLocation);
            tempLocation = [];
        }
    }
    console.log(locations);

    DeleteMarkers();

    var infowindow = new google.maps.InfoWindow();
    var marker, i;

    clickroute(respObject[0].latitude, respObject[0].longitude);

    for (i = 0; i < locations.length; i++) {

        console.log(locations[i]);

        if (respObject[i].status == "new"){

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(respObject[i].latitude, respObject[i].longitude),
                map: map,
                icon: pinSymbol('orange')
            });

        } else if(respObject[i].status == "alert"){

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(respObject[i].latitude, respObject[i].longitude),
                map: map,
                icon: pinSymbol('red')
            });

        } else if (respObject[i].status == "ok"){

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(respObject[i].latitude, respObject[i].longitude),
                map: map,
                icon: pinSymbol('#7CFC00')
            });
        } else {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(respObject[i].latitude, respObject[i].longitude),
                map: map,
                icon: pinSymbol('#0055FF')
            });
        }

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
            }
        })(marker, i));

        markers.push(marker);
    }
}

function clickroute(latt, longt) { //just omit the 'lati' and 'long'
    var latLng = new google.maps.LatLng(latt, longt);
    map.panTo(latLng);
}

function DeleteMarkers() {
    //Loop through all the markers and remove
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
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

function loadSpeedGauge(speedvalue){
    speedgauge.maxValue = 160; // set max gauge value
    speedgauge.setMinValue(0);  // set min value
    speedgauge.set(speedvalue);
}

function loadSignalGauge(signalvalue){
    signalgauge.maxValue = 30; // set max gauge value
    signalgauge.setMinValue(0);  // set min value
    signalgauge.set(signalvalue);
}