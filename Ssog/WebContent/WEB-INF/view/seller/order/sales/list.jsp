<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<div id="curve_chart"></div>
  
  
   <script type="text/javascript">
     google.charts.load('current', {'packages':['corechart']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
       var data = google.visualization.arrayToDataTable([
         ['price', 'pronum'],
         <c:forEach items="${list}" var="i" varStatus="vs">
			[${i.PRICE}, ${i.PRONUM}]
			<c:if test="${!vs.last }"> , </c:if>
	  </c:forEach>
       ]);

       var options = {
         title: '개인별 포인트 그래프',
         curveType: 'function',
         legend: { position: 'bottom' }
       };

       var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

       chart.draw(data, options);
     }
</script>