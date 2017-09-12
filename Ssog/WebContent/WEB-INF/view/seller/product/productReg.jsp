<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
td {

padding-left: 10px;

} 
img:hover {
	border: 2px solid silver; 
}
 
</style>
<div class="row" style="width: 100%; height:125%; margin-left: 50px;" >    
<p style="text-align: left; margin-top: 20px;"><b>이 곳은 상품 등록 페이지 입니다.</b><br/>
쇼핑몰에 상품을 진열하는데 필요한 기본정보를 입력합니다. 
</p> 
<form action="/seller/product/productRegExec.j" method="post" enctype="multipart/form-data">
<div class="form-group"> 
<table style="height: 100%; width: 100%;" border="1">  
	<tr style="height: 5%"><td style="width: 20%; background-color: #eaeaea;">상품명</td><td colspan="3"><input class="form-control" type="text" style="width: 95%" name="pro_name"/></td>
	</tr>
	<tr style="height: 5%;"><td style=" background-color: #eaeaea;">판매가격  </td>
	<td style="width: 30%;"><div class="navbar-form" style="padding: 0px; margin: 0px;"><input class="form-control" type="text" style="width: 82%" name="price" onkeydown="onlyNumber(this)"/>  원</div></td><td style="width: 20%; background-color: #eaeaea;">행사 등록</td>
	<td><input type="radio" class="group" value="사용함" name="radiogroup">사용  <input type="radio" class="group" value="사용 안함" name="radiogroup">사용안함</td>	
	</tr>
	<tr style="height: 5%;"><td style=" background-color: #eaeaea;" >판매수량</td> 
	<td colspan="3"><div class="navbar-form" style="padding: 0px; margin: 0px;"><input class="form-control" type="text" style="width: 30%" name="pro_qty" onkeydown="onlyNumber(this)" >  Kg</div></td></tr> 
	<tr style="height: 5%;"><td style=" background-color: #eaeaea;">분류</td>
	<td colspan="3">	<div class="navbar-form" style="padding: 0px; margin: 0px;">
	<select class="form-control" style="width: 30%;" id="large_cate"><option>대분류</option>
	<c:forEach items="${large_cate }" var="i" varStatus="vs">
		<option value="${i.B_CATE }">${i.NAME }</option>			
	</c:forEach>
	</select><select class="form-control" style="width: 30%; margin-left: 78px;" id="small_cate"><option>소분류</option></select> 
	</div>
	</td></tr> 
	<tr style="height: 5%;"><td style=" background-color: #eaeaea;" >생산지</td><td colspan="3">
	<select class="form-control" style="width: 30%;"><option>생산지</option>
	<c:forEach items="${originlist }" var="i">
	<option value="${i.NUM }">${i.NAME }</option>
	</c:forEach>
	</td></tr>
	 <tr style="height: 23%;"><td style=" background-color: #eaeaea;">대표 이미지</td><td colspan="3"><div class="col-sm-3" style="padding: 0px;"><div align="center"><img id="imgbox"; style="height: 150px;  width: 150px;" src="/image/사진등록기본.png"/>
	 <input type="file" name="pro_img" style="display: none;" id="img_upload"><button style="margin-top: 5px;" id="img_btn">등록+</button>
	 </div></div><div class="col-sm-9">
	 <div style="color: blue">- 쇼핑몰에 기본으로 보여지는 상품 이미지를 등록합니다.</div>
	 <div style="color: blue">- 대표 이미지 등록시 목록 이미지에 자동 리사이징 되어 들어갑니다.</div> 
	 <div style="color: gray;">- 권장 이미지 : 500px * 500px / 5Mb 미만 / png,jpg(jpeg)</div></div></td></tr> 
	<tr style="height: 52%;"><td style=" background-color: #eaeaea;">상품 상세</td><td colspan="3"> 
		<textarea id="pro_detail" style="width: 100%; height: 100%; resize: none;"></textarea> 
	</td></tr>  

</table>
<div align="right" style="margin-top: 10px;"> 
	<button type="submit" style=>상품 등록하기</button>
	</div>
</form> 
</div>
</div> 
<script src="/ckeditor/ckeditor.js"></script>  
<script> 
   CKEDITOR.replace('pro_detail',{
	      width : '95%',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
	      height : '330px',  // 입력창의 높이	       
	     resize_enabled : false
	    });
 	$("#imgbox").on("click",function(){
 		$("#img_upload").click();
 	})
 	$("#img_upload").on("change",function(){
 		var reader = new FileReader();
 		reader.onload = function(e) { 
 		document.getElementById("imgbox").src=e.target.result;
 		}
 		reader.readAsDataURL(this.files[0]);
 	})
</script>
<script>
$("#large_cate").change("click",function(){
    $.ajax({
       url : "/seller/product/smallcate.j",
       method: "get",
       data : { 
             "large_cate" : $("#large_cate").val(),
       }
    }).done(function(obj){ 
       var setTag = "";
       for(var i=0; i<obj.list.length; i++){
          setTag += "<option value=\"" + obj.list[i].S_CATE + "\">" + obj.list[i].NAME + "</option>";
       }
       $("#small_cate").html(setTag);  
    });
 });
 
 

</script>
<script>
function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}
	</script>