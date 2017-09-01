<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table, th, td {
   font-size: 13px;
}
</style>
<div>
<h4 style="font-size: 17px; text-align: left;">
	<span class="glyphicon glyphicon-info-sign" style="padding-right: 10px;"></span><b style="padding-right: 10px;">회원정보 수정</b><small>회원님의 개인정보를 수정하실 수 있습니다.</small>
</h4>
</div>
<hr  style="border-top: 3px solid black;"/>
<b>웹 회원 필수정보</b>
<div class="row" style="padding-top: 10px;"> 
	<div class="col-sm-12">
		<table class="table">
    <tbody>
      <tr>
        <td class="active" style="width:16%;">회원 아이디</td>
        <td>${memberinfo.ID }</td>
      </tr>      
      <tr >
        <td class="active">이름</td>
        <td>${memberinfo.NAME }</td>
      </tr>
      <tr>
        <td class="active">생년월일</td>
        <td>${memberinfo.BIRTH }</td>
      </tr>
      <tr>
        <td class="active">성별</td>
        <td>${memberinfo.GENDER }</td>
      </tr>
      <tr>
        <td class="active">휴대전화</td>
        <td>${memberinfo.PHONE }</td>
      </tr>
      <tr >
        <td class="active">이메일</td>
        <td>${memberinfo.EMAIL }</td>
      </tr>
      <tr >
        <td class="active">주소입력</td>
        <td>${memberinfo.ADDRESS }</td>
      </tr>
    </tbody>
  </table>
	</div>
</div>