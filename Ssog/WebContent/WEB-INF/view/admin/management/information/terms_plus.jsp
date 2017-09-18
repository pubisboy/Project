<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row" align="center">
	<h2>이용약관 등록</h2>
	<div id="alert"></div>
	<div class="col-xs-0 col-md-1"></div>
	<div class="col-xs-12 col-md-10">
		<form action="/admin/management/information/terms_plusExec.ja"
			method="post">
			<div class="form-group">
				<div align="left">
					<label>제목</label>
				</div>
				<input type="text" name="title" id="title" class="form-control">
			</div>
			<div class="form-group">
				<div align="left">
					<label>내용</label>
				</div>
				<textarea rows="15" class="form-control" name="content" id="content"
					style="resize: none"></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default">작성</button>
				<button type="button" class="btn btn-default" onclick="cancel('/admin/management/information/terms.ja');">취소</button>
			</div>
		</form>
	</div>
	<div class="col-xs-0 col-md-1"></div>
</div>
<script src="/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('content', {
		'resize_enabled' : false
	});
</script>

<script src="<c:url value="/etc.js" />"></script>