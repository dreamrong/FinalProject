<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>購物車．Flower Forever</title>
 
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


	<%-- 建立SQL連線 --%>
<%-- *****合併更改********************************************************************************************************** --%>
<%-- 已經初步修改dataSource --%>
	<sql:setDataSource dataSource="jdbc/iii_finalproject" />


	<%-- SQL搜尋 --%>
<%-- *****合併更改********************************************************************************************************** --%>
	<%--根據cookie的account，搜尋購物車資料庫的資料 --%>
	<sql:query var="pid_amt"> 
  		SELECT Product_id,Amount
    	FROM Carts  
    	WHERE Account = '${cookie.account.value}'
 	</sql:query>
 	
 

 
 
 <script>
 	window.onpageshow = function(event) {
	  if (event.persisted) {
	    window.location.reload() 
	  }
	};
	<%--onpageshow事件類似於onload事件，
		onpageshow事件在每次載入頁面時觸發，在頁面從瀏覽器快取中讀取時仍會觸發
		為了檢視頁面是直接從伺服器上載入還是從快取中讀取，可以使用 PageTransitionEvent物件的persisted屬性來判斷
		如果頁面從瀏覽器的快取中讀取該屬性返回 ture，否則返回 false--%>
 
	<%--被client端選中商品的id會放入此陣列--%>
	var chooseProductList =[];
	
	<%-- 將每項商品的庫存，以Map的key/value 存進Map中 --%>
	var proMap = new Map();
	

	
//  	$(function(){
// //  	  	當按下瀏覽器的上一頁，而回到此專案頁面時，先讓此專案重新整理，但因為本案例是直接從瀏覽器抓快取，所以沒有用
//  		if(window.name != "example"){
//  			location.reload();
//  			window.name = "example";
//  			console.log(111);
//  		}else{
//  			window.name = "";
//  			console.log(222);
//  		}
//  	});

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
    
    
    





	<%--將使用者帳號存於js變數Ac --%>
