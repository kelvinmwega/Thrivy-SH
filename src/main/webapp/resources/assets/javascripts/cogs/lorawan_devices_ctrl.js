
var regDeviceUrl = ctx + "/registerDevice";
var getRegDevicesUrl = ctx + "/getRegisteredDevices";

$("#device-reg-form").submit(function( event ) {
    var newDeviceObj = {};

    var selectBox = document.getElementById("actType");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;

    newDeviceObj.sensor_name = document.getElementById("devname").value;
    newDeviceObj.device_eui = document.getElementById("dev_eui").value;
    newDeviceObj.device_address = document.getElementById("dev_addr").value;
    newDeviceObj.lat = document.getElementById("dev_lat").value;
    newDeviceObj.lon = document.getElementById("dev_lon").value;
    newDeviceObj.description = document.getElementById("description").value;
    newDeviceObj.activation_method = selectedValue;

    console.log(newDeviceObj);

    // $('#modalForm').addClass('mfp-hide');
    // $('.modal').removeClass('show');
    $("#closeButton").click();
    reqFN(newDeviceObj, regDeviceUrl, 'POST').done(procDevRegistration).done(getRegisteredDevices);

    event.preventDefault();
});

function procDevRegistration(data) {
    console.log(data);
    var alertObj = {};

    alertObj.title = 'Alert !';
    alertObj.text = data.message;
    alertObj.type = 'success';

    triggerNotification(alertObj);
}

function getRegisteredDevices() {
    $.getJSON(getRegDevicesUrl, function (data) {
        var tr;

        $("#devicesTableBody").empty();

        for (var i = 0; i < data.resp.length; i++){
            tr = $("<tr class=''" + " id=" + data.resp[i]._id + "/>");
            tr.append("<td class='text-center'>" + data.resp[i].owner.email + "</td>");
            tr.append("<td class='text-center'>" + data.resp[i]._id + "</td>");
            tr.append("<td class='text-center'>" + data.resp[i].activation_method + "</span></td>");
            tr.append("<td class='text-center'>" + data.resp[i].lat + "</span></td>");
            tr.append("<td class='text-center'>" + data.resp[i].lon + "</span></td>");
            tr.append("<td class='text-center'>" + new Date(data.resp[i].last_seen).toLocaleString() + "</span></td>");
            tr.append("<td class='text-center'>" + data.resp[i].description + "</span></td>");

            $('table#devicestable').append(tr);
        }

    })
}

function triggerNotification(alertObj){
    new PNotify(alertObj);
}

