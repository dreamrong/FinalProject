<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>商品管理．Flower Forever</title>
<!-- Bootstrap -->
<link rel="icon" href="http://localhost:8080/Finalproject/img/Logo/Icon_Logo.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery UI 樣式表 and jQuery and jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 以下是詳情頁面參數 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

	<script src="http://localhost:8080/IIIProject/js/checkLoginCookie.js"></script>
    
    <link rel="icon" href="http://localhost:8080/Finalproject/img/Logo/Icon_Logo.png" />

<!-- -------------------張婷 Manage Script------------------- -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- 第一步: 導包 DataTables CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<!--第三步：初始化Datatables-->
<script type="text/javascript">
	$(function() {
		// 激活DataTable
		$('#myTable').DataTable();

		// 給刪除的a標籤綁定單擊事件，用於刪除的確認提示操作
		$('body').delegate(
				".delete",
				"click",
				function() {
					// confirm確認提示框函數，參數是提示內容，有確認和取消兩按鈕
					// 返回ture表示點擊確認，返回false表示點擊取消
					// 使用function裡的this屬性，得到當前要刪除的商品名
					return confirm("確定刪除【"
							+ $(this).parent().parent().find("td:eq(2)").text()
							+ "】?");
					// return false;  阻止元素默認提交請求的動作，交由上面confirm統一return
				});
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
    
    
// 	$(document).ready(function() {
// 		$('#myTable').DataTable();
// 	});

// 	$(function() {
// 		// 給刪除的a標籤綁定單擊事件，用於刪除的確認提示操作
// 		$("#delete").click(
// 				function() {
// 					// confirm確認提示框函數，參數是提示內容，有確認和取消兩按鈕
// 					// 返回ture表示點擊確認，返回false表示點擊取消
// 					// 使用function裡的this屬性，得到當前要刪除的商品名
// 					return confirm("確定刪除【"
// 							+ $(this).parent().parent().find("td:eq(2)").text()
// 							+ "】?");
// 					//return false;  阻止元素默認提交請求的動作，交由上面confirm統一return
// 				})
// 	});
</script>

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
	height: 100px;
	margin-top: 10px;
	margin-left: 10px;
	background-color: #e3b7ae;
}

.content-right {
	float: right;
	width: 1220px;
	height: 600px;
	margin-top: 10px;
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

.nav2-menu {
	height: 150px;
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

/* ----------張婷的 CSS修改---------- */

/*---------- Header2 Area ------------*/
.header {
	width: 1200px;
	height: 60px;
	margin: 0 auto;
}

#title {
	float: left;
	color: #2d3436;
	font-weight: 700;
	font-size: 35px;
	text-align: center;
	line-height: 60px;
}

#add {
	float: right;
	font-weight: 700;
	font-size: 24px;
	text-align: center;
	line-height: 60px;
}

/*---------- Body-Content Area ------------*/
.list {
	width: 1200px;
	margin: 30px auto;
	text-align: center;
}
</style>





</head>
<!-- <body style="background: #ecf0f1;"> -->
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

		<div class="content-left">
			<div class="left-title">
				<a href="#">管理員介面</a>
			</div>
			<!-- 分割線 -->
			<div class="seg"></div>
			<!-- 菜單欄導航 -->
			<div class="nav2">
				<!-- 單個菜單項 -->
				<div class="nav2-menu">
					<!-- 子標題 -->
					<div class="nav2-content">
						<a href="http://localhost:8080/IIIProject/AdminPage/AdminHome.html" id="allprods2" class="navtext">管理首頁</a>
						<a href="http://localhost:8080/IIIProject/AdminPage/MemberAdmin.html" id="allflowers" class="navtext">會員管理</a>
						<a href="http://localhost:8080/IIIProject/AdminPage/NewsAdmin.html" id="allgifts" class="navtext">最新消息</a>
						<a href="http://localhost:8081/manage" id="allgifts" class="navtext">商品管理</a>
						<a href="http://localhost:8080/IIIProject/AdminPage/OrdersAdmin.html" id="allgifts" class="navtext">訂單管理</a>
					</div>

					<!-- 分割線 -->
					<div class="seg"></div>

				</div>
			</div>
		</div>

		<!-- -----------------------------------------------------內容區---------------------------------------------------------------------------- -->
		<div class="content-right">
			<!-- 調整跳板 -->

			<div class="header">
				<div id="title">商品管理</div>
				<div id="add">
					<a href="${req.contextPath}/insert">新增商品</a>
				</div>
			</div>

			<hr>
			<div class="list">
				<table id="myTable" class="display">
					<thead>
						<tr>
							<th>編號</th>
							<th>圖片</th>
							<th>商品名稱</th>
							<th>分類</th>
							<th>子分類</th>
							<th>售價</th>
							<th>數量</th>
							<th>庫存</th>
							<th>產地</th>
							<th>功能</th>
							<th>功能</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="product">
							<tr>
								<td>${product.product_id}</td>
								<td>
									<img src="/productquantitydownload/${product.product_id}" height="50" width="50" />
								</td>
								<td>${product.product_name}</td>
								<td>${product.product_type}</td>
								<td>${product.product_subtype}</td>
								<td>${product.product_price}</td>
								<td>${product.product_quantity}</td>
								<td>${product.product_inventory}</td>
								<td>${product.product_place}</td>
								<td>
									<a href="${req.contextPath}/editProduct/${product.product_id}">修改</a>
								</td>
								<!-- 刪除鍵做防呆    &   此處id名可自定義，不用對應到哪個 -->
								<td>
									<a class="delete" id="delete" href="${req.contextPath}/deleteProduct/${product.product_id}">刪除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


		</div>


	</div>

</body>


</html>