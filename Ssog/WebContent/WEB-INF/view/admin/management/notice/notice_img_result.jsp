<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${result }">
		<script>
			window.parent.CKEDITOR.tools.callFunction(${funcNum}, "${imageUrl}");
		</script>
	</c:when>
<<<<<<< HEAD
	<c:otherwise>
		<!-- <script>
			window.alert("이미지 업로드 실패");
		</script> -->
	</c:otherwise>
</c:choose>
=======
</c:choose> 
>>>>>>> branch 'master' of https://github.com/pubisboy/Project.git
