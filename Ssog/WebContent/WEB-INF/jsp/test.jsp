<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		paging.startPageNo : paging의 시작 지점
		paging.endPageNo : paging의 끝 지점
		
	 -->
	 
	<!-- 
		현재 표시되는 paging의 시작 지점이 1 과 동일하지 않을 경우 paging set 전환 기능 추가
		id로 넣어서 확인만, 실제 사용될 때는 page 이동 값으로 사용
	 -->
	<c:if test="${paging.startPageNo ne 1 }"><a href="" id="${paging.prevPageNo }">&lt;</a></c:if>
	
	<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo }" var="i" step="1">
		[${i }]
	</c:forEach>
	
	<!-- 현재 표시되는 paging의 끝 지점이 전체 paging 개수와 동일하지 않을 경우 paging set 전환 기능 추가 -->
	<c:if test="${paging.endPageNo ne paging.finalPageNo }"><a href="" id="${paging.nextPageNo }">&gt;</a></c:if>
</body>
</html>