<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>訂單成立．Flower Forever</title>
    
         <%-- cookie相關function和google API --%>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name="google-signin-client_id"
        content="1030132111174-it3lsbndt9981bcucrt2hi2e613hekj6.apps.googleusercontent.com">
	<script src="http://localhost:8080/IIIProject/js/checkLoginCookie.js"></script>
    
     <%-- 網站圖標 --%>
    <link rel="icon" href="http://localhost:8080/Finalproject/img/Logo/Icon_Logo.png" />
    
    <%--加入jQuery 樣式表--%>
    <link href="jQuery/jquery-ui-1.12.1.custom/jquery-ui-1.12.1.custom/jquery-ui.min.css" rel="stylesheet" />
    
    <%--加入jQuery--%>
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui-1.12.1.custom/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

    <%--bootstrap連結--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <%--加入shopping_cart樣式表--%>
    <link href="css/shopping_cart.css" rel="stylesheet" />
    
    
	<%-- 建立SQL連線 --%>
<%-- *****合併更改********************************************************************************************************** --%>
<%-- 已經初步修改 dataSource --%>
	<sql:setDataSource dataSource="jdbc/iii_finalproject" />


    <script>
    
	<%--和豐--%>
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
    
    
    
    
        $(function () {

    		<%--ajax使用參數:取得訂單的id字串 --%>
        	var orderId = "?Order_id="+"${param.Order_id}";
			<%--提交給URL，讓servlet做資料庫的訂單查詢，並回應JSON格式--%>
			
			<%-- 總計金額參數，不能放在ajax裡面 --%>
			var stAll=0;
			
			<%--交易完成，要刪除購物車內的資料，以陣列儲存product id--%>
			var pid_temp=[];
			
			$.ajax({
    			method : 'get',
    			url : "Cart_Order_Servlet" + orderId,
    			dataType: "json",
    			contentType: "application/json;charset=utf-8",
    			success : function(data) {
     				for(var i=0;i<data.length;i++){
     					<%--將product id 存進陣列中--%>
     					pid_temp.push(data[i].Product_id);
     					console.log(pid_temp);
						<%-- 總計金額 --%>
    	 				stAll += parseInt(data[i].product_price)*parseInt(data[i].Buy_amount);
    	 				<%-- 渲染商品及內容 --%>
     					$("#cartProduct_list").append('<div id='+data[i].Product_id+' class="productItem row align-items-center m-0">'
     													+'<div class="w-20 d-inline-block mh-100" style="overflow: hidden;">'
     														+'<img src="http://localhost:8081/productquantitydownload/'+data[i].Product_id+'" style="height: 100px; object-fit: cover" /></div>'
     													+'<div class="w-15 d-inline-block mh-100" style="word-break: break-all;">'
     														+'<div class="text-left ellipsis">'+data[i].product_name+'</div></div>'
     													+'<div class="w-35 d-inline-block text-center mh-100" style="word-break: break-all;">'
     														+'<div class="text-left ellipsis">'+data[i].product_info1+'</div></div>'
     													+'<div class="w-10 d-inline-block text-center mh-100 unitprice"style="word-break: break-all">'+data[i].product_price+'</div>'
     													+'<div class="w-10 d-inline-block text-center mh-100">'+data[i].Buy_amount+'</div>'
     													+'<div class="w-10 d-inline-block text-center mh-100 totalNums">'+data[i].product_price*data[i].Buy_amount+'</div></div>');    				   					
     				};    			
    	 			$("#totalMoney").html("NT$ "+stAll);


<%--  					顧客資料 --%>
					$(".customerTable").html('<div class="col-md">'+
									      		'<div class="form_row mt-5 row">'+
								                '<div class="col h4 m-0 fw-bold">'+
								                    '<div class=" ms-4">訂購者資料</div>'+
								                '</div>'+
								            '</div>'+            
											'<hr style="border: 1px solid black;"/>'+
								            '<div class="form_row mt-4 row">'+
								                '<div class="col-4 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">姓名</div>'+
								                '</div>'+
								                '<div class="col-8">'+
								                    '<div class=" ms-4">'+data[0].Name+'</div>'+                   
								                '</div>'+
								            '</div>'+
								            '<div class="form_row mt-4 row">'+
								                '<div class="col-4 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">電話</div>'+
								                '</div>'+
								                '<div class="col-8">'+
								                    '<div class=" ms-4">'+data[0].Phone+'</div>'+                    
								                '</div>'+
								            '</div>'+            
								            '<div class="form_row mt-4 row">'+
								                '<div class="col-4 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">E-mail</div>'+
								                '</div>'+
								                '<div class="col-8">'+
								                    '<div class=" ms-4">'+data[0].Email+'</div>'+                   
								                '</div>'+
								            '</div>'+ 
											'<hr>'+
										'</div>'+
										'<div class="col-md">'+
								      		'<div class="mt-5 row">'+
								                '<div class="col h4 m-0 fw-bold">'+
								                    '<div class=" ms-4">取貨者資料</div>'+
								                '</div>'+
								            '</div>'+            
											'<hr style="border: 1px solid black;"/>'+
								            '<div class="mt-4 row">'+
								                '<div class="col-4 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">姓名</div>'+
								                '</div>'+
								                '<div class="col-8">'+
								                    '<div class=" ms-4">'+data[0].Picker_name+'</div>'+                    
								                '</div>'+
								            '</div>'+            
								            '<div class="mt-4 row">'+
								                '<div class="col-4 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">電話</div>'+
								                '</div>'+
								                '<div class="col-8">'+
								                    '<div class=" ms-4">'+data[0].phone+'</div>'+                    
								                '</div>'+
								            '</div>'+            
								            '<div class="mt-4 row">'+
								                '<div class="col-4 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">E-mail</div>'+
								                '</div>'+
								                '<div class="col-8">'+
								                    '<div class=" ms-4">'+data[0].email+'</div>'+                    
								                '</div>'+
								            '</div>'+
											'<hr>'+
										'</div>'
										);


<%-- 					預計取貨日期 --%>
 					$(".pickDate").html('<div class="col-md-12">'+
							      			'<div class="mt-5 row">'+
							                	'<div class="col h4 m-0 fw-bold">'+
							                    	'<div class=" ms-4">訂單資料</div>'+
							                	'</div>'+
							            	'</div>'+
											'<hr/>'+
							            	'<div class="mt-4 row">'+
								            	'<div class="col-2 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">預計取貨日期</div>'+
								                '</div>'+
								                '<div class="col-10">'+
								                    '<div class=" ms-4">'+data[0].Pickup_date+'</div>'+                    
								                '</div>'+
								            '</div>'+            
								            '<div class="mt-4 row">'+
								                '<div class="col-2 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">預計取貨時間</div>'+
								                '</div>'+
								                '<div class="col-10">'+
								                    '<div class=" ms-4">'+data[0].Pickup_time+'</div>'+                   
								                '</div>'+
								            '</div>'+            
								            '<div class="mt-4 row">'+
								                '<div class="col-2 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">下單日期</div>'+
								                '</div>'+
								                '<div class="col-10">'+
								                    '<div class=" ms-4">'+data[0].Order_date+'</div>'+                    
								                '</div>'+
								            '</div>'+  
								            '<div class="mt-4 row">'+
								                '<div class="col-2 h5 m-0 fw-bold">'+
								                    '<div class=" ms-4">訂單備註</div>'+
								                '</div>'+
								                '<div class="col-10">'+
								                    '<div class="border ms-4" style="min-height:150px">'+data[0].Remark+'</div>'+                  
								                '</div>'+
								            '</div>'+            
										'</div>'
										);

					
					


    			},
    		}).then(function () {
    			<%--刪除購物車商品--%>
    			for(var j=0;j<pid_temp.length;j++){
    				$.ajax({
    	    			method : 'Delete',
    	    			url : "Cart_Servlet"+"?Account="+getCookie("account")+"&Product_id="+pid_temp[j],
    				});
    			};  			
    		});
			
			
			
			
			
        });
    
    
    
    
    
    
    </script>
