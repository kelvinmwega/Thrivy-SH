var getDevDataURL = ctx + "/getLevelData";
var batlevelChart, templevelChart, humlevelChart, lightChart;

function selectDev(lmdevName){

    var timeStamp = new Date();
    var stopTime = new Date();

    stopTime.setHours(stopTime.getHours() - 12);

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
    var mylmdevName = "865905021074731";

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

    var labelsArray = [];
    var tempArray = [];
    var humArray = [];
    var signalArray = [];
    var heightArray = [];
    var errorArray = [];
    var batteryArray = [];
    var altArray = [];

    try {

        var lastseen = new Date(data.docs[0].timestamp);
        var curTime = new Date();

        $('#lastseen').text("Last Seen : " + lastseen.toLocaleString().toString().substring(0,25));
        $('#devbat').text("Battery : " + data.docs[0].battery + " mV");
        $('#lastsig').text("Signal   : " + data.docs[0].signal + " dBm");
        $('#devtemp').text("Temperature   : " + data.docs[0].temp + " C");
        $('#devhum').text("Humidity   : " + data.docs[0].humidity + " %");
        //$('#errors').text("Tx Errors   : " + data.docs[0].err);
        $('#heightstat').text("Water Level   : " + (100 - data.docs[0].height) + " %");
        // $('#count').text("Count   : " + data.docs[0].count);
        // $('#memory').text("Free Memory   : " + data.docs[0].memory + " kB");
        //$('#evnttype').text("Event Type   : " + data.docs[0].eventType);

        if ((curTime.getTime() - lastseen.getTime()) > 1800000){
            $('#devstatus').text("Device : Offline");
        } else {
            $('#devstatus').text("Device : Online");
        }

        for (var i = 0; i < data.docs.length; i++) {

            try {
                if (data.docs[i].battery > 2000){
                    heightArray.push(100 - data.docs[i].height);
                    labelsArray.push(data.docs[i].timestamp);
                    tempArray.push(data.docs[i].temp);
                    humArray.push(data.docs[i].humidity);
                    signalArray.push(data.docs[i].signal);
                    batteryArray.push(data.docs[i].battery);
                    errorArray.push(data.docs[i].err);
                }
            } catch (e) {
                console.log(e);
            } finally {

            }
        }

    } catch(e){


        $('#lastseen').text("Last Seen : Unknown" );
        $('#devstatus').text("Offline");
        $('#devbat').text("Battery : Unknown");
        $('#lastsig').text("Signal   : Unknown");
        $('#devtemp').text("Temperature : Unknown");
        $('#devhum').text("Humidity   : Unknown");

        labelsArray.push(0);
        tempArray.push(0);
        humArray.push(0);
        signalArray.push(0);
        batteryArray.push(0);
        errorArray.push(0);
    } finally {

    }

    loadTempLevel(labelsArray, tempArray);
    loadLightLevel(labelsArray, heightArray);
    loadBatteryLevel(labelsArray, batteryArray);
    loadHumidityLevel(labelsArray, humArray);
}

function loadTempLevel(labelsArray, heightArray){
    var wlctx = document.getElementById('tempChart').getContext('2d');

    if (templevelChart) {
        templevelChart.destroy();
    }

    templevelChart = new Chart(wlctx, {
        type: 'line',
        data: {
            labels: labelsArray,
            datasets: [{
                label: 'Temperature (C)',
                data: heightArray,
                backgroundColor: "rgba(65, 93, 104, 1)"
            }]
        },
        options: chartOptions
    });
}

function loadHumidityLevel(labelsArray, batteryArray){
    var btctx = document.getElementById('humChart').getContext('2d');

    if (humlevelChart) {
        humlevelChart.destroy();
    }

    humlevelChart = new Chart(btctx, {
        type: 'line',
        data: {
            labels: labelsArray,
            datasets: [{
                label: 'Humidity (%)',
                data: batteryArray,
                backgroundColor: "rgba(20, 134, 201, 1)"
            }]
        },
        options: chartOptions
    });
}

function loadLightLevel(labelsArray, signalArray){
    var sgctx = document.getElementById('lightChart').getContext('2d');

    if (lightChart) {
        lightChart.destroy();
    }

    lightChart = new Chart(sgctx, {
        type: 'line',
        data: {
            labels: labelsArray,
            datasets: [{
                label: 'Water Level (%)',
                data: signalArray,
                backgroundColor: "rgba(168, 0, 3, 1)"
            }]
        },
        options: chartOptions
    });
}

function loadBatteryLevel(labelsArray, batteryArray){
    var btctx = document.getElementById('batChart').getContext('2d');

    if (batlevelChart) {
        batlevelChart.destroy();
    }

    batlevelChart = new Chart(btctx, {
        type: 'line',
        data: {
            labels: labelsArray,
            datasets: [{
                label: 'Battery (mV)',
                data: batteryArray,
                backgroundColor: "rgba(120, 134, 201, 1)"
            }]
        },
        options: chartOptions
    });
}