<%-- *****合併更改********************************************************************************************************** --%>
<%-- 已經初步修改${cookie.account.value } --%>
	var Ac = "<c:out value="${cookie.account.value}"/>";
	//var Ac = "<c:out value="${param.Account}"/>";

	
	$(function() {
		console.log("123");


		console.log(proMap);

		


		


		<%--網頁跳轉的方法之一--%>
// 		${pid_amt.rows[0]}
// 		if("${pid_amt.rows[0]["Product_id"]}" == ""){
//         	var locaStr="http://localhost:8080/Finalproject/shop0test01.jsp?Account="+"<c:out value="${param.Account}"/>";
//         	window.location=locaStr;
// 			console.log("空字串+++++++++++++");	
// 		}else {
// 			console.log("wtf");
// 		}

		<%--bootstrap與Jquery UI 按鈕樣式衝突的解決辦法--%>
		bootstrapButton = $.fn.button.noConflict(); 
		$.fn.bootstrapBtn = bootstrapButton;			
		
		<%--針對商品數量做加減--%>
		$("body").on("click",".subBtn",	function() {
			var obj = $(this).parent(".amountBtn").find(".inputBtnNum");
			if (obj.val() <= 1) {
				obj.val(1);
			} else {
				obj.val(parseInt(obj.val()) - 1);
				obj.change();
				}
		});
		$("body").on("click",".addBtn",	function() {
			var obj = $(this).parent(".amountBtn").find(".inputBtnNum");
			var addpro_Id = $(this).parent().parent().parent().attr("id"); //可以找到點+按鈕的該項產品id
			if((parseInt(obj.val())+ 1) > proMap.get(parseInt(addpro_Id))){
		        var dialog2 = $("<div class='h5 lh-lg'>購買數量大於目前庫存數量："+proMap.get(parseInt(addpro_Id))+"</div>").dialog({
		             width: 500, modal: true, autoOpen: false, title: '提示',
		             buttons: [{ text: '確定', click: function () { $(this).dialog('close') } }]
		         });
		        dialog2.dialog('open');
			}else{
				obj.val(parseInt(obj.val()) + 1);
				obj.change();							
			}
		});
		
				
		<%--單選商品-金額總計--%>
		$(".selectItem").click(function(){			
			var totalMoney=parseInt($("#totalMoneyNum").text());		
		 	var sum1= $(this).closest(".productItem").find(".totalNums").text();
			if($(this).hasClass("beenSelected")){	
				totalMoney -= parseInt(sum1)
			}else {
				totalMoney += parseInt(sum1)
			}
		 	$("#totalMoneyNum").html(totalMoney)							
		});

		<%--購物車清單-單選--%>
		$(".selectItem").click(function() {
			if ($(this).hasClass('beenSelected')) {
				$(this).removeClass("beenSelected");
		        $("#selectAll").prop("checked", false);
		      	chooseProductList.splice(chooseProductList.indexOf(String($(this).closest(".productItem").attr("id"))), 1);
		    } else {
		      	$(this).addClass("beenSelected");
		      	chooseProductList.push($(this).closest(".productItem").attr("id"));
		    }
		});

		
		<%--全選商品-金額總計--%>
		$("#selectAll").click(function(){
			if($("#selectAll").prop("checked")){
				var stAll = 0;
				var stArray = [];
		    $(".totalNums").each(function(key, val) {
		        stAll += parseInt(val["innerText"]);
		       })
			}else {
				var stAll = 0;		
			}
			$("#totalMoneyNum").html(stAll)			
		});
		
	  
		<%--購物車清單-全選--%>
		$("#selectAll").click(function() {			
		   	if ($("#selectAll").prop("checked")) {
		    	$(".selectItem").removeClass("beenSelected");
		    	$(".selectItem").addClass("beenSelected");
		    	$(".selectItem").each(function() {
		     		$(this).prop("checked", true);
		    	})
		    	chooseProductList = []
		    	
		    	$(".productItem").each(function(key, val) {
		     		chooseProductList.push(val["id"])
		    	})
		   	} else {
		    	$(".selectItem").removeClass("beenSelected");
		    	$(".selectItem").each(function() {
		     		$(this).prop("checked", false);
		    	})
		    	chooseProductList = [];
		   	}
		});
		
		
	
		<%--當商品數量更動時--%>
		$(".inputBtnNum").change(function() {
				<%--抓取數量變動的商品id--%>
			var idtemp = $(this).closest(".productItem").attr("id");
				<%--若變動數量 > 庫存數量--%>
			if($(this).val()>proMap.get(parseInt(idtemp))){
		        var dialog2 = $("<div class='h5 lh-lg'>購買數量大於目前庫存數量："+proMap.get(parseInt(idtemp))+"</div>").dialog({
		             width: 500, modal: true, autoOpen: false, title: '提示',
		             buttons: [{ text: '確定', click: function () { $(this).dialog('close') } }]
		         });
		         dialog2.dialog('open');
		         $(this).val(proMap.get(parseInt(idtemp)));	         
			}else{		
				<%--計算單項商品金額--%>
				var sum= $(this).closest(".productItem").find(".unitprice").text()*$(this).closest(".productItem").find(".inputBtnNum").val();
				$(this).closest(".productItem").find(".totalNums").html(sum);
						
				<%--當商品數量改變時，更改總金額--%>
				var stAll01 = 0;
				$(".totalNums").each(function(key, val){
					if($(this).closest(".productItem").find(".selectItem").hasClass("beenSelected")){
						stAll01 += parseInt(val["innerText"]);				
					}	
				});
			 	$("#totalMoneyNum").html(stAll01);				
	
														
				<%--ajax使用參數:取得商品的id --%>
				var P_id = $(this).closest(".productItem").attr('id');	<%--.closest:往上尋找，找到最近的class=aaa的id--%>
				<%--ajax使用參數:取得商品的Amount --%>
				var Amt = $(this).val();
				<%--ajax使用參數:URL字串 --%>
				var putString = "?Account=" + Ac + "&Product_id=" + P_id + "&Amount=" + Amt;			
				<%--提交給URL，讓servlet做資料庫的更改--%>
				$.ajax({
					method : 'put',
					url : "Cart_Servlet" + putString,
				});
			}
		});
		
		
		<%--當按下"移除"時，刪除前端顯示的商品，並使用ajax，讓servlet來刪除購物車資料庫中的商品--%>
		$(".removePro").click(function(){
			<%--刪除陣列中，被"移除"的那項商品id--%>
			chooseProductList.splice(chooseProductList.indexOf(String($(this).closest(".productItem").attr("id"))), 1);
			
			<%--ajax使用參數:取得商品的id --%>
			var Pdel_id = $(this).closest(".productItem").attr("id");			
			<%--ajax使用參數:URL字串 --%>
			var delString = "?Account=" + Ac + "&Product_id=" + Pdel_id;
			<%--提交給URL，讓servlet做資料庫的刪除--%>
			$.ajax({
				method : 'delete',
				url : "Cart_Servlet" + delString,
			});
			
			<%--刪除前端的那項商品和其子元素--%>
			$(this).closest(".productItem").remove();
			
			if(chooseProductList.length==0){
				window.location.reload() 
			}
			
		});
		
	 	 		
		<%--當按下"結帳按鈕"時，發出get請求，並跳轉至另一個頁面--%>
		$(".nextBtn").click(function() {
			<%--若沒有選商品，則跳出提示框--%>
			if(chooseProductList.length==0){
		        var dialog1 = $("<div class='h5 lh-lg'>請至少選取一項商品</div>").dialog({
		             width: 500, modal: true, autoOpen: false, title: '提示',
		             buttons: [{ text: '確定', click: function () { $(this).dialog('close') } }]
		         });
		         dialog1.dialog('open');
			}
			<%--若有選商品，則將 Product 用input附加於form中提交--%>
			else {
				for(i=0;i<chooseProductList.length;i++){
		 			$("#form1").append("<input type='hidden' name='product_id' value="+chooseProductList[i]+">");	 			
		 		}
				<%--將checkBox勾選的項目 ->取消勾選--%>
				$(':checkbox:checked').prop('checked',false);
<%-- *****合併更改********************************************************************************************************** --%>
<%-- 已初步更改，新增註解$("#form1").append--%>
// 		 		$("#form1").append("<input type='hidden' name='Account' value="+Ac+">");
		 		$("#form1").submit();
			}
		});
		
		
		
		
		
		







})			
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



	<c:choose>	
		<%--尚未登入會員，按購物車按鈕時 --%>
		<c:when test='${cookie.account.value==""}'>
			<div class="offset-1 col-10">
        		<%--購物車進度條--%>
        		<div class="container mt-100 mb-5 text-center">
            		<div class="row">
                		<div class="col-md-3">
							<div class="col-6 d-inline-block h5 fw-bold">購物</div>
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
                    		<div class="d-inline-block h5 text-black-50">訂單成立</div>
                		</div>
            		</div>
				</div>


        		<%--會員登入圖案--%>
        		<div id="nullShopping">
            		<img src="img/user.png" class="rounded mx-auto d-block" style="width:11%;" />
        		</div>

        		<%--會員登入 文字--%>
        		<div class="text-center h5 fw-bold m-1">
            		<p>尚未登入會員</p>
        		</div>


				<div class="container">
				  <div class="row">
        		<%-- 會員登入 按鈕 --%>
				    <div class="offset-3 col-md-3">
						<div id="regeisterBtn" class="text-center">
							<input id="regeisterBtn1" type="submit" name="submit" class="w-100 text-center fw-bold border-0 h5 lh-base" value="會員登入" onclick=location.href="http://localhost:8080/IIIProject/login.html">
						</div>
				    </div>
        		<%-- 立即註冊 按鈕 --%>
				    <div class="col-md-3">
						<div id="loginBtn" class="text-center">
							<input id="loginBtn1" type="submit" name="submit" class="w-100 text-center fw-bold border-0 h5 lh-base" value="立即註冊" onclick=location.href="http://localhost:8080/IIIProject/sign%20up.html">
						</div>
				    </div>
				  </div>
				</div>
			</div>
		</c:when>
	

	
		<%-- 若購物車是空的，則顯示此頁面 --%>
		<c:when test="${pid_amt.rows[0].Product_id == null}">
			<div class="offset-1 col-10">
        		<%--購物車進度條--%>
        		<div class="container mt-100 mb-5 text-center">
            		<div class="row">
                		<div class="col-md-3">
							<div class="col-6 d-inline-block h5 fw-bold">購物</div>
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
                    		<div class="d-inline-block h5 text-black-50">訂單成立</div>
                		</div>
            		</div>
				</div>


        		<%--購物車圖案--%>
        		<div id="nullShopping">
            		<img src="img/nullShoppingCart.png" class="rounded mx-auto d-block" style="width:10%;" />
        		</div>

        		<%--購物車是空的 文字--%>
        		<div class="text-center h5 fw-bold m-3">
            		<p>購物車是空的</p>
        		</div>

        		<%-- 繼續購物 按鈕 --%>
        		<div id="continueShop" class="text-center p-3 mt-4 mb-4">
					<input id="continueShopBtn" type="submit" name="submit" class="w-50 fw-bold border-0 h5 lh-base" value="繼續購物" onclick=location.href="http://localhost:8081/index">
        		</div>
			</div>
		</c:when>

				
	<%-- 若購物車有東西，則顯示此頁面 --%>					
		<c:when test="${pid_amt.rows[0].Product_id != null}">
			<div class="offset-1 col-10">

				<%--購物車進度條--%>
				<div class="container mt-100 mb-5 text-center">
					<div class="row">
						<div class="col-md-3">
							<div class="col-6 d-inline-block h5 fw-bold">購物</div>
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
							<div class="d-inline-block h5 text-black-50">訂單成立</div>
						</div>
					</div>
				</div>



				<%--購物車 文字--%>
				<div class="container mb-4">
					<div id="shoppingCart" class="row align-items-center pt-2 pb-2 m-0 bg-secondary text-light w-100">
						<div class="w-10 d-inline-block text-center h4 m-0">購物車</div>
					</div>

					<%--購物車清單 欄位名稱--%>
					<div id="shoppingCartName" class="row align-items-center pt-2 pb-2 w-100">
               			<div class="w-10 d-inline-block h5 m-0">
                    		<input type="checkbox" id="selectAll" value="全選" style="width:15px; height:15px" />
                    		全選
                    	</div>
						<div class="w-25 d-inline-block text-center h5 m-0">商品</div>
