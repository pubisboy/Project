<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h2>javascript navigator</h2>
<script>
	console.log(navigator.geolocation);//사용자 위치정보를 담고 있는 객체
	//https가 아니면 이건 쓸수가 없음. 브라우저가 차단을 함
	//(크롬은 보안 레벨이 높아서 안되고, 파폭은 된다)
	navigator.geolocation.getCurrentPosition(function(e){
		console.log(e);
		var lat = e.coords.latitude;
		var lng = e.coords.longitude;
		window.alert(lat + "/" + lng);
	});
</script>