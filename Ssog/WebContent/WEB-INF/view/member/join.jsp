<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" class="row">
	<div class="col-xs-0 col-md-3"></div>
	<div class="col-xs-12 col-md-6">
		<h3 style="margin: 0">회원가입</h3>
		
		<form action="/user/join_rst.j" method="post">
			<div class="form-group">
			<br/>
				<input class="form-control" type="text" placeholder="이름" name="name"
					id="name" required style="width: 90%;"/><br/>
				<input class="form-control" type="text" placeholder="생년월일(yyyymmdd)" name="birth"
					id="birth" required style="width: 90%;"><span class="glyphicon glyphicon-question-sign"data-toggle="tooltip" title="생년월일 정보는 신원을 확인하거나 특정 Ssog<br/>서비스를 활성화하는데 사용됩니다."></span><br/><hr/>
				<input class="form-control" type="text" placeholder="아이디" name="id"
					id="id" required style="width: 90%;"/>
				<p id="id_chk"></p>
			</div>
			<div class="form-group">
				
				<input class="form-control" type="password" placeholder="●●●●●"
					name="pw" id="pw" required style="width: 90%;"/><br/><hr/>
					<input class="form-control" type="text" placeholder="주소" name="address"
					id="address" required style="width: 90%;"/><br/>
					<input class="form-control" type="text" placeholder="휴대폰번호(-제외)" name="phone"
					id="phone" required style="width: 90%;"/><br/>
			</div>
			<div class="form-group">
				
				<div class="navbar-form navbar">
					<input style="width: 60%;" class="form-control" type="email"
						placeholder="이메일" name="email" id="email" required style="width: 90%;"/>
					<button class="btn btn-info" type="button" name="emailaccredit"
						id="emailaccredit" style="width: 32%;">인증하기</button>
						<p id="email_chk"></p>
				</div>
				<input class="form-control" style="display: none; width: 90%;" type="text"
					name="contxt" id="contxt"/>
				<button style="display: none" type="button" name="confirm"
					id="confirm">확인</button><hr/>
				<div align="left" style="padding-left: 60px;">
				<input type="checkbox"style="width: 15px;height: 15px;"/>공지사항<br/>
				이벤트, 쇼핑혜택 등에 대한 알림 및 새로운 정보를 받아봅니다.
				</div>
			</div>
				
			<div class="row">
				<button type="submit" class="btn btn-info" style="width: 40%">가입하기</button>
				<button type="reset" class="btn btn-default" style="width: 40%">초기화</button>
			</div>
		</form>

	</div>
	<div class="col-xs-0 col-md-3"></div>

</div>
<script>
	var joinChk = function() {
		if (this.value.trim().length > 0) {
			var id = this.id;
			var value = this.value;
			var req = new XMLHttpRequest();
			req.onreadystatechange = function() {
				if (this.readyState == 4) {
					var ihtml;
					var rText = this.responseText;
					if (rText.trim() == "false") {
						ihtml = "<b style='color:green;'>훌륭합니다!</b>";
						//document.getElementById("sbt").disabled=false;
					} else {
						ihtml = "<b style='color:red;'>이미 사용중 입니다.</b>";
						//document.getElementById("sbt").disabled=true;
					}
					document.getElementById(id + "_chk").innerHTML = ihtml;
				}
			}
			req.open("get", "/member/joinajax.j?type=" + this.id + "&val="
					+ this.value, true);
			req.send();
		}
	}
	document.getElementById("id").onblur = joinChk;
	document.getElementById("email").onblur = joinChk;

	document.getElementById("emailaccredit").onclick = function() {

		var email = document.getElementById("email").value;
		//window.alert(email);

		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

		if (email.match(regExp)) {
			var req = new XMLHttpRequest();
			req.open("get", "/member/emailaccredit.j?email=" + email, true);
			req.send();
			document.getElementById("contxt").style.display = "";
			document.getElementById("confirm").style.display = "";
			req.onreadystatechange = function() {
				if (this.readyState == 4) {
					if (this.responseText == "true") {

					} else {
						document.getElementById("contxt").style.display = "none";
					}
				}
			}
		} else {
			window.alert("이메일 형식이 아닙니다.");
		}
	}
	document.getElementById("confirm").onclick = function() {
		var contxt = document.getElementById("contxt").value;
		var req = new XMLHttpRequest();
		req.open("get", "/member/result.j?contxt=" + contxt, true);
		req.send();
		req.onreadystatechange = function() {
			if (this.readyState == 4) {
				if (this.responseText == "true") {
					window.alert("성공");
				} else {
					window.alert("실패");
				}
			}
		}
	}
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
</script>