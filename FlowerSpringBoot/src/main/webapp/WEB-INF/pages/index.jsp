<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳情頁面．Flower Forever</title>
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<!-- jQuery UI 樣式表 and jQuery and jQuery UI -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 以下是詳情頁面參數 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
	

	<script src="http://localhost:8080/IIIProject/js/checkLoginCookie.js"></script>
    
    <link rel="icon" href="http://localhost:8080/Finalproject/img/Logo/Icon_Logo.png" />
    	
<style>
/*---------- 整版通用 ------------*/
* {
	margin: 0;
	padding: 0;
	/* css3盒子模型 */
	box-sizing: border-box;
}

.w {
	width: 1500px;
	margin: 0 auto;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}
/*---------- Header Area 此處有改原稿的43------------*/
.navbar-brand img {
	width: 42px;
}
/*---------- Content Body Area ------------*/
.content {
	margin: 80px auto 50px auto;
	padding-top: 10px;
	width: 1500px;
	height: 800px;
	/* 	background-color: grey; */
}

.content-left {
	float: left;
	width: 250px;
	height: 180px;
	margin-top: 10px;
	margin-left: 10px;
	background-color: #e3b7ae;
}

.content-right {
	float: right;
	width: 1220px;
	height: 600px;
	margin-top: 50px;
	margin-right: 10px;
	background-color: #ecf0f1;
}

.left-title {
	height: 50px;
	width: 100%;
	font-size: 18px;
	cursor: pointer;
}

.left-title>a {
	display: block;
	width: 100%;
	height: 50px;
	/*垂直居中*/
	line-height: 50px;
	/*水平居中*/
	text-align: center;
	color: #2f3542;
	font-weight: 600;
}

.seg {
	height: 1px;
	width: 100%;
	background-color: #2f3542;
}

.nav2 {
	margin-top: 5px 0;
}

.nav2-title {
	height: 40px;
	width: 100%;
	color: #2f3542;
	font-size: 18px;
	font-weight: 600;
	text-align: center;
	line-height: 40px;
	cursor: pointer;
}

.nav2-content {
	width: 100%;
	height: 100%;
	background-color: #f3efec;
}

.nav2-content>a {
	display: block;
	height: 30px;
	width: 100%;
	color: black;
	text-align: center;
	line-height: 30px;
	font-size: 16px;
}

.nav2-content>a:hover {
	display: block;
	height: 30px;
	width: 100%;
	color: #FFFFFF;
	text-align: center;
	line-height: 30px;
	background-color: black;
}

/* 以下是詳情頁面參數 */
.pd-wrap {
	padding: 40px 0;
	font-family: 'Poppins', sans-serif;
}

.heading-section {
	text-align: center;
	margin-bottom: 20px;
}

.sub-heading {
	font-family: 'Poppins', sans-serif;
	font-size: 12px;
	display: block;
	font-weight: 600;
	color: #2e9ca1;
	text-transform: uppercase;
	letter-spacing: 2px;
}

.heading-section h2 {
	font-size: 32px;
	font-weight: 500;
	padding-top: 10px;
	padding-bottom: 15px;
	font-family: 'Poppins', sans-serif;
}

.user-img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	position: relative;
	min-width: 80px;
	background-size: 100%;
}

.carousel-testimonial .item {
	padding: 30px 10px;
}

.quote {
	position: absolute;
	top: -23px;
	color: #2e9da1;
	font-size: 27px;
}

.name {
	margin-bottom: 0;
	line-height: 14px;
	font-size: 17px;
	font-weight: 500;
}

.position {
	color: #adadad;
	font-size: 14px;
}

.owl-nav button {
	position: absolute;
	top: 50%;
	transform: translate(0, -50%);
	outline: none;
	height: 25px;
}

.owl-nav button svg {
	width: 25px;
	height: 25px;
}

.owl-nav button.owl-prev {
	left: 25px;
}

.owl-nav button.owl-next {
	right: 25px;
}

