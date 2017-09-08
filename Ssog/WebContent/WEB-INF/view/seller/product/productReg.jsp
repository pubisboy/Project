<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
td {

padding-left: 10px;

}

</style>
<div class="row" style="width: 100%; height:125%; margin-left: 50px;" >  
<p style="text-align: left; margin-top: 20px;"><b>쇼핑몰에 상품을 진열하는데 필요한 기본정보를 입력합니다.</b><br/>
상세한 상품정보 관리가 필요하시면 뭐요 
</p>
<table style="height: 100%; width: 100%;" border="1">  
	<tr style="height: 5%"><td style="width: 25%;">상품명</td><td style="width: 75%;"><input type="text" style="width: 70%" name="pro_name"/></td> 
	</tr>
	<tr style="height: 5%;"><td>판매가격</td><td><input type="text" style="width: 30%" name="price"> 원</td></tr>
	<tr style="height: 5%;"><td>판매수량</td><td><input type="text" style="width: 30%" name="pro_qty"></td></tr> 
	<tr style="height: 5%;"><td>분류</td><td>
	<select><option>아아</option><option>나나</option></select>
	</td></tr> 
	<tr style="height: 10%;"><td>아</td><td>시발</td></tr> 
	<tr style="height: 70%;"><td>아</td><td> 
		<textarea id="pro_detail" style="width: 100%; height: 100%; resize: none;"></textarea> 
	</td></tr> 

</table>
</div> 
<script src="/ckeditor/ckeditor.js"></script> 
<script>
   CKEDITOR.replace('pro_detail',{
	      width : '95%',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
	      height : '380px',  // 입력창의 높이	       
	     resize_enabled : false
	    });
 
</script>