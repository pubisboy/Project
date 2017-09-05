<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-sm-3" align="center">
			<h3>SSOG</h3>
		</div>
		<div class="col-sm-7" style="padding-bottom: 30px;" id="footer"></div>
	</div>
</div>

<script>
	function init(){
		$.ajax({
			url:"/admin/getInfoCompany.ja",
			method: "post"
		}).done(function(rst){
			$("#footer").html("회사이름 : "+rst.NAME + "&nbsp;&nbsp;" + "대표이사 : "+rst.CEO + "&nbsp;&nbsp;" + "주소 : "+rst.ADDR + "&nbsp;&nbsp;" + "사업자 등록 번호 : "+rst.LICENSE + "&nbsp;&nbsp;" +
			"통신 판매업 신고 번호 : "+rst.REPORT_NUM + "&nbsp;&nbsp;" + "개인정보 관리 책임자 : "+rst.PD + "&nbsp;&nbsp;" + "대표 메일 : "+rst.EMAIL + "&nbsp;&nbsp;" + "대표 번호 : "+rst.PHONE + "&nbsp;&nbsp;" +
			(rst.FAX == null ? '' : 'FAX : '+rst.FAX + '&nbsp;&nbsp;') + (rst.ETC == null ? '' : rst.ETC + '&nbsp;&nbsp;') + rst.COPYRIGHT);
		});
	}
	init();
</script>