.owl-nav button span {
	font-size: 45px;
}

.product-name {
	font-size: 22px;
	font-weight: 500;
	line-height: 22px;
	margin-bottom: 25px;
}

.product-price-discount {
	font-size: 22px;
	font-weight: 400;
	padding: 10px 0;
	clear: both;
	color: #ff3d12;
}

.product-price-discount span.line-through {
	text-decoration: line-through;
	margin-left: 10px;
	font-size: 14px;
	vertical-align: middle;
}

.display-flex {
	display: flex;
	align-items: center;
}

.align-center {
	align-items: center;
}

.product-info {
	width: 100%;
}

.reviews-counter {
	font-size: 13px;
}

.reviews-counter span {
	vertical-align: -2px;
}

.product-dtl p {
	font-size: 14px;
	line-height: 24px;
	color: #7a7a7a;
	margin: 10px 0 10px
}

.product-dtl .form-control {
	font-size: 15px;
}

.product-dtl {
	line-height: 16px;
	font-size: 16px;
}

.form-control:focus {
	outline: none;
	box-shadow: none;
}

.product-count {
	margin-top: 70px;
}

.product-count .qtyminus, .product-count .qtyplus {
	width: 34px;
	height: 34px;
	background: #fff;
	text-align: center;
	font-size: 19px;
	line-height: 36px;
	color: #212529;
	cursor: pointer;
	border: solid 1px #bdc3c7;
}

.product-count .qtyminus {
	border-radius: 3px 0 0 3px;
}

.product-count .qtyplus {
	border-radius: 0 3px 3px 0;
}

.product-count .qty {
	width: 60px;
	height: 34px;
	text-align: center;
	font-size: 16px;
	border: solid 1px #bdc3c7;
}

.round-black-btn {
	border-radius: 5px;
	background: #fbebed;
	font-size: 20px;
	color: #d0011b;
	padding: 10px 60px;
	display: inline-block;
	margin-top: 20px;
	border: solid 1px #e3b7ae;
	transition: all 0.5s ease-in-out 0s;
}

.round-black-btn:hover, .round-black-btn:focus {
	background: transparent;
	color: #212529;
	background: #e3b7ae;
	text-decoration: none;
}

.product-info-tabs {
	margin-top: 25px;
}

.product-info-tabs .nav-tabs {
	border-bottom: 2px solid #d8d8d8;
}

.product-info-tabs .nav-tabs .nav-item {
	margin-bottom: 0;
}

.product-info-tabs .nav-tabs .nav-link {
	border: none;
	border-bottom: 2px solid transparent;
	color: #323232;
}

.product-info-tabs .nav-tabs .nav-item .nav-link:hover {
	border: none;
}

.product-info-tabs .nav-tabs .nav-item.show .nav-link,
	.product-info-tabs .nav-tabs .nav-link.active, .product-info-tabs .nav-tabs .nav-link.active:hover
	{
	border: none;
	border-bottom: 2px solid #d8d8d8;
	font-weight: bold;
}

.product-info-tabs .tab-content .tab-pane {
	padding: 30px 20px;
	font-size: 15px;
	line-height: 24px;
	color: #7a7a7a;
}

.review-form .form-group {
	clear: both;
}

.mb-20 {
	margin-bottom: 20px;
}

.review-form .rate {
	float: none;
	display: inline-block;
}

.review-heading {
	font-size: 24px;
	font-weight: 600;
	line-height: 24px;
	margin-bottom: 6px;
	text-transform: uppercase;
	color: #000;
}

.review-form .form-control {
	font-size: 14px;
}

.review-form input.form-control {
	height: 40px;
}

.review-form textarea.form-control {
	resize: none;
}

.review-form .round-black-btn {
	text-transform: uppercase;
	cursor: pointer;
}

.qtytext1 {
	color: red;
	margin-bottom: 20px;
}

.qtytext2 {
	margin-right: 10px;
	font-size: 18px;
}

