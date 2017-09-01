<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-sm-12">
		<h4 style="font-size: 17px; text-align: left;">
			<span class="glyphicon glyphicon-info-sign"
				style="padding-right: 10px;"></span><b style="padding-right: 10px;">1:1
				문의</b><small>고객님께서 문의하신 내용에 대한 답변은 마이페이지>1:1 문의에서 확인이 가능합니다.</small>
			<div style="border-top: 2px solid #595959;">
				<form action="/member/myinfo/counsel_rst.j" enctype="multipart/form-data" method="post"	>
					<div class="row">
						<div class="col-xs-4" style="border-right: 1px solid #595959;">문의유형</div>
						<div class="col-xs-8">

							<select class="form-control" name="cate" id="cate">
								<option>---선택---</option>
								<c:forEach var="i" items="${cate }">
									<option value="${i.NUM }">${i.CATEGORY }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">이름</div>
						<div class="col-xs-2">${memberinfo.NAME }</div>
						<div class="col-xs-3">연락가능 전화번호</div>
						<div class="col-xs-3">${memberinfo.PHONE }</div>
					</div>
					<div class="row">
						<div class="col-xs-4">제목</div>
						<div class="col-xs-8">
							<input type="text" style="width: 100%;" name="title">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">문의 내용</div>
						<div class="col-xs-8">
							<input type="text" style="width: 100%; height: 100px;" name="content">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">이미지첨부</div>
						<div class="col-xs-8">
							<input type="file" name="f" />
							<button type="button">삭제</button>
							<div></div>
						</div>
					</div>

					<input type="submit" value="문의하기">
					<button type="button">취소하기</button>
				</form>
			</div>
		</h4>
	</div>
</div>
