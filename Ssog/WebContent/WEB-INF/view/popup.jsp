<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.image {
	background-image: url(/admin/popupImg/760a39e2-e08d-4133-bfaf-f5dbfbffdc0a);
	background-position: left top;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
</style>

<c:if test="${!empty params['0'].IMG_UUID }">
	<div class="image" style="width: 100%; height: 100%;">
		<div class="text">
			<c:if test="${!empty params['0'].CONTENT }">
				${params['0'].CONTENT }
			</c:if>
		</div>
		<div class="button" style="bottom: 10px;">
			<c:if test="${!empty params['0'].CUPON_BASE}">
				<button type="button" id="cupon" value="${params['0'].CUPON_BASE}">쿠폰받으세여~</button>
			</c:if>
		</div>
	</div>
</c:if>

<script>
	$("#cupon").on("click", function() {
		window.alert("쿠폰 받고 싶다냥" + $(this).val());
	});
</script>