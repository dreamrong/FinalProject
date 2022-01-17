<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>填寫資料．Flower Forever</title>
    
         <%-- cookie相關function和google API --%>
<!-- 	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script> -->
<!-- 	<meta name="google-signin-client_id" content="1030132111174-it3lsbndt9981bcucrt2hi2e613hekj6.apps.googleusercontent.com"> -->
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


	<%--日期選擇器 --%>
	<script src="js/jquery.ui.datepicker-zh-TW.js"></script>
	
	<%--時間選擇器 --%>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

  
	<%-- 建立SQL連線 --%>
<%-- *****合併更改********************************************************************************************************** --%>
<%--已經初步更改dataSource --%>
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
    
    
    
    
    	var ItemName = "";
		
		$(function () {
			
			<%--bootstrap與Jquery UI 按鈕樣式衝突的解決辦法--%>
			bootstrapButton = $.fn.button.noConflict(); 
			$.fn.bootstrapBtn = bootstrapButton;
        	
        	<%--回到上一頁--%>
        	$(".previousBtn").click(function(){     		
        		window.location="http://localhost:8080/Finalproject/CartStep1.jsp"
        	})
         
        	
            <%--預計取貨日期--%>
        	$( "#datepicker" ).datepicker({
        		dateFormat: 'yy-mm-dd',
                minDate: "-1+2d",
                maxDate: "-1+1m",    
                showAnim: "slideDown",
                beforeShowDay: noMondays 
                <%--會將每個日期當成參數，丟入noMondays function中--%>       		
        	});      	
        	function noMondays(a) {
        		  a=a.getDay();
        		  <%--a.getDay()=>星期天為0，星期六為6--%>
        		  if(a==1){
        			  return [false,""];
        			  <%--beforeShowDay的接收格式[0]=true/false、[1]=""或CSS，詳細要參考官方文件--%>
        		  }
        		  return [true,""];
        	}


               
        	
            <%--預計取貨時間--%>
<%-- *****合併更改********************************************************************************************************** --%>
			$('#timepicker').timepicker({				
    			timeFormat: 'HH:mm',
    			interval: 30,
    			minTime: '09',
 		 		maxTime: '17:00',
// 		  		defaultTime: '09',
		  		startTime: '09',
  				dynamic: false,
		  		dropdown: true,
				scrollbar: true
			});


        	
        	
        	
        	<%--總計金額--%>
			var stAll02=0;
			$(".totalNums").each(function(key, val) {
				stAll02 += parseInt(val["innerText"]);
			})
			$("#totalMoney").html("NT$ "+stAll02);
			$(".creditTotal").html("NT$ "+stAll02);
	
			
			<%--當點選"下一步"時，提交給綠界和servlet的參數--%>
			$(".nextBtn").click(function(){
				<%--若沒有選則取貨日期，則跳出提示框--%>
				if($("#Picker_name")=="" || $("#Phone").val()=="" || $("#datepicker").val()=="" || $("#timepicker").val()==""){
				
			        var dialog1 = $("<div class='h5 lh-lg'>資料請填寫完整</div>").dialog({
			             width: 500, modal: true, autoOpen: false, title: '提示',
			             buttons: [{ text: '確定', click: function () { $(this).dialog('close') } }]
			         });
			         dialog1.dialog('open');
				}else{
// 	 				if($("#timepicker").val().match())
					$("#form1").append("<input type='hidden' name='ItemName' value="+ItemName+">");	 	 			
	 				$("#form1").append("<input type='hidden' name='TotalAmount' value="+stAll02+">");	 						
 					$("#form1").append("<input type='hidden' name='TradeDesc' value='芳名店家交易'>");
		 	    	$(".amount").each(function(key, val) {
			      		$("#form1").append("<input type='hidden' name='Buy_amount' value="+val["innerText"]+">");
			    	});		    
					$(".productItem").each(function(key, val){
						$("#form1").append("<input type='hidden' name='Product_id' value="+$(this).attr('id')+">");
					});
<%-- *****合併更改********************************************************************************************************** --%>
<%-- 已經初步修改 --%>
 					$("#form1").append("<input type='hidden' name='Account' value="+"${cookie.account.value}"+">");
// 					$("#form1").append("<input type='hidden' name='Account' value="+"${param.Account}"+">");
					$("#form1").append("<input type='hidden' name='Picker_name' value="+$("#Picker_name").val()+">");
					$("#form1").append("<input type='hidden' name='Phone' value="+$("#Phone").val()+">");
					$("#form1").append("<input type='hidden' name='Email' value="+$("#Email").val()+">");
					$("#form1").append("<input type='hidden' name='Pickup_date' value="+$("#datepicker").val()+">");
					$("#form1").append("<input type='hidden' name='Pickup_time' value="+$("#timepicker").val()+">");
					$("#form1").append("<input type='hidden' name='Remark' value="+$("#Remark").val()+">");
					$("#form1").submit();
				}
				
				<%-- ecpay 商品名稱 --%>
				<%-- ecpay 總金額 --%>
				<%-- ecpay 商品描述 --%>
				<%-- insert 資料庫_購買數量 --%>
				<%-- insert 資料庫_商品id --%>
				<%-- insert 資料庫_會員帳號 --%>
				<%-- insert 資料庫_取貨人姓名 --%>
				<%-- insert 資料庫_取貨人電話 --%>
				<%-- insert 資料庫_取貨人信箱 --%>
				<%-- insert 資料庫_取貨日期 --%>				
				<%-- insert 資料庫_取貨時間 --%>				
				<%-- insert 資料庫_備註 --%>				
	 		});
 


			
			<%-- 信用卡卡號 限制 --%>
//         	$("input.onlyNum").on("keydown", function(e){
//         	    console.log(e.which);
//         	    if((e.which >= 48 && e.which <= 57) || e.which == 8|| e.which == 9|| e.which == 37|| e.which == 39){
        	      
//         	      console.log(e.target.value.length);
//         	      if(e.target.value.length == 0 && e.which == 8){
//         	        $(this).prev().focus();
//         	      }
//         	    }else if((e.which >= 96 && e.which <= 105) || e.which == 8|| e.which == 9|| e.which == 37|| e.which == 39){
          	      
//           	      console.log(e.target.value.length);
//           	      if(e.target.value.length == 0 && e.which == 8){
//           	        $(this).prev().focus();
//           	      }
//           	    }else{
//         	      e.preventDefault();
//         	    }
//         	});

//         	$("input.onlyNum").on("keyup", function(e){        	  
//         	  // \D 代表非數字字元，g 代表全域尋找
//         	  let str = e.target.value;
//         	  console.log("e.target.value");
//         	  console.log(e.target.value);
//         	  let str = (e.target.value).replace(/\D/g, "");        	  
//         	  $(this).val(str);        	       	  
//         	  console.log(str.length);
//         	  if(str.length == $(this).attr("maxlength")){
//         	    $(this).next().focus();
//         	  }
//         	});

			
        	<%--信用卡有效日期 限制--%>
//         	$("input.card").on("keydown", function(e){
//         	    //console.log(e.which);
//         	    if((e.which >= 48 && e.which <= 57) || e.which == 8){
        	      
//         	      console.log(e.target.value.length);
//         	      if(e.target.value.length == 0 && e.which == 8){
//         	        $(this).prev().focus();
//         	      }
//         	    }else if((e.which >= 96 && e.which <= 105) || e.which == 8){
          	      
//           	      //console.log(e.target.value.length);
//           	      if(e.target.value.length == 0 && e.which == 8){
//           	        $(this).prev().focus();
//           	      }
//           	    }else{
//         	      e.preventDefault();
//         	    }
//         	});

//         	$("input.card").on("keyup", function(e){
        	  
//         	  // \D 代表非數字字元，g 代表全域尋找
//         	  //let str = e.target.value;
//         	  console.log("e.target.value");
//         	  console.log(e.target.value);
//         	  let str = (e.target.value).replace(/\D/g, "");
        	  
//         	  $(this).val(str);
        	       	  
//         	  //console.log(str.length);
//         	  if(str.length == 4){
//         	    $(this).next().focus();
//         	  }
//         	});
        	
        	

		});

    </script>




