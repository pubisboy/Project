<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>검색 : ${total }건</div>

<div>
	<select name="term" id="selTerm" onchange="term();">
		<option value="del" ${empty params.term ? 'selected' : ''}>--</option>
		<option value="yy/MM/dd"
			${!empty params.term and params.term eq 'yy/MM/dd' ? 'selected' : '' }>일</option>
		<option value="yy/MM"
			${!empty params.term and params.term eq 'yy/MM' ? 'selected' : '' }>월</option>
		<option value="yy"
			${!empty params.term and params.term eq 'yy' ? 'selected' : '' }>년</option>
	</select>
	<div id="selDetail">
		<div style="float: left; width: 20%;" id="begin"></div>
		<div style="float: left; width: 20%;" id="end"></div>
		<div style="float: left;" id="search"></div>
	</div>
</div>

<table class="table table-bordered" style="text-align: center;">
	<thead>
		<tr>
			<th width="30%;" style="text-align: center;">날짜</th>
			<th style="text-align: center;">매출액</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="i" varStatus="vs">
			<tr>
				<td>${i.PAY_DATE }</td>
				<td><fmt:formatNumber value="${i.PRICE }" pattern="#,###" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div align="center">
	<c:if test="${paging.startPageNo ne paging.firstPageNo }">
		<a
			href="/admin/sales/sales/chart.ja?p=${paging.startPageNo - 1}&sort=${params.sort}">&lt;</a>
	</c:if>

	<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo }"
		var="i">
		<a href="/admin/sales/sales/chart.ja?p=${i}&sort=${params.sort}"
			${paging.currentPageNo eq i ? 'style="font-weight:bold"' : '' }>${i }</a>
	</c:forEach>

	<c:if test="${paging.endPageNo ne paging.finalPageNo }">
		<a
			href="/admin/sales/sales/chart.ja?p=${paging.endPageNo + 1}&sort=${params.sort}">&gt;</a>
	</c:if>
</div>

<script src="<c:url value="/etc.js" />"></script>

<script>
	var term = function() {
		$.ajax({
			'url' : '/admin/sales/sales/calc_year.ja',
			'data' : {
				'term':$("#selTerm").val()
			}
		}).done(function(rst) {
			$("#begin").html(rst.b);
			$("#end").html(rst.e);
			$("#search").html(rst.s);
			bm();
			em();
		});
	}
	var bm = function(){
		if($("#selTerm").val() == 'yy/MM/dd'){
			$("#bm").on("change", function(){
				$.ajax({
					'url':"/admin/sales/sales/calc_day.ja",
					'data':{
						'y':$("#by").val(),
						'm':$("#bm").val(),
						'd':'1',
						'be':'b'
					}
				}).done(function(rst){
					$("#bd").html(rst);
				});
			});
		}else if($("#selTerm").val() == "del"){
			$("#begin").html("");
			$("#end").html("");
		}
	}
	var em = function(){
		if($("#selTerm").val() == 'yy/MM/dd'){
			$("#em").on("change", function(){
				$.ajax({
					'url':"/admin/sales/sales/calc_day.ja",
					'data':{
						'y':$("#ey").val(),
						'm':$("#em").val(),
						'd':'1',
						'be':'e'
					}
				}).done(function(rst){
					$("#ed").html(rst);
				});
			});
		}else if($("#selTerm").val() == "del"){
			$("#begin").html("");
			$("#end").html("");
		}
	}
</script>