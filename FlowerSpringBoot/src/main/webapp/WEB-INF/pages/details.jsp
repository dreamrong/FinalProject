<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳情頁</title>
</head>
<body>
<h1>歡迎來到 商品詳情頁:)</h1>

<script type="text/javascript">

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

</script>
</body>
</html>