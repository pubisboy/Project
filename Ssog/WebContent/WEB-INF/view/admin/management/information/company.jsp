<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<table class="table table-bordered">
		<thead>
			<tr>
		        <th width="20%;" style="text-align: center;">분류</th>
		        <th style="text-align: center;">내용</th>
	    	</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="li" varStatus="vs" begin="0" step="1">
				<tr><th>${li.label }</th><th id="${vs.index }">${li.val }</th></tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<a href="/admin/information/companyModify.ja">회사 정보 수정</a>