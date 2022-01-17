<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>周邊禮品．Flower Forever</title>
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
/*---------- Content-left Body Area ------------*/
/* 因為父元素沒高度，子盒子浮動，影響下面佈局，需清除浮動 overflow:hidden; */
.content {
	margin: 80px auto 0 auto;
	width: 1500px;
/*   	height: 2000px;   */
/*  	background-color: grey;  */
 	overflow:hidden;   
}

.content-left {
	float: left;
	width: 250px;
/* 	height: 900px; */
	margin-top: 20px;
	margin-left: 10px;
	background-color: #e3b7ae;      /*-------------------*/
}  /*#ffcccc; */

.content-right {
	float: right;
	width: 1220px;
/* 	height: 1850px; */
	margin-top: 10px;
	margin-right: 10px;
/* 	background-color: orange; */
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
	margin:0 auto;
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
	background-color: #f3efec;  /*-------------------*/
}

.nav2-content>a {
	display: block;
	height: 30px;
	width: 100%;
	color: #130f40;
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
	background-color: #12040C;
}
/*---------- Content-right Body Area ------------*/
.prods-imgs {
	width: 1200px;
	height: 423px;
	background-color: pink;
	margin: 10px auto;
}

.prods-content-title {
	color: #596275;
	font-weight: 600;
	font-size: 25px;
	margin-left:30px;
}
.prods-content-title p{
   margin-top:15px;
   margin-bottom:3px;
}

.seg2{
	height: 3px;
	width: 20%;
	background-color: #596275;
}

.prods-content {
	width: 1200px;
/*  	height: 1330px;  */
/* 	background-color: #575fcf; */
	margin: 0 auto;
}

/*  -------------- 圖片懸浮效果 (第二種上浮 效果更明顯 兩種都很好看:) ---------------------- */
	
/*  #prod-content-2{  */
/*  transition: box-shadow .25s;  */
/*  box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);  */
/*  }	  */
/*  #prod-content-2:hover{  */
/*  transition: box-shadow .25s;  */
/*  box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);  */
/*  }	  */

.prod-content-2{
cursor:pointer;
transition: .3s;
box-shadow: 0 0 5px rgba(0,0,0,0.2);
}	
.prod-content-2:hover{
transform:translateY(-10px);
box-shadow: 0 15px 25px rgba(0,0,0,0.15);
}	

footer{
margin:0 0 15px 0;
}			

</style>

<script type="text/javascript">
//登入登出
function signOut() {
//     var auth2 = gapi.auth2.getAuthInstance();
//     auth2.signOut().then(function () {
//         console.log('Google User signed out.');
//     });
        $("#memberLogin").hide();
        $("#adminLogin").hide();
        $("#cartLogin").show();
        $(".logoutState").hide();
        $("#loginState").show();
        window.location = "http://localhost:8080/IIIProject/yu/html/homePage.html";
}

