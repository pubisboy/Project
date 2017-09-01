<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" align="center">
   <h2>공지사항 등록</h2>
   <div id="alert"></div>
   <div class="col-xs-0 col-md-1"></div>
   <div class="col-xs-12 col-md-10">
         <div class="form-group">
            <div align="left"><label>제목</label></div>
            <input type="text" name="title" id="title" class="form-control">
         </div>
          <div class="form-group">
            <div align="left"><label>대상</label></div>
            <select class="form-control" name="target"  id="target">
            	<c:forEach var="i" items="${list }">
            		<option value="${i.NUM }">${i.TARGET }</option>
            	</c:forEach>
            </select>
         </div>
         <div class="form-group">
            <div align="left"><label>내용</label></div>
            <textarea rows="15" class="form-control" name="content" id="content" style="resize: none"></textarea>
         </div>
         <div class="form-group">
            <button id="submit" type="button" class="btn btn-default">작성</button>
            <button type="reset" class="btn btn-default">취소</button>
         </div>
   </div>
   <div class="col-xs-0 col-md-1"></div>
</div>
<script>
	$("#submit").on("click", function(){
		$.ajax({
			url : "/admin/notice/notice_writeExec.ja",
			data : {
				title : $("#title").val(),
				target : $("#target").val(),
				content : $("#content").val()
			}
		}).done(function(rst){
			if(rst){
				location.href="/admin/notice/notice_list.ja";
			}else{
				$("#alert").html("<h4 style='color: red'>등록 실패</h4>");
			}
		});
	});
</script>