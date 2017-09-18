<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link href="http://fonts.googleapis.com/css?family=Bitter&subset=latin" rel="stylesheet" type="text/css">

<style> 
li{
   list-style: none;
}
.dropdown-menu > li.kopie > a {
    padding-left:5px;
}  
  
 li.drop{
    position: absolute; 
    left: -300px;
 }
 
.dropdown-submenu { 
    position:relative; 
}
<<<<<<< HEAD
=======

>>>>>>> refs/heads/master
.dropdown-submenu>.dropdown-menu {
   top:0;left:100%;
   margin-top:-6px;margin-left:-1px;
   -webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px;
 }
  
 #ssipal .byungsin{
    position: absolute;
    left: -288%;
    width: 800px; 
 }
 
.dropdown-submenu > a:after {
  border-color: transparent transparent transparent #333;
  border-style: solid;
  border-width: 5px 0 5px 5px;
  content: " ";
  display: block;
  float: right;  
  height: 0;     
  margin-right: -10px;
  margin-top: 5px;
  width: 0;
}
 
.dropdown-submenu:hover>a:after {
    border-left-color:#555;
 }

.dropdown-menu > li > a:hover, .dropdown-menu > .active > a:hover {
  text-decoration: underline;
   background: rgba( 40, 40, 40, 0.4 );  
}   
  
@media (max-width: 767px) {

  .navbar-nav  {
     display: inline;
  }
  .navbar-default .navbar-brand {
    display: inline;
  }
  .navbar-default .navbar-toggle .icon-bar {
    background-color: #fff;
  }
  .navbar-default .navbar-nav .dropdown-menu > li > a {
    color: red;
    background-color: #ccc;
    border-radius: 4px;
    margin-top: 2px;   
  }
   .navbar-default .navbar-nav .open .dropdown-menu > li > a {
     color: #333;
   }
   .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,
   .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
     background-color: #ccc;
   }

   .navbar-nav .open .dropdown-menu { 
     border-bottom: 0px solid white;  
     border-radius: 0;
   }
  .dropdown-menu {
      padding-left: 10px;
  }
  .dropdown-menu .dropdown-menu {
      padding-left: 20px;
   }
   .dropdown-menu .dropdown-menu .dropdown-menu {
      padding-left: 30px;
   }
   li.dropdown.open {
    border: 0px solid red;
   }

}
 
#sohot > li > a {
   color: white;
   padding-left: 20px;
}

#sohot{
   height:462px; 
   width: 80px;
   background-color: rgba( 120, 120, 120, 0.4 );
   color :  blue;   
   box-shadow: 0px 0px 0px #888888;
   padding-top: 0px;
   margin: 0px;   
}
#socool{
   width: 160px;
   background-color: #262626;
   color : #ffffff;
}
 
@media (min-width: 768px) {
  ul.nav li:hover > ul.dropdown-menu { 
    display: block;
  }
  ul.ssibal li > ul.dropdown-menu{ 
    display: block;
  }
  #navbar {
    text-align: center;
  }
}  
  
</style>    
<div align="center" > 
<div id="navbar" style="width: 67%; height: 7%">    
  <div class="navbar navbar-static-top" role="navigation" style="height:100%; margin-bottom: 0px;"> 
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                    <span class="icon-bar"></span>
                </button>  
<<<<<<< HEAD
                <ul class="nav ssibal navbar-nav">  
                <li class="dropdown">
              <a class="navbar-brand" class="ropdown-toggle"  href="/product/list.j" id="socool" style="font-size: 16px;"><span class="glyphicon glyphicon-menu-hamburger"></span>카테고리<b class="caret"></b></a>   
              <ul class="nav dropdown-menu sohott" id="sohot" style="border-top: 0px;">
                                 <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">채소</a>
=======
                
                <ul class="nav ssibal navbar-nav">  
                	<li class="dropdown">
		              <a class="navbar-brand" class="ropdown-toggle"  href="/product/list.j" id="socool" style="font-size: 16px;"><span class="glyphicon glyphicon-menu-hamburger"></span>카테고리<b class="caret"></b></a>   
		              <ul class="nav dropdown-menu sohott" id="sohot" style="border-top: 0px;">
		                   <li class="dropdown dropdown-submenu wonder"><a href="#" class="dropdown-toggle" data-toggle="dropdown">채소</a>
		                        <ul class="dropdown-menu girls">
		                                    <li class="kopie"><a href="#">야채야채</a></li>
		                           <li><a href="#">ㅗㅗㅗ</a></li>
		                           <li><a href="#">쌈,샐러드</a></li>
		                           <li><a href="#">뿌리채소</a></li>
		                           <li><a href="#">야채 뭐있지</a></li>
		                                                                      
		                        </ul>
		                      </li>   
		                          
		                     <li class="dropdown dropdown-submenu wonder"><a href="#" class="dropdown-toggle" data-toggle="dropdown">과일</a>
		                           <ul class="dropdown-menu girls">
		                                    <li class="kopie"><a href="#">야채야채</a></li>
		                           <li><a href="#">ㅗㅗㅗ</a></li>
		                           <li><a href="#">쌈,샐러드</a></li>
		                           <li><a href="#">뿌리채소</a></li>
		                           <li><a href="#">야채 뭐있지</a></li>
		                                                                      
		                        </ul>
		                      </li>
		                           
		                           
		                           <li><a href="#">양곡</a></li>
		                           <li><a href="#">정육</a></li>
		                           <li><a href="#">수산물</a></li>
		                                                                      
		                </ul>
              		</li>
              </ul>
            </div>
              
            <div class="collapse navbar-collapse" id="navbar-collapse-1"   >
                <ul class="nav navbar-nav">
                    <li ><a href="#" style="font-size: 16px; letter-spacing: -1px;">원산지별</a></li>
                    <li><a href="#">Link</a></li>
                     
                    <li class="dropdown" id="ssipal">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a> 
                      
                        <ul class="dropdown-menu byungsin"> 
                          <li class="kopie"><a href="#">Dropdown</a></li>
                            <li><a href="#">시바아아아알</a></li>
                            <li ><a href="#">Dropdown Link 2</a></li>
                            <li><a href="#">Dropdown Link 3</a></li>
                          
                            <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Link 4</a>
