<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<meta name="viewport" content="initial-scale=1.0">
<style>
  #map {
    height: 100%;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
</style>
</head>
<body>
    <div id="map"></div>
    <script>
    	var lat, lng;
	    navigator.geolocation.getCurrentPosition(function(e){
			console.log(e);
			lat = e.coords.latitude;
			lng = e.coords.longitude;
			window.alert(lat + "/" + lng);
		});
    
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          "center": {"lat": lat, "lng": lng},
          "zoom": 15
        });
      }
    </script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDo-BtuBgQQiMJPsGdgh3frL9QYbYW-NT8&callback=initMap"
    async defer></script>
  </body>
</html>