<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<form action="/admin/information/companyModifyExec.ja" method="post">
		<table class="table table-bordered">
			<thead>
				<tr>
			        <th width="20%;" style="text-align: center;">분류</th>
			        <th style="text-align: center;">내용</th>
		    	</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="li" varStatus="vs">
					<tr><th>${li.label }</th><th><input type="text" style="width: 100%;" value="${li.val }" name="${li.name }" ${li.name eq 'FAX' or li.name eq 'ETC' ? '' : 'required=\'required\''}/></th></tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="submit">수정하기</button>
	</form>
</div>
<a href="/admin/information/company.ja">취소</a>