// function onLoad() {
//     gapi.load('auth2', function () {
//         gapi.auth2.init();
//     });
// }

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

	$(function() {
		
//----------------------- 側邊欄 導航 動態效果 -----------------------------
		
		//1.隱藏所有子標題
// 		$(".nav2-menu").each(function() {
// 			$(this).children(".nav2-content").hide();
// 		});
		
// 		2.給所有主題綁定點擊事件
// 		$(".nav2-title").each(function() {

// 					$(this).click(
// 							function() {
// 								//展開/收起當前子菜單
// 							var navEle = $(this).parents(".nav2-menu")
// 										.children(".nav2-content");
// 								if (navEle.css("display") != "none") {
// 									navEle.slideUp(600);
// 								} else {
// 									//向下展開一個子菜單，保證其他子菜單都關閉
// 									var navMenu = navEle.parents(".nav2-menu");
// 									var otherNavs = navMenu.siblings();

// 									otherNavs.each(function() {
// 										$(this).children(".nav2-content")
// 												.slideUp(600);
// 									});
// 									navEle.slideDown(600);
// 								}
// 							});
// 				       });	
		
		
// ---------------------- 跳轉到index_flower首頁，即加載所有鮮花花束 ------------------------------  
		
		$("#prods-content").empty();
		$.ajax({url:"/Get/allproducts"	
		}).done(function(json){
			console.log(json);
			 let ln = json.length;
           	 let tableString = "";
           	 
        		for (i = 0; i < ln; i++) {           			
           			if(json[i].product_type == "gift"){
           				tableString += '<a href="http://localhost:8081/index2/'+ json[i].product_id +'">'
    	                +'<div class="prod-content-2" style="display: inline-block;width: 240px;height: 380px;background-color: #ecf0f1;margin:30px;">'
    	                +'<div class="prod-content-2-img"> <img style="width:240px;height:240px;"src="http://localhost:8081/productquantitydownload/'+ json[i].product_id +'"></div>'
    	                +'<div class="prod-content-2-title" style="color:black; font-size:20px; font-weight:600; line-height:50px;margin-left:10px;">'+ json[i].product_name +'</div>'
    	                +'<div class="prod-content-2-price" style="color:red;font-size:20px; font-weight:600;margin-left:10px;">'+'$NT '+json[i].product_price +'</div>'
    	                +'<div class="prod-content-2-quantity" style="display:inline-block; color:#2c3e50; font-size:15px;line-height:50px;margin-left:10px;">'+'商品數量：'+json[i].product_inventory +'</div>'
    	                +'<input type="hidden" name="id" value="'+ json[i].product_id +'"/></div></a>';		          
           			}   
           		}
           	
           		let title = '<div class="prods-content-title"><p>周邊禮品</p><div class="seg2"></div></div>';
               	let totalString = title + tableString;
                     	
            $("#prods-content").append(totalString);
            console.log(tableString);
		});
		
// ---------------------- 點擊 購物商城 加載所有商品 ------------------------------ 		
		
		$("#allprods").click(function(){
			console.log("ready ... ")
 			$("#prods-content").empty();
			$.ajax({url:"/Get/allproducts"	
			}).done(function(json){
				console.log(json);
				 let ln = json.length;
	           	 let tableString = "";
	           	 
	           	for (i = 0; i < ln; i++) {
	                tableString += '<a href="http://localhost:8081/index2/'+ json[i].product_id +'">'
	                +'<div class="prod-content-2" style="display: inline-block;width: 240px;height: 380px;background-color: #ecf0f1;margin:30px;">'
	                +'<div class="prod-content-2-img"> <img style="width:240px;height:240px;"src="http://localhost:8081/productquantitydownload/'+ json[i].product_id +'"></div>'
	                +'<div class="prod-content-2-title" style="color:black; font-size:20px; font-weight:600; line-height:50px;margin-left:10px;">'+ json[i].product_name +'</div>'
	                +'<div class="prod-content-2-price" style="color:red;font-size:20px; font-weight:600;margin-left:10px;">'+'$NT '+json[i].product_price +'</div>'
	                +'<div class="prod-content-2-quantity" style="display:inline-block; color:#2c3e50; font-size:15px;line-height:50px;margin-left:10px;">'+'商品數量：'+json[i].product_inventory +'</div>'
	                +'<input type="hidden" name="id" value="'+ json[i].product_id +'"/></div></a>';
	           }
	                     	
	        	let title = '<div class="prods-content-title"><p>所有商品</p><div class="seg2"></div></div>';
	           	let totalString = title + tableString;
	                     	
	            $("#prods-content").append(totalString);
	            console.log(tableString);
			})
		});
				
//		 	------------------ 點擊商品框 傳參 (jQuery类名选择器对非原始类名无法进行操作) -----------------
//			最後沒有使用ajax，直接使用<a>標籤的href跳轉傳參：）
//			$(".prods-content").delegate(".prod-content-2","click",function(){
			
				//var id = $("input[name='id']").val();
				//var id = $("input[name='id']").attr("value");
													
	});  //$(function() {}
	
</script>


</head>
<body style="background-color: #ecf0f1;">

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
						<a href="http://localhost:8081/index" id="allprods2">所有商品</a> 
						<a href="http://localhost:8081/flower" id="allflowers">鮮花花束</a> 
						<a href="http://localhost:8081/gift" id="allgifts">周邊禮品</a>
					</div>
						<div class="seg"></div>
				</div>  <!--  <div class="nav2-menu"> -->
			</div>    <!--  <div class="nav2"> -->
		</div>     <!--  <div class="content-left"> -->

		<div class="content-right" id="content-right" >
			<div class="prods-imgs">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-bs-ride="carousel"> 
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="../../images/product_index/index1.jpg" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="../../images/product_index/index2.jpg" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="../../images/product_index/index3.jpg" class="d-block w-100"
								alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>


			<div class="prods-content" id="prods-content">  
			
<!-- 	-------------------   以下內容為自動帶入數據庫資料 復刻商品框   ---------------------- -->
			
<!-- 				<div class="prod-content-1" id="prod-content-1" style="display: inline-block;margin: 10px; -->
<!-- 					width: 240px;height: 380px;background-color: #dff9fb;"> -->
				
<!-- 					<div class="prod-content-1-img" > -->
<!-- 						<img id="prod-content-1-img" src="/test/test1.jpg" style="width:240px;height:240px;"> -->
<!-- 					</div> -->
					
<!-- 					<div class="prod-content-1-title" style="color:black; font-size:20px; font-weight:600; line-height:50px;"> -->
<!-- 					標題 -->
<!-- 					</div> -->
<!-- 					<div class="prod-content-1-price" style="color:red;font-size:20px; font-weight:600;"> -->
<!-- 					$NT 價格 -->
<!-- 					</div> -->
<!-- 					<div class="prod-content-1-quantity" style="color:#2c3e50; font-size:15px;line-height:50px;"> -->
<!-- 					商品數量: -->
<!-- 					</div> -->				
<!-- 				</div>     prod-content-1 -->
		 
			</div>  <!-- prods-content -->

		</div>  <!-- content-right -->

	</div>   <!-- content -->
	
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