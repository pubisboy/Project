<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
	<div style="padding-top: 20px;">
		<h4 style="font-size: 17px; text-align: left;">
			<span class="glyphicon glyphicon-info-sign"
				style="padding-right: 10px;"></span><b style="padding-right: 10px;">공지사항</b>
				<small style="font-size: 12px;">쏙쇼핑몰에서 알려드립니다.</small>
		</h4>
	</div>
	<div class="col-sm-12" style="border-bottom: 1px solid gray;">
	<div style="border-bottom: 1px solid gray; border-top: 2px solid black;">
		${notice.TITLE} 
	</div>
	<div>
		${notice.CONTENT}
	</div>
	</div>
	<div class="col-sm-12" style="border-bottom: 1px solid gray; border-top: 1px solid gray;">
	<div style="border-bottom: 1px solid gray;">
	이전글 뜨는곳
	</div>
	<div>
	다음글 뜨는곳
	</div>
	</div>
	<button>목록으로</button>
</div>