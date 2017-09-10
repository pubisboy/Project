<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<div style="width: 58.5%; padding-top: 30px;">
		<div class="row">
			<div class="col-sm-12"
				style="border-bottom: 2px solid gray; border-left: 1px solid gray; border-right: 1px solid gray;">
				<div class="row">
					<div class="col-sm-8"
						style="border-top: 2px solid black; border-right: 1px solid #b3b3b3; padding: 0px;">
						<div
							style="padding-left: 40px; padding-top: 15px; padding-bottom: 15px; text-align: left;">
							<span class="glyphicon glyphicon-shopping-cart"
								style="font-size: 30px; color: #b3b3b3;"></span><b
								style="font-size: 15px; color: #b3b3b3;">장바구니</b>
							<span class="glyphicon glyphicon-chevron-right"
								style="font-size: 30px; padding-left: 55px; padding-right: 55px; color: #b3b3b3;"></span>  
							<span class="glyphicon glyphicon-credit-card"
								style="font-size: 45px;"></span> <b style="font-size: 26px;">주문/결제</b> <span
								class="glyphicon glyphicon-chevron-right"
								style="font-size: 30px; padding-left: 55px; padding-right: 55px; color: #b3b3b3;"></span> 
							<span class="glyphicon glyphicon-gift"
								style="font-size: 30px; color: #b3b3b3;"></span> <b
								style="font-size: 15px; color: #b3b3b3;">주문완료</b>
						</div>
					</div>
					<div class="col-sm-4" style="border-top: 2px solid #ff0066;">
						<div
							style="height: 86px; padding-top: 35px; padding-left: 28px;"
							align="left">
							<b style="font-size: 18px; color: #4d4d4d;">${memberinfo.NAME }님</b> 반갑습니다!<br />
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12"
				style="padding-top: 40px; padding-left: 0px; padding-right: 0px; padding-bottom: 20px;">
			<div align="left">
					<b style="font-size: 17px;">주문상품</b>
				</div>
				<table class="table table-hover">
					<thead>
						<tr style="border-top: 2px solid black; background-color: #f2f2f2; height: 40px;">
							<th></th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>할인금액</th>
							<th>구매예정금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${list }">
							<tr style="border-bottom: 1px solid #b3b3b3;">
								<td>상품이미지</td>
								<td>${c.PRO_NUM }</td>
								<td>${c.PRICE }</td>
								<td>${number }</td>
								<td></td>
								<td class="price">${c.PRICE * number }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			<div class="col-sm-12" style="padding: 0px;">
			<div align="left">
					<b style="font-size: 17px;">고객정보</b>
				</div>
			<table class="table">
			<tbody>
				<tr style="border-top: 2px solid black;">
					<td class="active" style="width: 16%;">수령인</td>
					<td><input type="text"/><input type="checkbox"/>주문자와 동일</td>
				</tr>
				<tr>
					<td class="active">휴대전화</td>
					<td><select name="phone1" id="phone1"
						style="width: 60px; height: 25px;">
							<c:forTokens var="i" items="010,011,016,017,018,019" delims=",">
							<option value="${i }" >${i }</option>
							</c:forTokens>
					</select>
					 - <input type="text" style="width: 60px; height: 25px;" value="${memberinfo.phone2 }" id="phone2"/> - <input
						type="text" style="width: 60px; height: 25px;" value="${memberinfo.phone3 }"id="phone3" /><br />
						<input type="checkbox" id="sms" ${memberinfo.ck_sms eq 'on' ? 'checked' : '' }/>
						 <small	style="font-size: 11px; padding-bottom: 5px;">수신동의하고 특별한
							쇼핑정보, 엄청난 혜택 알림을 문자로 받아보세요.</small></td>
				</tr>
				<tr>
					<td class="active">주소입력</td>
					<td style="padding-left: 0px;"> 
						<div class="navbar-form" style="padding-left: 8px;">
							<input type="text" name="postcode" id="postcode"
								 style="width: 140px;"> <input
								type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기" style="width: 100px; font-size: 13px;"><br />
						</div>
						<div class="navbar-form" style="padding-left: 8px;">
							<input type="text" name="address1" id="address1" style="width: 240px;">
							<input type="text" name="address2" id="address2" style="width: 240px;"> <br />
						</div>
					</td>
				</tr>
				<tr>
					<td class="active" style="width: 16%;">배송시<br/>요구사항</td>
					<td><textarea></textarea></td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button style="background-color: #ff3399;" id="order">결제하기</button>
			<button>주문취소</button>
		</div>
		</div>
	</div>
			</div>
