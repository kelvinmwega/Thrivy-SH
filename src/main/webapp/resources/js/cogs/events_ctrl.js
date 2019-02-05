/**
 * Created by KelvinMwegaKiana on 16/11/2018.
 */

var getDevDataURL = ctx + "/getDeviceEvents";

function selectDev(lmdevName){

    var timeStamp = new Date();
    var stopTime = new Date();

    stopTime.setHours(stopTime.getHours() - 72);

    $('#devName').text(lmdevName);

    reqProcessor(lmdevName, timeStamp.toISOString(), stopTime.toISOString());

    console.log("Selected Device : " + lmdevName + " --- " + timeStamp.toISOString() + " ---- " + stopTime.toISOString());
}

function fetchHistoricalData(){
    var startTimeRaw = document.getElementById("datetimepicker_dark1").value;
    var stopTimeRaw = document.getElementById('datetimepicker_dark').value;
    var mylmdevName = "865905021073824";

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

function reqProcessor(lmdevName, startTime, stopTime){
    var reqData = {};
    var doorData;

    reqData["device"] = lmdevName;
    reqData["startTime"] = startTime;
    reqData["stopTime"] = stopTime;
    reqData["msgtype"] = "01";
    doorData = jQuery.extend(true, {}, reqData);
    doorData["msgtype"] = "10";
    console.log("## power " + JSON.stringify(doorData));

    //showLoading();
    reqFN(doorData, getDevDataURL, 'post').done(processPowerData);
    reqFN(reqData, getDevDataURL, 'post').done(processDoorData);
}

function processPowerData(data){
    console.log(data);
    var tr;

    $("#poweventsTableBody").empty();

    var powerstat;

    if (data.docs[0].power === '1'){
        powerstat = "ON";
    } else {
        powerstat = "OFF";
    }

    //$('#powerstat').text(powerstat);
    //$('#powercnt').text("Power Switched On   : " + data.docs[0].payload.data.powercnt + " Times");

    for (var i = 0; i < data.docs.length; i++) {

        var powerstatus;

        if (data.docs[i].power === '1'){
            powerstatus = "ON";
            tr = $("<tr class='active'" + " id=" + data.docs[i]._id + "/>");
        } else {
            powerstatus = "OFF";
            tr = $("<tr class='info'" + " id=" + data.docs[i]._id + "/>");
        }

        tr.append("<td class='text-center'>" + data.docs[i].deviceid + "</td>");
        //tr.append("<td class='text-center'>" + data.docs[i].msgtype + "</span></td>");
        tr.append("<td class='text-center'>" + powerstatus + "</span></td>");
        tr.append("<td class='text-center'>" + data.docs[i].powercnt + "</span></td>");
        tr.append("<td class='text-center'>" + new Date(data.docs[i].timestamp).toLocaleString() + "</td>");
        //tr.append("<td class='text-center'>" + new Date(data.docs[i].timestamp).toLocaleString() + "</td>");

        $('table#poweventsTable').append(tr);
    }
}

function processDoorData(data){
    console.log(data.docs);
    var tr;
    var doorstat;

    $("#eventsTableBody").empty();

    if (data.docs[0].door === '0'){
        doorstat = "Closed";
    } else {
        doorstat = "Opened";
    }

    //$('#doorstat').text(doorstat);
    //$('#doorcnt').text("Door Opened : " + data.docs[0].payload.data.doorcnt + " Times");

    for (var i = 0; i < data.docs.length; i++) {

        var doorstatus;

        if (data.docs[i].door === '0'){
            doorstatus = "Close";
            tr = $("<tr class='active'" + " id=" + data.docs[i]._id + "/>");
        } else {
            doorstatus = "Open";
            tr = $("<tr class='info'" + " id=" + data.docs[i]._id + "/>");
        }

        tr.append("<td class='text-center'>" + data.docs[i].deviceid + "</td>");
        //tr.append("<td class='text-center'>" + data.docs[i].msgtype + "</span></td>");
        tr.append("<td class='text-center'>" + doorstatus + "</span></td>");
        tr.append("<td class='text-center'>" + data.docs[i].doorcnt + "</span></td>");
        tr.append("<td class='text-center'>" + new Date(data.docs[i].timestamp).toLocaleString() + "</td>");
        //tr.append("<td class='text-center'>" + new Date(data.docs[i].timestamp).toLocaleString() + "</td>");

        $('table#eventsTable').append(tr);
    }
}