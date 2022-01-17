<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改資料．Flower Forever</title>
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
/*---------- Header Area 此處有改原稿的43------------*/
.navbar-brand img {
	width: 42px;
}

.main {
	width: 1200px;
	margin: 60px auto;
}
/* ------------- */
.prodId {
	float: left;
}

.prodName {
	float: right;
}
/* ------------- */
.prodType {
	float: left;
}

.prodType #type {
	width: 300px;
	height: 36px;
}

.prodSubtype {
	float: left;
	margin-left: 150px;
}

.prodSubtype #subtype {
	width: 300px;
	height: 36px;
}

.prodPlace {
	float: left;
	margin-left: 150px;
}

.prodPlace #place {
	width: 300px;
	height: 36px;
}

/* ------------- */
.prodPrice {
	float: left;
}

.prodQuantity {
	float: left;
	margin-left: 150px;
}

.prodInventory {
	float: left;
	margin-left: 150px;
}
/* ------------- */
.prodDescription1 {
	float: left;
}

.prodDescription2 {
	float: left;
}
/* ------------- */
.btn-group {
	margin-left: 500px;
	margin-top: 30px;
	float: left;
}

.btn {
	margin-right: 20px;
}
/* ------------- */
#form-edit>div {
	margin-top: 20px;
}

.image .img1 {
	display: inline-block;
	margin-top: 10px;
}

.input-error {
	color: red;
	display: none;
}
</style>

<script>

//登入登出
        function signOut() {
//             var auth2 = gapi.auth2.getAuthInstance();
//             auth2.signOut().then(function () {
//                 console.log('Google User signed out.');
//             });
                $("#memberLogin").hide();
                $("#adminLogin").hide();
                $("#cartLogin").show();
                $(".logoutState").hide();
                $("#loginState").show();
                window.location = "http://localhost:8080/IIIProject/yu/html/homePage.html";
        }

//         function onLoad() {
//             gapi.load('auth2', function () {
//                 gapi.auth2.init();
//             });
//         }

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

</head>

<body style="background-color: #f5f6fa">
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

	<br />
	<h1>111</h1>
	<!-- 調整跳板 -->

	<div class="main">
		<h2>商品管理</h2>
		<hr>
		<h2 style="color: red;">修改資料</h2>
		<!-- 隱藏向servlet提交請求 -->
		<form id="form-edit" action="${req.contextPath}/editProduct"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="action" value="${param.method}" />
			<!-- 修改查詢的dao方法需要帶入id，在edit.jsp加一個id的值  -->
			<input type="hidden" name="id"
				value="${requestScope.product.product_id}" />
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-5 prodId">
				<label for="id" class="form-label">商品編號</label> <input type="text"
					class="form-control" id="id" name="product_id"
					value="${requestScope.product.product_id}">
				<div id="product_id-input-error" class="input-error">不能為空且只能為數字</div>
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-5 prodName">
				<label for="name" class="form-label">商品名稱</label> <input type="text"
					class="form-control" id="name" name="product_name"
					value="${requestScope.product.product_name}">
				<div id="product_name-input-error" class="input-error">商品名稱不能為空</div>
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodType">
				<label for="type" class="form-label" style="display: block;">分類</label>
				<select id="type" name="product_type">
					<option value="flower">鮮花花束</option>
					<option value="gift">周邊禮品</option>
				</select>
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodSubtype">
				<label for="subtype" class="form-label" style="display: block;">子分類</label>
				<select id="subtype" name="product_subtype">
					<option value="玫瑰">玫瑰</option>
					<option value="向日葵">向日葵</option>
					<option value="滿天星">滿天星</option>
					<option value="巧克力">巧克力</option>
					<option value="鮮奶蛋糕">鮮奶蛋糕</option>
					<option value="精美禮品">精美禮品</option>
				</select>
				<!-- 				<input -->
				<!-- 					type="text" class="form-control" id="subtype" -->
				<!-- 					name="product_subtype" -->
				<%-- 					value="${requestScope.product.product_subtype}"> --%>
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodPlace">
				<label for="place" class="form-label" style="display: block;">產地</label>
				<select id="place" name="product_place">
					<option value="台北市">台北市</option>
					<option value="新北市">新北市</option>
					<option value="桃園市">桃園市</option>
					<option value="臺中市">臺中市</option>
					<option value="臺南市">臺南市</option>
					<option value="高雄市">高雄市</option>
					<option value="基隆市">基隆市</option>
					<option value="新竹市">新竹市</option>
					<option value="嘉義市">嘉義市</option>
				</select>
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodPrice">
				<label for="price" class="form-label">售價</label> <input
					type="number" min="0" class="form-control" id="price"
					name="product_price" value="${requestScope.product.product_price}">
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodQuantity">
				<label for="quantity" class="form-label">數量</label> <input
					type="number" min="0" class="form-control" id="quantity"
					name="product_quantity"
					value="${requestScope.product.product_quantity}">
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-3 prodInventory">
				<label for="inventory" class="form-label">庫存</label> <input
					type="number" min="0" class="form-control" id="inventory"
					name="product_inventory"
					value="${requestScope.product.product_inventory}">
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-12 prodDescription1">
				<label class="form-label">描述1</label>
				<textarea class="form-control" rows="3" name="product_info1"
					id="info1">${requestScope.product.product_info1}</textarea>
				<div id="product_info1-input-error" class="input-error">商品描述不能為空</div>
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="col-md-12 prodDescription2">
				<label class="form-label">描述2</label>
				<textarea class="form-control" rows="3" name="product_info2"
					id="info2">${requestScope.product.product_info2}</textarea>
				<div id="product_info2-input-error" class="input-error">商品描述不能為空</div>
			</div>
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="image">
				<div class="col-md-3 img1">
					<p>圖片</p>
