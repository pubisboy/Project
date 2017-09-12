<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-bordered" style="text-align: center; min-height: 50%;">
	<tbody>
		<tr>
			<td>
				<h4><b>${list.TITLE}</b></h4>
			</td>
		</tr>
		<tr>
			<td>
				<div style="float: left; width: 33%;"><b>번호</b>:${list.NOTICE_NUM }</div>
				<div style="float: left; width: 33%;"><b>대상</b>:${list.TARGETS }</div>
				<div style="float: right; width: 33%;"><b>작성일자</b>:
				<fmt:formatDate value="${list.NOTICE_DATE }" pattern="yyyy-MM-dd hh:mm" var="time"/>${time } 
				</div>
			</td>
		</tr>
		<tr style="height: 100%;">
			<td style="text-align: left">
				${list.CONTENT}
			</td>
		</tr>
	</tbody>
</table>
<div style="float: left; width: 33%; text-align: left"><a href="/admin/management/notice/notice_modify.ja?num=${list.NOTICE_NUM }">수정</a></div>
<div style="float: right; width: 33%; text-align: right"><a href="/admin/management/notice/notice_del.ja?num=${list.NOTICE_NUM }">삭제</a></div>