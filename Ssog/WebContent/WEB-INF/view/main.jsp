<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li> 
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://68.media.tumblr.com/0f711ca3dffbfe39307036d50c5e52b3/tumblr_nwxy5xItU81spslhyo1_1280.jpg" style="width: 100%; height: 460px;" alt="Image">
        <div class="carousel-caption">
          <h3>GADEN;HADA</h3>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="http://68.media.tumblr.com/6d6a0b50211b56602813d18bbcc96915/tumblr_nt4cw9pLOu1spslhyo1_1280.jpg" style="width: 100%; height: 460px;" alt="Image">
        <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>      
      </div>
        <div class="item">
        <img src="http://www.hellonature.net/shop/web/images/plans/thanksgiving_2017/vis_top.jpg" style="width: 100%; height: 460px;" alt="Image">
        <div class="carousel-caption"> 
        </div>      
      </div>
    </div> 
   

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
<div align="center" style="padding-top: 15px;">  
<div class="row" style="width: 53%;">  
<div class="col-xs-4" style="background: blue; height: 12.5%;">dd</div>     
<div class="col-xs-4" style="background: red; height: 12.5%;">dd</div>
<div class="col-xs-4" style="background: black; height: 12.5%;">dd</div>  
</div>
	<div style="padding-top: 20px; font-size: 40px;">
	Recommendation<b>PRODUCT</b> <hr/> 
	<div style="padding-top: 10px;"> 
	<img src="http://www.hellonature.net/shop/data/skin/renew_C/img/banner/%EC%B6%94%EC%B2%9C%EC%83%81%ED%92%88_%EB%AC%B4%ED%99%94%EA%B3%BC.jpg" height="300px;"/>
	</div>     
	</div>
	<div style="padding-top: 20px; font-size: 40px;">
	<b>BEST</b>of<b>BEST</b> <hr/> 
	<div>
	<img src="http://www.hellonature.net/shop/data/skin/renew_C/img/banner/%EC%9D%B8%EA%B8%B0%EC%83%81%ED%92%88_%EA%B5%AC%EC%9D%B4%EC%9A%A9%EC%A0%84%EC%96%B4.jpg">
	</div>
	</div> 
</div>

<!-- 
<c:forEach items="${list }" var="i" varStatus="vs">
	<script>
		window.open("/popup.j?num=${i.POPUP_NUM}", "", "width=300, height=500, left=${vs.index * 50}, top=${vs.index * 50}");
	</script>
</c:forEach>
 -->