</head>
<body>

	<%-- header --%>
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




    <div class="offset-1 col-10">

        <!--購物車進度條-->
        <div class="container mt-100 mb-5 text-center">
            <div class="row">
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 text-black-50">購物</div>
                    <span class="col-6 ">></span>
                </div>
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 fw-bold">填寫資料</div>
                    <span class="col-6 ">></span>
                </div>
                <div class="col-md-3">
                    <div class="col-6 d-inline-block h5 text-black-50">付款</div>
                    <span class="col-6 ">></span>
                </div>
                <div class="col-md-3">
                    <div class="d-inline-block h5 text-black-50">訂單成立</div>
                </div>
            </div>
        </div>




        <!--購物車 文字-->
        <div class="container mb-4">

            <div id="shoppingCart" class="row align-items-center pt-2 pb-2 m-0 bg-secondary text-light w-100">
                <div class="h4 m-0">
                    購物車
                </div>
            </div>



            <%--購物車清單 欄位列--%>

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

				<c:forEach var="selectpid" items="${paramValues.product_id}"> 
					<%-- 取得產品的所有資料 --%>
					<sql:query var="amt"> 
  						SELECT Amount
    					FROM Carts  
<%-- *****合併更改********************************************************************************************************** --%>
<%-- 已經初步修改 --%>
    					WHERE Product_id = '${selectpid}' AND Account = '${cookie.account.value}'