.product-img {
	width: 50%;
}

.reviews-counter>span {
	margin-right: 20px
}

.container {
	margin-top: 30px
}

div.imgdiv {
	margin-left: 70px;
}

.imgbox {
	width: 460px;
	height: 500px;
	border-radius: 15px;
}

.infobox {
	padding-top: 80px;
}

.info1 {
	padding-top: 30px;
}

.info2 {
	padding-top: 20px;
}

.warnning {
	width: 1300px;
	margin-top: 50px;
	margin-left: 80px;
}

dt {
	color: #2980b9;
}
</style>

<script type="text/javascript">

// var value = getUrlParam("pid");
// console.log("product_id = "+value);

// function getUrlParam(key){
// 	var url = window.location.toString();
// 	var arr = url.split("?");
//  	if(arr.length > 1){  //代表有傳入參數
// 		var params = arr[1].split("&");
//  		for(var i = 0;i < params.length;i++){
//  			var param = params[i]; //"pid=1"
//  			if(param.split("=")[0] == key){
//  				return param.split("=")[1];
//  			}
//  		}
// 	}
// 	return null;
// }



// 	var params={
//         "account": getCookie("account"),
//         "product_id":${pid},
//         "amount":amount
// 		};
//     console.log(params)
    
    
    
    
// 		function insert() {
		    
// 		    console.log("1")
//    			 console.log(params)
// 		$.ajax({
// 		    type:"post",
// 		    url:"/index/insertCarts",
// 		    contentType:"application/json; charset=utf-8",
// 		    data:params,
// 		    dataType:"json",
// 		    success:function(data){
		        
// 		    }
// 		});
		
// 		}
    $(function () {

		
        //1.隱藏所有子標題
//         $(".nav2-menu").each(function () {
            
//             $(this).children(".nav2-content").hide();
//         });
        //2.給所有主題綁定點擊事件
//         $(".nav2-title").each(
//                 function () {

//                     $(this).click(
//                             function () {
//                                 //展開/收起當前子菜單
//                                 var navEle = $(this).parents(".nav2-menu")
//                                         .children(".nav2-content");
//                                 if (navEle.css("display") != "none") {
//                                     navEle.slideUp(600);
//                                 } else {
//                                     //向下展開一個子菜單，保證其他子菜單都關閉
//                                     var navMenu = navEle.parents(".nav2-menu");
//                                     var otherNavs = navMenu.siblings();

//                                     otherNavs.each(function () {
//                                         $(this).children(".nav2-content")
//                                                 .slideUp(600);
//                                     });
//                                     navEle.slideDown(600);
//                                 }
//                             });
//                 });
    });
    
    
    
  //登入登出
    function signOut() {
//         var auth2 = gapi.auth2.getAuthInstance();
//         auth2.signOut().then(function () {
//             console.log('Google User signed out.');
//         });
            $("#memberLogin").hide();
            $("#adminLogin").hide();
            $("#cartLogin").show();
            $(".logoutState").hide();
            $("#loginState").show();
            window.location = "http://localhost:8080/IIIProject/yu/html/homePage.html";
    }

//     function onLoad() {
//         gapi.load('auth2', function () {
//             gapi.auth2.init();
//         });
//     }

    function goToLogin() {
        window.location = "http://localhost:8080/IIIProject/login.html";
    }
    
    $(function () {
        let loginAccount = getCookie("account");
        let loginStatus = getCookie("status");
        if (loginAccount == '') {//未登入
            $("#memberLogin").hide();
            $("#adminLogin").hide();
            $("#cartLogin").show();
            $(".logoutState").hide();
            $("#loginState").show();
            
        } else if(loginStatus == 'admin'){
            $("#welecomeName").text("管理員，您好");
            $("#memberLogin").hide();
            $("#adminLogin").show();
            $("#cartLogin").hide();
            $(".logoutState").show();
            $("#loginState").hide();
            
        } else {
            $("#welecomeName").text(getCookie("username")+"，您好");
            $("#memberLogin").show();
            $("#adminLogin").hide();
            $("#cartLogin").show();
            $(".logoutState").show();
            $("#loginState").hide();
        }

    })