>>>>>>> refs/heads/master
                        <ul class="dropdown-menu">
                                    <li class="kopie"><a href="#">Dropdown Link 4</a></li>
                           <li><a href="#">ㅗㅗㅗ</a></li>
                           <li><a href="#">Dropdown Submenu Link 4.2</a></li>
                           <li><a href="#">Dropdown Submenu Link 4.3</a></li>
                           <li><a href="#">Dropdown Submenu Link 4.4</a></li>
                                                                      
                        </ul>
<<<<<<< HEAD
                          
                           <li><a href="#">과일</a></li>
                           
                           <li><a href="#">양곡</a></li>
                           <li><a href="#">정육</a></li>
                           <li><a href="#">수산물</a></li>
                                                                      
                        </ul>
              </li>
              </ul>
            </div>
              
            <div class="collapse navbar-collapse" id="navbar-collapse-1"   >
                <ul class="nav navbar-nav">
                    <li ><a href="#" style="font-size: 16px; letter-spacing: -1px;">원산지별</a></li>
                    <li><a href="#">Link</a></li>
                     
                    <li class="dropdown" id="ssipal">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a> 
                      
                        <ul class="dropdown-menu byungsin"> 
                          <li class="kopie"><a href="#">Dropdown</a></li>
                            <li><a href="#">시바아아아알</a></li>
                            <li ><a href="#">Dropdown Link 2</a></li>
                            <li><a href="#">Dropdown Link 3</a></li>
                          
                            <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Link 4</a>
                        <ul class="dropdown-menu">
                                    <li class="kopie"><a href="#">Dropdown Link 4</a></li>
                           <li><a href="#">ㅗㅗㅗ</a></li>
                           <li><a href="#">Dropdown Submenu Link 4.2</a></li>
                           <li><a href="#">Dropdown Submenu Link 4.3</a></li>
                           <li><a href="#">Dropdown Submenu Link 4.4</a></li>
                                                                      
                        </ul>
=======
>>>>>>> refs/heads/master
                     </li>
                          
                            <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Link 5</a>
                        <ul class="dropdown-menu">
                                    <li class="kopie"><a href="#">Dropdown Link 5</a></li>
                           <li><a href="#">Dropdown Submenu Link 5.1</a></li>
                           <li><a href="#">Dropdown Submenu Link 5.2</a></li>
                           <li><a href="#">Dropdown Submenu Link 5.3</a></li>
                           
                           <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Submenu Link 5.4</a>
                              <ul class="dropdown-menu">
                                            <li class="kopie"><a href="#">Dropdown Submenu Link 5.4</a></li>
                                 <li><a href="#">Dropdown Submenu Link 5.4.1</a></li>
                                 <li><a href="#">Dropdown Submenu Link 5.4.2</a></li>
                                 
                                 
                              </ul>
                           </li>                           
                        </ul>
                     </li>                                   
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown2 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="kopie"><a href="#">Dropdown2</a></li>
                            <li><a href="#">Dropdown2 Link 1</a></li>
                            <li><a href="#">Dropdown2 Link 2</a></li>
                            <li><a href="#">Dropdown2 Link 3</a></li>
                            
                            <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown2 Link 4</a>
                        <ul class="dropdown-menu">
                                    <li class="kopie"><a href="#">Dropdown2 Link 4</a></li>
                           <li><a href="#">씨발라라라라</a></li>
                           <li><a href="#">Dropdown2 Submenu Link 4.2</a></li>
                           <li><a href="#">Dropdown2 Submenu Link 4.3</a></li>
                           <li><a href="#">Dropdown2 Submenu Link 4.4</a></li>
                                   
                        </ul>
                     </li>
                            <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown2 Link 5</a>
                        <ul class="dropdown-menu">
                                    <li class="kopie"><a href="#">Dropdown Link 5</a></li>
                           <li><a href="#">Dropdown2 Submenu Link 5.1</a></li>
                           <li><a href="#">Dropdown2 Submenu Link 5.2</a></li>
                           <li><a href="#">Dropdown2 Submenu Link 5.3</a></li>
                           <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Submenu Link 5.4</a>
                              <ul class="dropdown-menu">
                                            <li class="kopie"><a href="#">Dropdown2 Submenu Link 5.4</a></li>
                                 <li><a href="#">Dropdown2 Submenu Link 5.4.1</a></li>
                                 <li><a href="#">Dropdown2 Submenu Link 5.4.2</a></li>
                                 
                              </ul>
                           </li>                                  
                        </ul>
                     </li>                                  
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
</div>
</div>
<script>
$(window).scroll(function(event){
   var si = $("#ssibal").attr("class"); 
   console.log(si);
   var a=si.split(" ");
   if(a[2]== "affix" ){ 
<<<<<<< HEAD
      $("#sohot").fadeOut();
=======
      $("#sohot").hide();
>>>>>>> refs/heads/master
   }else{
      $("#sohot").show();
   }
});


<<<<<<< HEAD
=======

$('.wonder > .girls').parent().hover(function() {
	  var submenu = $(this).children('.girls');
	  if ( $(submenu).is(':hidden') ) {
	    $(submenu).slideDown(200);
	  } else {
	    $(submenu).slideUp(200);
	  }
	});

>>>>>>> refs/heads/master
</script>