<%--     					WHERE Product_id = '${selectpid}' AND Account = '${param.Account}' --%>
 					</sql:query>

					<sql:query var="pinfo"> 
  						SELECT *
    					FROM Products
    					WHERE product_id = '<c:out value="${selectpid}" />'
 					</sql:query>
 					
					<%--商品列表 --%>
					<div id="${selectpid}"
						class="productItem row align-items-center m-0 mb-2">
						<%-- 圖片位置 --%>
<%-- *****合併更改********************************************************************************************************** --%>
						<div class="w-10 d-inline-block  mh-100" style="overflow: hidden;">
							<img src="http://localhost:8081/productquantitydownload/${selectpid}"
								style="height: 100px; object-fit: cover" />
						</div>
						<%-- 產品名稱 --%>
						<div class="w-25 d-inline-block mh-100"
							style="word-break: break-all;">
							<div class="text-left ellipsis">
								${pinfo.rows[0].product_name}</div>
						</div>
						<%-- 商品資訊1 --%>
						<div class="w-35 d-inline-block mh-100"	style="word-break: break-all;">
							<div class="text-left ellipsis">${pinfo.rows[0].product_info1}</div>
						</div>
						<%-- 單價 --%>
						<div class="w-10 d-inline-block text-center mh-100 unitprice"
							style="word-break: break-all">${pinfo.rows[0].product_price}
						</div>
						<%-- 數量 --%>
						<div class="w-10 d-inline-block text-center mh-100 amount">
							${amt.rows[0].Amount}</div>
						<%-- 小計 --%>
						<div class="w-10 d-inline-block text-center mh-100 totalNums">
							 ${amt.rows[0].Amount*pinfo.rows[0].product_price}
						</div>
					</div>
					<%-- 送給綠界的參數 --%>
					<script>
						ItemName += "${pinfo.rows[0].product_name}"+"_"+"${pinfo.rows[0].product_price}"+"元x"+"${amt.rows[0].Amount}"+"#";
					</script>
				</c:forEach>
      
            <hr />

			<%--小提醒文字+合計文字--%>
			<div id="discount" class="row align-items-center pt-2 m-0">
				<div class="w-10 d-inline-block h5 m-0 text-center p-2 fw-bold" style="background-color: rgb(255 227 243/ 0.90)">小提醒</div>
				<div class="w-60 d-inline-block h5 m-0">本店僅供店取，需先信用卡付款</div>
				<div id="total" class="w-10 d-inline-block h5 m-0 text-center">
					合計
				</div>
				<div id="totalMoney" class="w-20 d-inline-block h5 m-0 text-end">
					<span>NT$ </span>
					<span id="totalMoneyNum">0</span>
				</div>
			</div>
			<div id="discount" class="row align-items-center pb-2 m-0">
				<div class="w-10 d-inline-block m-0 p-2"></div>
				<div class="w-60 d-inline-block h5 m-0">為確保花材新鮮，取貨日期僅提供未來一個月</div>
			</div>


            <%--取貨資料 標題--%>
            <div id="cusDataTitle" class="row align-items-center pt-2 pb-2 m-0 mt-5 mb-5 bg-secondary text-light w-100">
                <div class=" h4 m-0">
                    取貨資料
                </div>
            </div>


<%-- *****合併更改********************************************************************************************************** --%>
            <%--顧客資料 名片式--%>
