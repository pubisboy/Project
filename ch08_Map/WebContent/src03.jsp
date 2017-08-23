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
	    function initMap() {
	    	var pos = {"lat": 37.498034, "lng": 129.044};
	        var map = new google.maps.Map(document.getElementById('map'), {
	          "center": pos,
	          "zoom": 15
	        });
	        var marker = new google.maps.Marker({
	            "map": map,
	            "position": {
	            	"lat": 37.498034,
	            	"lng": 127.027430
	            },
	            "title" : "Hello world!"
	          });
	      }
    </script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDo-BtuBgQQiMJPsGdgh3frL9QYbYW-NT8&callback=initMap"
    async defer></script>
  </body>
</html>