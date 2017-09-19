<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.circle1 {
 width:200px;
 height:200px;
 border-radius:100px;
 -moz-border-radius : 100px;
 -webkit-border-radius : 100px;
 -ms-border-radius :100px;
 -khtml-border-radius : 100px;
 -o-border-radius :100px;
 background:#09F;
 font:normal 12px/200px "나눔고딕", "돋움", "굴림";
 color:#fff;
 text-align:center;
}
.circle2 {
 width:100px;
 height:100px;
 border-radius:50px;
 -moz-border-radius : 50px;
 -webkit-border-radius : 50px;
 -ms-border-radius :50px;
 -khtml-border-radius : 50px;
 -o-border-radius :50px;
 background:#FF9;
 font:normal 12px/100px "나눔고딕", "돋움", "굴림";
 color:#222;
 text-align:center;
}
.circle3 {
 width:50px;
 height:50px;
 border-radius:25px;
 -moz-border-radius : 25px;
 -webkit-border-radius : 25px;
 -ms-border-radius :25px;
 -khtml-border-radius : 25px;
 -o-border-radius :25px;
 background:#66F;
 font:normal 11px/50px "나눔고딕", "돋움", "굴림";
 color:#fff;
 text-align:center;
}
</style>

<div class="container">
   	오늘의 상황
    <div class="row">
        <div class="col-xs-2">
			<div class="circle2">
				주문 : ${doc }
			</div>
        </div>
         <div class="col-xs-2">
			<div class="circle2">
				결제 : ${dpc }
			</div>
        </div>
        <div class="col-xs-2">
        	<div class="circle2">
				신규유저 : ${duc }
			</div>
        </div>
        <div class="col-xs-2">
        	<div class="circle2">
				전체유저 : ${auc }
			</div>
        </div>
        <div class="col-xs-2">
        	<div class="circle2">
				탈퇴유저 : ${luc}
			</div>
        </div>
        <div>
        	<button class="btn btn-default" id="cup">유효 기간 지난 쿠폰 삭제<sub id="te" style="color: blue;">${!empty uncupon and uncupon > 0 ? uncupon : '0'}</sub></button>
        </div>
    </div>
</div>

<script>
$("#cup").on("click", function(){
	$.ajax({
		'url':"/admin/delUnableCupon.ja"
	}).done(function(rst){
		$("#te").html(rst);
	})
})

</script>