</script>

<script>

// 詳情頁面 item 決定圖片是否變跑馬燈
    $(document).ready(

    		
            function () {
                var slider = $("#slider");
                var thumb = $("#thumb");
                var slidesPerPage = 4; //globaly define number of elements per page
                var syncedSecondary = true;
                slider.owlCarousel({
                    items : 1,
                    slideSpeed : 2000,
                    nav : false,
                    autoplay : false,
                    dots : false,
                    loop : true,
                    responsiveRefreshRate : 200
                }).on('changed.owl.carousel', syncPosition);

                function syncPosition(el) {
                    var count = el.item.count - 1;
                    var current = Math.round(el.item.index
                            - (el.item.count / 2) - .5);
                    if (current < 0) {
                        current = count;
                    }
                    if (current > count) {
                        current = 0;
                    }
                    thumb.find(".owl-item").removeClass("current").eq(current)
                            .addClass("current");
                    var onscreen = thumb.find('.owl-item.active').length - 1;
                    var start = thumb.find('.owl-item.active').first().index();
                    var end = thumb.find('.owl-item.active').last().index();
                    if (current > end) {
                        thumb.data('owl.carousel').to(current, 100, true);
                    }
                    if (current < start) {
                        thumb.data('owl.carousel').to(current - onscreen, 100,
                                true);
                    }
                }

                function syncPosition2(el) {
                    if (syncedSecondary) {
                        var number = el.item.index;
                        slider.data('owl.carousel').to(number, 100, true);
                    }
                }
                thumb.on("click", ".owl-item", function (e) {
                    e.preventDefault();
                    var number = $(this).index();
                    slider.data('owl.carousel').to(number, 300, true);
                });

                
                

		         
                $(".qtyminus").on("click", function () {
                var now = $(".qty").val();
                    if ($.isNumeric(now)) {
                        if (parseInt(now) - 1 > 0) {
                            $(".qty").attr("value",parseInt(now) - 1);
                            now--;
                            console.log(now);
// 	                        $(".qty").val(now);
//                 params["amount"]=now;
                params["amount"]=""+now+"";  
                $(".qty").val(now);
                console.log(params);
                        }
                    }
                })
                $(".qtyplus").on("click", function () {
                    var now = $(".qty").val();
                    console.log(now);
               	 	if((parseInt(now)+ 1)>${pdetail.product_inventory}){
						alert("購買數量大於庫存數量");
            	 	}else {
                        if ($.isNumeric(now)) {
                            $(".qty").attr("value",parseInt(now) + 1);
                           	now++;
//                            	$(".qty").val(now);
                        }
            	 	}
                    console.log(now);
                
                
                params["amount"]=""+now+"";
                $(".qty").val(now);
                console.log(params);
      
                
                });
                
                var amount=$(".qty").val();
              	   console.log(amount);

 
              	   
              	   
              	   
              	var value = getUrlParam("pid");
              	console.log("product_id = "+value);

              	function getUrlParam(key){
             	 	var url = window.location.toString();
             	 	var arr = url.split("?");
             	  	if(arr.length > 1){  //代表有傳入參數
             	 		var params = arr[1].split("&");
             	  		for(var i = 0;i < params.length;i++){
             	  			var param = params[i]; //"pid=1"
             	  			if(param.split("=")[0] == key){
             	  				return param.split("=")[1];
             	  			}
             	  		}
             	 	}
             	 	return null;
              	}



             	 	var params={
             	         "account": getCookie("account"),
             	         "product_id":${pid},
             	         "amount":amount
             	 		};
             	     console.log(params)
             	     
                     $(".qty").change( function () {
                    	 console.log($(".qty").val());
                    	 if($(".qty").val()>${pdetail.product_inventory}){
     						alert("購買數量大於庫存數量");
                    		 params["amount"]=${pdetail.product_inventory};
                    		 $(".qty").val(${pdetail.product_inventory});
                    	 }else {
                    	 	params["amount"]=$(".qty").val();
//                     	 	$(".qty").val().change();
//  							$(".qty").attr("value",20);
                    	 	console.log(params)
                    	 }
                     });
              	                	     
             	     
                     $(".insertBtn").click( function () {
                         console.log(params);    
                         alert("已加入購物車，感謝您的購買");
                 		$.ajax({
                 		    type:"post",
                 		    url:"/index/insertCarts",
                 		    contentType:"application/json; charset=utf-8",
                 		    data:JSON.stringify(params),
                 		    dataType:"json",
                 		    success:function(data){
                 		    	
                 		        console.log(data);
                 		    }
                 		});
                     
                     });
             	     
             	     

              	   


            });
