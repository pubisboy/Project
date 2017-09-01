<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table, th, td {
	font-size: 13px;
}
</style>
<div>
	<h4 style="font-size: 17px; text-align: left;">
		<span class="glyphicon glyphicon-info-sign"
			style="padding-right: 10px;"></span><b style="padding-right: 10px;">1:1
			문의</b><small style="font-size: 12px;">고객센터를 통하여 고객님께서 문의 하여 주신
			문의내역입니다.</small>
	</h4>
</div>
<b style="font-size: 12px; padding-right: 345px;">고객님께서 신청한 문의 : <b
	style="color: #ff4d4d; font-size: 13px;">${clist.size() }</b>건&nbsp;&nbsp;/&nbsp;
	답변완료 된 문의 : 0건
</b>
<a href="/member/myinfo/counsel_detail.j"><button>1:1 문의 하기</button></a>
<div class="row" style="padding-top: 10px;">
	<div class="col-sm-12">
		<table class="table table-hover">
			<thead>
				<tr style="border-top: 3px solid black;">
					<th>문의유형</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${clist }">
					<tr>
						<td>${obj.CATE }</td>
						<td>${obj.TITLE }</td>
						<td>${obj.COUNSEL_DATE }</td>
						<th></th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