<%-- 					<img src="/productquantitydownload/${product.product_id}" --%>
<!-- 						height="100" width="80" style="margin-bottom: 10px;" /> -->
						 <input
						type="file" name="myFiles" value="上傳" id="input_update"> <span
						style="color: red;">請上傳圖片</span>
				</div>
			</div>
			<!-- <div class="image"> -->
			<!--    ---------------------------------------------------------------------------------------  -->
			<div class="btn-group">
				<button type="submit" class="btn btn-primary" id="update">更新</button>
				<button type="reset" class="btn btn-primary">重置</button>
				<button type="button" class="btn btn-primary" id="cancel">取消</button>
			</div>

		</form>
	</div>
	<!-- <div class="main"> -->

	<br />
	<!-- 調版用 -->
	<%--footer--%>
	<hr />
	<footer>
		<div class="container offset-2 col-md-9" style="height: 150px">
			<div class="row align-items-start">
				<div class="col-lg-3">
					<div class="fw-bolder">客戶服務</div>
					<a class="text-start text-decoration-none link-secondary"
						href="http://localhost:8080/IIIProject/yu/html/connectReturned.html">退換貨政策</a>
					<br> <a class="text-start text-decoration-none link-secondary"
						href="http://localhost:8080/IIIProject/yu/html/connectPrivacy.html">隱私權政策</a>
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
					<a
						href="https://instagram.com/iiiflowerforever?utm_medium=copy_link"
						class="text-decoration-none link-secondary" target="_blank"> <img
						class="mt-1 mb-1"
						src="http://localhost:8080/Finalproject/img/FB_IG_Logo/instagram.png"
						style="width: 5vh" /> <span class="">iiiflowerforever</span>
					</a> <br> <a
						href="https://www.facebook.com/Flower-Forever-%E8%8A%B1%E9%96%8B%E4%B8%8D%E6%95%97-108098771615167/"
						class="text-decoration-none link-secondary" target="_blank"> <img
						class="mt-1 mb-1"
						src="http://localhost:8080/Finalproject/img/FB_IG_Logo/facebook.png"
						style="width: 5vh" /> <span class="">Flower Forever 花開不敗</span>
					</a>
				</div>
			</div>
		</div>
	</footer>

	<script type="text/javascript">
		$(function() {
			$(".btn-group #cancel").click(function() {
				window.location.href = "${req.contextPath}/manage";
			})
		});

		// 表單驗證

		$(function() {

			$("#id").on('blur', function() { // 商品編號
				var val = $(this).val();

				if ($.isNumeric(val)) {
					$("#product_id-input-error").hide();
					$("#update").attr("disabled", false);
				}

				else {
					$("#product_id-input-error").show();
					$("#update").attr("disabled", true);
				}

			});

			$("#name").on('blur', function() { // 商品名稱
				var val = $(this).val();
				var real = $.trim(val);

				if (!real && real !== 0) {
					$("#product_name-input-error").show();
					$("#update").attr("disabled", true);
				}

				else {
					$("#product_name-input-error").hide();
					$("#update").attr("disabled", false);
				}

			});

			$("#info1").on('blur', function() { // info1
				var val = $(this).val();
				var real = $.trim(val);

				if (!real && real !== 0) {
					$("#product_info1-input-error").show();
					$("#update").attr("disabled", true);
				}

				else {
					$("#product_info1-input-error").hide();
					$("#update").attr("disabled", false);
				}

			});

			$("#info2").on('blur', function() { // info2
				var val = $(this).val();
				var real = $.trim(val);

				if (!real && real !== 0) {
					$("#product_info2-input-error").show();
					$("#update").attr("disabled", true);
				}

				else {
					$("#product_info2-input-error").hide();
					$("#update").attr("disabled", false);
				}
			});
		})
	</script>
</body>
</html>