</script>
</head>
<body style="background: #ecf0f1;">

	<!-- Header Area -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top ps-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="http://localhost:8080/IIIProject/yu/html/homePage.html"><img style="width:70px" src="http://localhost:8080/Finalproject/img/Logo/Logo.png"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active text-dark" href="http://localhost:8080/IIIProject/yu/html/homePage.html">首頁</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active text-dark" href="http://localhost:8080/IIIProject/news.html">最新消息</a>
                        </li>
                        <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        	商品
	                        </a>
	                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			                    <li>
			                        <a class="dropdown-item" href="http://localhost:8081/index">所有商品</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="http://localhost:8081/flower">花束系列</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="http://localhost:8081/gift">禮品系列</a>
			                    </li>
	                        </ul>
	                      </li>
                        <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        	聯絡我們
	                        </a>
	                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			                    <li>
			                        <a class="dropdown-item" href="http://localhost:8080/IIIProject/yu/html/connect.html">客服</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="http://localhost:8080/IIIProject/yu/html/connectInfo.html">聯絡資訊</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="http://localhost:8080/IIIProject/yu/html/connectReturned.html">退換貨政策</a>
			                    </li>
			                    <li>
			                        <a class="dropdown-item" href="http://localhost:8080/IIIProject/yu/html/connectPrivacy.html">隱私權政策</a>
			                    </li>
	                        </ul>
	                      </li>
                    </ul>
                    <div class="d-flex ">                        
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <div id="cartLogin" class="nav-link active ">
                                    <a class="nav-link text-dark" href="http://localhost:8080/Finalproject/CartStep1.jsp">購物車</a>
                                </div>
                            </li>
                            <li class="nav-item" id="loginState">
                                <div class="nav-link active ">
                                    <button onclick="goToLogin();" class="btn btn-secondary">登入</button>
                                </div>
                            </li>
                            
                            
                            <li class="nav-item logoutState">
                            
                                <div class="nav-link active ">
                                    <span id="welecomeName" class="nav-link fw-bold text-decoration-underline" href="http://localhost:8080/IIIProject/MemberCenter/MemberCenterHome.html" style="cursor:context-menu"></span>
                                </div>
                             </li>       
							<li id="memberLogin" class="nav-item dropdown">
                                <div class="nav-link active ">
                                    <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">會員中心</a>
	                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					                    <li>
					                        <a class="dropdown-item" href="http://localhost:8080/IIIProject/MemberCenter/MemberData.html">基本資料</a>
					                    </li>
					                    <li>
					                        <a class="dropdown-item" href="http://localhost:8080/IIIProject/MemberCenter/OrdersMember.html">訂單管理</a>
					                    </li>
			                        </ul>
                                </div>
                            </li>
                            <li id="adminLogin" class="nav-item dropdown">
                                <div class="nav-link active ">
                                    <a class="nav-link text-dark" href="http://localhost:8080/IIIProject/AdminPage/AdminHome.html">管理員介面</a>
                                </div>
                            </li>
                            <li class="nav-item logoutState">        
                                <div class="nav-link active ">
                                    <button onclick="signOutCookie();signOut();" class="btn btn-secondary">登出</button>
                                </div>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header>

	<!-- Body Area -->
	<div class="content">

		<!-- Left_nav -->
		<!-- 		<div class="content-left"> -->
		<!-- 			<div class="left-title"> -->
		<!-- 				<a heref="#">首頁</a> -->
		<!-- 			</div> -->
		<!-- 			<!-- 分割線 		-->
		<!-- 			<div class="seg"></div> -->
		<!-- 			<!-- 菜單欄導航 		-->
		<!-- 			<div class="nav2"> -->

		<!-- 				單個菜單項 -->
		<!-- 				<div class="nav2-menu"> -->
		<!-- 					主標題 -->
		<!-- 					<div class="nav2-title">購物商城</div> -->
		<!-- 					子標題 -->
		<!-- 					<div class="nav2-content" style="display: none;"> -->
		<!-- 						<a href="#">所有商品</a> <a href="#">鮮花花束</a> <a href="#">周邊禮品</a> -->
		<!-- 					</div> -->
		<!-- 				</div> -->

		<!-- 				單個菜單項 -->
		<!-- 				<div class="nav2-menu"> -->
		<!-- 					主標題 -->
		<!-- 					<div class="nav2-title">購物商城</div> -->
		<!-- 					子標題 -->
		<!-- 					<div class="nav2-content"> -->
		<!-- 						<a href="#">所有商品</a> <a href="#">鮮花花束</a> <a href="#">周邊禮品</a> -->
		<!-- 					</div> -->
		<!-- 				</div> -->

		<!-- 			</div> -->
		<!-- 		</div> -->

		<div class="content-left">
			<div class="left-title">
				<a href="#">Flower Forever</a>
			</div>
			<!-- 分割線 -->
			<div class="seg"></div>
			<!-- 菜單欄導航 -->
			<div class="nav2">
				<!-- 單個菜單項 -->
				<div class="nav2-menu">
					<!-- 主標題 -->
					<div class="nav2-title" id="allprods">購物商城</div>
					<!-- 子標題 -->
					<div class="nav2-content">
						<a href="http://localhost:8081/index" id="allprods2">所有商品</a> <a
							href="http://localhost:8081/flower" id="allflowers">鮮花花束</a> <a
							href="http://localhost:8081/gift" id="allgifts">周邊禮品</a>
					</div>
					<div class="seg"></div>
				</div>
				<!--  <div class="nav2-menu"> -->
			</div>
			<!--  <div class="nav2"> -->
		</div>
		<!--  <div class="content-left"> -->

		<!-- -----------------------------------------------------內容區---------------------------------------------------------------------------- -->
		<div class="content-right">
			<div class="container">
				<div class="row">${paramValues.username[0] }
					<div class="col-md-6">
						<div id="" class="">
							<div class="imgdiv">
								<img src="/productquantitydownload/${pid}" class="imgbox" alt="">
							</div>

						</div>

					</div>

					<!--商品頁面從此開始-->
					<div class="col-md-6 infobox">
						<div class="product-dtl">
							<div class="product-info">
								<div class="product-name">${pdetail.product_name}</div>
								<div class="reviews-counter">
									<span>商品編號: ${pdetail.product_id}</span><span>分類:${pdetail.product_subtype}</span><span>優惠價</span><span
										class="product-price-discount">NT
										${pdetail.product_price}元</span>
								</div>
								<p class="info1">${pdetail.product_info1}</p>
								<p class="info2">${pdetail.product_info2}</p>
								<div class="product-count">
									<label for="size" class="qtytext1">剩餘數量：${pdetail.product_inventory}</label>

									<div class="display-flex">
										<label for="size" class="qtytext2">數量</label>
										<div class="qtyminus">-</div>
										<input type="text" name="product_quantity" value="1"
											class="qty">
										<div class="qtyplus">+</div>
									</div>
									<div class="display-flex">
										<%-- 											<input type="submit" class="round-black-btn btn-addcart" value="加入購物車"/> --%>
										<button class="round-black-btn btn-addcart insertBtn" value="">加入購物車</button>
										<!-- 											<button  class="round-black-btn btn-addcart" onclick="insert()" value="">加入購物車</button> -->
									</div>

								</div>
							</div>
						</div>
						
					</div>


				</div>
			</div>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
				integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
				crossorigin="anonymous"></script>
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
				integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
				crossorigin="anonymous"></script>
				
