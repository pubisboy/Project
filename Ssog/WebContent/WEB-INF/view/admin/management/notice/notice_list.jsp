<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>검색 : ${total }명</div>
<div>
	<div style="float: left; width: 33%;">
		<form action="/admin/management/notice/notice_list.ja" method="get" id="stateForm">
			<input type="hidden" name="value" value="${empty params.value ? '' : params.value}"/>
			<select id="state" name="state">
				<optgroup label="대상">
				<option value="">전체</option>
				<c:forEach items="${target }" var="i" varStatus="vs">
					<option value="${i.NUM }" ${params.state eq i.NUM ? 'selected' : ''}>${i.TARGET }</option>
				</c:forEach>
				</optgroup>
			</select>
		</form>
	</div>
	<div style="float: right; text-align: right"><a href="/admin/management/notice/notice_write.ja">글쓰기</a></div>
</div>
<table class="table table-bordered" style="text-align: center;">
	<thead>
		<tr>
			<th width="15%;" style="text-align: center;">번호</th>
	       	<th style="text-align: center;">제목</th>
	       	<th width="20%;" style="text-align: center;">등록일</th>
	       	<th width="15%;" style="text-align: center;">대상</th>
    	</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="i" varStatus="vs">
			<tr>
				<td>${i.NOTICE_NUM }</td>
				<td align="left"><a href="/admin/management/notice/notice_detail.ja?num=${i.NOTICE_NUM }">${i.TITLE }</a></td>
				<td>
				<fmt:formatDate value="${i.NOTICE_DATE }" pattern="yyyy-MM-dd hh:mm" var="time"/>${time }</td>
				<td>${i.TARGETS }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div align="center">
	<c:if test="${paging.startPageNo ne paging.firstPageNo }">
		<a href="/admin/management/notice/notice_list.ja?p=${paging.startPageNo - 1}&value=${params.value}&state=${params.state}">&lt;</a>
	</c:if>
	
	<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo }" var="i">
		<a href="/admin/management/notice/notice_list.ja?p=${i}&value=${params.value}&state=${params.state}" ${paging.currentPageNo eq i ? 'style="font-weight:bold"' : '' }>${i }</a>
	</c:forEach>
	
	<c:if test="${paging.endPageNo ne paging.finalPageNo }">
		<a href="/admin/management/notice/notice_list.ja?p=${paging.endPageNo + 1}&value=${params.value}&state=${params.state}">&gt;</a>
	</c:if>
</div>


<div align="center">
	<form action="/admin/management/notice/notice_list.ja" method="get">
		<input type="text" name="value" value="${empty params.value ? '' : params.value}"/>
	</form>
</div>

<script>
	$("#state").on("change", function(){
		$("#stateForm").submit();
	})
</script>