<%-- *****合併更改********************************************************************************************************** --%>
						<div class="w-25 d-inline-block text-center h5 m-0">描述</div>
						<div class="w-10 d-inline-block text-center h5 m-0">單價</div>
						<div class="w-10 d-inline-block text-center h5 m-0">數量</div>
						<div class="w-10 d-inline-block text-center h5 m-0">小計</div>
						<div class="w-10 d-inline-block text-center h5 m-0"></div>
					</div>
					<hr />


					<%--購物車清單--%>
					<div id="proTotal">
						<%--pid_amt.rows每一條rows都含有購物車Cart的Product_id,Amount --%>
						<c:forEach var="pid" items="${pid_amt.rows}" varStatus="vs">
							<%-- 取得產品的所有資料 --%>
							<sql:query var="pinfo"> 
  								SELECT *
    							FROM Products
    							WHERE product_id = '<c:out value="${pid.product_id}" />'
 							</sql:query>
 							
 						<%-- 將每項商品的庫存，以Map的key/value 存進Map中 --%>
 							<script>
 							<%--設定key/value (id/庫存)--%>
 							proMap.set(${pid.product_id}, ${pinfo.rows[0].product_inventory});							
 							</script>

							<div id="${pid.product_id}" class="productItem row align-items-center m-0 mb-2">
						
								<%-- 商品單選紐 --%>
   		             			<div class="w-10 d-inline-block mh-100 ">
        	            			<input name='Checkbox[]' type="checkbox" class="selectItem " value="單選" style="width:15px; height:15px" />
            	    			</div>
                				<%-- 圖片位置 --%>