</head>
<body>


    <%--Home page nav--%>
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
                            <a class="nav-link active" href="http://localhost:8080/IIIProject/yu/html/homePage.html">首頁</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="http://localhost:8080/IIIProject/news.html">最新消息</a>
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
                                <div class="nav-link active ">
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
							<li class="nav-item logoutState dropdown">
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


    <div class="offset-1 col-10">

        <%--購物車進度條--%>
        <div class="container mt-100 mb-5 text-center">
            <div class="row">
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 text-black-50">購物</div>
                    <span class="col-6 ">></span>
                </div>
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 text-black-50">填寫資料</div>
                    <span class="col-6 ">></span>
                </div>
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 text-black-50">付款</div>
                    <span class="col-6 ">></span>
                </div>
                <div class="col-md-3">
                    <div class="d-inline-block h5 fw-bold">訂單成立</div>
                </div>
            </div>
        </div>




        <%--購物車 文字--%>
        <div class="container mb-4">
            <div id="finishedPayment" class="row align-items-center pt-2 pb-2 m-0 mb-1 bg-primary bg-gradient text-light w-100">
                <div class="h3 m-0 pt-3 pb-3">
                    已完成付款
                </div>
            </div>

            <div id="shoppingCart" class="row align-items-center pt-2 pb-2 m-0 bg-secondary text-light w-100">
                <div class="h4 m-0">
                    購物車
                </div>
            </div>



            <%--購物車清單 欄位--%>

            <div id="shoppingCartName" class="row align-items-center pt-2 pb-2 w-100">
                <div class="w-35 d-inline-block text-center h5 m-0">
                    商品
                </div>
                <div class="w-35 d-inline-block text-center h5 m-0">
                    描述
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    單價
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    數量
                </div>
                <div class="w-10 d-inline-block text-center h5 m-0">
                    小計
                </div>
            </div>
            <hr />


            <%--購物車清單--%>         
			<div id="cartProduct_list"></div>

            <hr />

            <%--小提醒文字+合計文字--%>
            <div id="discount" class="row align-items-center pt-2 pb-2 m-0">
				<div class="w-10 d-inline-block h5 m-0 text-center p-2 fw-bold" style="background-color: rgb(255 227 243/ 0.90)">小提醒</div>
				<div class="w-60 d-inline-block h5 m-0">本店僅供店取</div>
				<div id="total" class="w-10 d-inline-block h5 m-0 text-center">
					合計
				</div>
              	<div id="totalMoney" class="w-20 d-inline-block h5 m-0 text-end"></div>
            </div>

            <%--取貨資料--%>
            <div id="shoppingCart" class="row align-items-center pt-2 pb-2 m-0 mt-5 bg-secondary text-light w-100">
                <div class="h4 m-0">
                    取貨資料
                </div>
            </div>

            <%--訂購者資料和取貨者資料--%>
            
            <div class="container">
  				<div class="row customerTable">

				</div>
			</div>

            <%--預計取貨日期、時間、訂單備註--%>

			<div class="container">
  				<div class="row pickDate">

				</div>
			</div>

            
            
            
            
   
            
            
            
            
 



<%-- <%-- *****合併更改********************************************************************************************************** --%>
 			

            
            

            


            <%--繼續購物頁面 和 回首頁--%>
<%-- *****合併更改********************************************************************************************************** --%>
            <div class="row justify-content-end pt-2 pb-2 m-0 mt-5 ">
                <div class="w-15 text-center">
<%-- 要修改onclick=location.href 的位置 --%>
                    <input type="submit" name="submit" class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100" value="繼續購物" onclick=location.href="http://localhost:8081/index">
<!--                <input type="submit" name="submit"  class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100" value="繼續購物" onclick=location.href="../ecpay/ECPayClient.html"> -->
                </div>
                <div class="w-15 text-end">
<%-- 要修改onclick=location.href 的位置 --%>
                    <input type="submit" name="submit"  class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100" value="回首頁" onclick=location.href="http://localhost:8080/IIIProject/yu/html/homePage.html">
<!--                <input type="submit" name="submit"  class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100" value="回首頁" onclick=location.href="../ecpay/ECPayClient.html"> -->
                </div>
            </div>


        </div>
    </div>

    <%--footer--%>
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