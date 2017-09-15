<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<h2>Google Map API</h2>
	일단 google map api 검색해서 사이트 접근 후에, 지도를 띄울 영역을 설정하고<br>
	미리 활성화된 영역에 나중에 그려지는거라서 사이즈가 있어야 함.
	???????????????????
	<hr>
	
	
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          "center": {"lat": 37.498014, "lng": 127.027400},
          "zoom": 15
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDo-BtuBgQQiMJPsGdgh3frL9QYbYW-NT8&callback=initMap"
    async defer></script>
  </body>
</html>