<!-- 						-----------------運送說明-------------------                    -->
				
				
				<div class="warnning">
							<dl>
								<dt></dt>
								<dd></dd>
								<dt>送貨方式：</dt>
								<dd>
									透過宅配送達。除網頁另有特別標示外，均為常溫配送。<br>消費者訂購之商品若經配送兩次無法送達，再經本公司以電話與Email均無法聯繫逾三天者，本公司將取消該筆訂單，並且全額退款。
								</dd>
								<dt>送貨範圍：</dt>
								<dd>
									限台灣本島與離島地區<span class="s_parenthesis">註</span>，部分離島地區<span
										class="s_parenthesis">包括連江<span class="s_parenthesis">馬祖</span>、綠島、蘭嶼、琉球鄉…等
									</span>貨件。注意！收件地址請勿為郵政信箱。<br> <span class="s_parenthesis">註：離島地區將送至到岸船公司碼頭，需請收貨人自行至碼頭取貨。</span>
								</dd>
							</dl>
						</div>
		</div>


	</div>


	<!-- 	-------------------------------content box 到此結束---------------------------------------------- -->
	<hr />
    <footer>
        <div class="container offset-2 col-md-9" style="height: 150px">
            <div class="row align-items-start">
                <div class="col-lg-3">
                    <div class="fw-bolder">客戶服務</div>
                    <a class="text-start text-decoration-none link-secondary" href="http://localhost:8080/IIIProject/yu/html/connectReturned.html">退換貨政策</a>
                    <br>
                    <a class="text-start text-decoration-none link-secondary" href="http://localhost:8080/IIIProject/yu/html/connectPrivacy.html">隱私權政策</a>
                </div>
                <div class="col-lg-5">
                    <div class="fw-bolder">聯絡我們</div>
                    <table>
                    	<tr>
                    		<td>服務時間</td>
                    		<td>：</td>
                    		<td>周二至周日 09:00-17:00</td>
                    	</tr>
                    	<tr>
                    		<td>電話</td>
                    		<td>：</td>
                    		<td>(07)9699885</td>
                    	</tr>
                    	<tr>
                    		<td>地址</td>
                    		<td>：</td>
                    		<td>高雄市前金區中正四路211號8號樓之10</td>
                    	</tr>
                    	<tr>
                    		<td>客服信箱</td>
                    		<td>：</td>
                    		<td>iiiflowerforever@gmail.com</td>
                    	</tr>
                    </table>
                </div>
                <div class="col-lg-3">
                	<div class="fw-bolder">社群媒體</div>
                    <a href="https://instagram.com/iiiflowerforever?utm_medium=copy_link" class="text-decoration-none link-secondary" target="_blank">
                    	<img class="mt-1 mb-1" src="http://localhost:8080/Finalproject/img/FB_IG_Logo/instagram.png" style="width:5vh" />
                    	<span class="">iiiflowerforever</span>
                    </a>
                    <br>
                    <a href="https://www.facebook.com/Flower-Forever-%E8%8A%B1%E9%96%8B%E4%B8%8D%E6%95%97-108098771615167/" class="text-decoration-none link-secondary" target="_blank">
                    	<img class="mt-1 mb-1" src="http://localhost:8080/Finalproject/img/FB_IG_Logo/facebook.png" style="width:5vh" />
                    	<span class="">Flower Forever 花開不敗</span>
                    </a>
                </div>
            </div>
        </div>
    </footer>


</body>


</html>