<%-- *****合併更改********************************************************************************************************** --%>            			
								<div class="w-10 d-inline-block  mh-100" style="overflow: hidden;">
									<img src="http://localhost:8081/productquantitydownload/${pid.product_id}" style="height: 100px; object-fit: cover" />
								</div>
								<%-- 產品名稱 --%>
								<div class="w-15 d-inline-block mh-100" style="word-break: break-all;">
									<div class="text-left ellipsis">${pinfo.rows[0].product_name}</div>
								</div>
								<%-- 商品資訊1 --%>
<%-- *****合併更改********************************************************************************************************** --%>							
								<div class="w-25 d-inline-block mh-100"	style="word-break: break-all;">
									<div class="text-left ellipsis">${pinfo.rows[0].product_info1}</div>
								</div>
								<%-- 單價 --%>
								<div class="w-10 d-inline-block text-center mh-100 unitprice" style="word-break: break-all">
									${pinfo.rows[0].product_price}
								</div>
								<%-- 數量+選紐 --%>
								<div class="w-10 d-inline-block text-center mh-100 p-0 container">
									<div class="text-center row amountBtn">
										<div class="d-inline-block col-lg p-0 border border-secondary border-1 amountBox subBtn">-</div>
										<div class="d-inline-block col-lg p-0 border border-secondary border-1 amountBox inputBtn">
											<input type="text" class="w-100 text-center p-0 border-0 inputBtnNum" oninput="if(value<1)value=1" value="${pid_amt.rows[vs.index].Amount}" />
										</div>
										<div class="d-inline-block col-lg p-0 border border-secondary border-1 amountBox addBtn">+</div>
									</div>
								</div>
								<%-- 小計 --%>
								<div class="w-10 d-inline-block text-center mh-100 totalNums">
									${pid_amt.rows[vs.index].Amount*pinfo.rows[0].product_price}
								</div>
								<%-- 移除商品 --%>
								<div class="w-10 d-inline-block text-center mh-100 removePro">
									移除
								</div>
							</div>
						</c:forEach>
					</div>

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


					<%--繼續購物和結帳按鈕--%>
				
					<div class="row justify-content-end pt-2 pb-2 m-0 ">
						<div class="w-15 text-center">
<%-- *****合併更改********************************************************************************************************** --%>
<%-- 要修改onclick=location.href 的位置 --%>
							<input type="submit" name="submit" class="previousBtn fw-bold border-0 h4 m-0 p-0 w-100" value="繼續購物" onclick=location.href="http://localhost:8081/index">
						</div>			
						<div class="w-15 text-end">
							<form  id="form1" method="get" action="CartStep2.jsp">
								<input class="nextBtn fw-bold border-0 h4 m-0 p-0 w-100" type="button" value="結帳">				
							</form>
						</div>
					</div>

				</div>
			</div>
		</c:when>														
	</c:choose>

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