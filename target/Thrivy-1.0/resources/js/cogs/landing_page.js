var getDevicesURL = ctx + "/getDevices";
var markers = [];

function initMap() {
    var myLatLng = new google.maps.LatLng(-1.366950, 36.852228);
    var mapProp={
        mapTypeId:google.maps.MapTypeId.HYBRID
    };
    map = new google.maps.Map(document.getElementById('googleMap'), {
        zoom: 13,
        center: new google.maps.LatLng(-1.358291, 36.833340),
        mapTypeId: google.maps.MapTypeId.HYBRID
    });
}

function getDevices() {
    var data = {};
    data.key = "device";
    reqFN(data, getDevicesURL, 'post').done(processDevData);
}

function processDevData(data){
    console.log(data.docs);

    // $('#deviceSelector').empty();
    //
    // for (var i = 0; i < data.docs.length; i++) {
    //     var ddRow = "<option value = " + data.docs[i].deviceid + ">" + data.docs[i].deviceid + "</option>";
    //     $('#deviceSelector').append(ddRow);
    // }

    loadDeviceMarkers(data.docs);
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
                '<p><b>Type</b> : %s</p>'+
                '<p><b>ID</b> : %s </p>'+
                '<p><b>Location</b> : %s </p>'+
                '<p><b>Status</b> : %s </p>'+
                '<p><b>Seen</b> : %s </p>'+
                '</div>'+
                '</div>', [respObject[i].devicetype, respObject[i].deviceid, respObject[i].location, respObject[i].status,
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

    // clickroute(respObject[0].latitude, respObject[0].longitude);

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