<!--             <div id="cusDataBox" class="row m-0"> -->
<!--                 <div class=" col-lg-4"> -->
<!--                     <div class="cusData cusDataSuccess ms-3 me-3" style="position:relative"> -->
<!--                         <div class="cusData_name" style="word-break: break-all">姓名 : 楊先生</div> -->
<!--                         <div class="cusData_phone" style="word-break: break-all">電話 : 091234567</div> -->
<!--                         <div class="cusData_email ellipsis" style="word-break: break-all">E-mail : google2021@gmail.com</div> -->
<!--                         <input type="submit" class="cusData_edit" style="position:absolute; right:30px;bottom:20px" value="編輯" /> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class=" col-lg-4"> -->
<!--                     <div class="cusData cusDataSuccess ms-3 me-3" style="position:relative"> -->
<!--                         <div class="cusData_name" style="word-break: break-all">姓名 : 楊先生</div> -->
<!--                         <div class="cusData_phone" style="word-break: break-all">電話 : 091234567</div> -->
<!--                         <div class="cusData_email ellipsis" style="word-break: break-all">E-mail : google2021@gmail.com</div> -->
<!--                         <input type="submit" class="cusData_edit" style="position:absolute; right:30px;bottom:20px" value="編輯" /> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class=" col-lg-4"> -->
<!--                     <div class="cusData cusDataSuccess ms-3 me-3" style="position:relative"> -->
<!--                         <div class="cusData_name" style="word-break: break-all">姓名 : 楊先生</div> -->
<!--                         <div class="cusData_phone" style="word-break: break-all">電話 : 091234567</div> -->
<!--                         <div class="cusData_email ellipsis" style="word-break: break-all">E-mail : google2021@gmail.com</div> -->
<!--                         <input type="submit" class="cusData_edit" style="position:absolute; right:30px;bottom:20px" value="編輯" /> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->


            <%--取貨人姓名--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">姓名</label>
                </div>
                <div class="col-10">
                    <input id="Picker_name" style="display: inline" type="text" name="Picker_name" class="contact_input" placeholder="必填"/>                    
                </div>
            </div>
            
            <%--取貨人電話--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">電話</label>
                </div>
                <div class="col-10">
                    <input id="Phone" style="display: inline" type="tel" name="Phone" class="contact_input" placeholder="必填"/>                    
                </div>
            </div>
            
            <%--取貨人信箱--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">信箱</label>
                </div>
                <div class="col-10">
                    <input id="Email" style="display: inline" type="email" name="Email" class="contact_input" />                    
                </div>
            </div>


            <%--預計取貨日期--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">預計取貨日期</label>
                </div>
                <div class="col-10">
                    <input id="datepicker" style="display: inline" type="text" name="date" class="contact_input" readonly="readonly" placeholder="必填"/> 
                    <label class=" fw-bold">（營業日：每周二~周日）</label>                   
                </div>
            </div>
            
			<%--預計取貨時間--%>
			<div class="form_row mt-5 row">
				<div class="col-2 h5 m-0 fw-bold">
					<label class=" ms-4">預計取貨時間</label>
				</div>
				<div class="col-10">
					<input id="timepicker" type="text" class="text-center timeExample" readonly="readonly" placeholder="必填"/>
					<label class=" fw-bold">（營業時間：09:00-17:00）</label>
				</div>
			</div>


			<%--訂單備註--%>
            <div class="form_row mt-5 row">
                <div class="col-2 h5 m-0 fw-bold">
                    <label class=" ms-4">訂單備註</label>
                    <label class=" ms-4" style="font-size:15px">(限100個字)</label>
                </div>
                <div class="col-10">
                    <textarea id="Remark" name="name" class="contact_textarea " maxlength="100"></textarea>
                </div>
            </div>


            <%--回去購物頁面 和 到訂單成立頁面--%>
            <div class="row justify-content-end pt-2 pb-2 m-0 ">
                <div class="w-15 text-center">
                    <button class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100 ">上一步</button>
                </div>
                <div class="w-15 text-end">
                	<form id="form1" method="post" action="../ecpay/ECPayServer">
                		<input class="nextBtn fw-bold border-0 h4 m-0 p-0 w-100" type="button" value="付款">				
                    </form>
                </div>                					
					
            </div>

        </div>
</div>


	<%-- footer --%>
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