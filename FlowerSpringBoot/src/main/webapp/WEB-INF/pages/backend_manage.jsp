<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理頁</title>
<style type="text/css">
.manage{
height:600px;
width:1200px;
margin:100px auto;
}

</style>
</head>
<body>
<div class="manage">
<a href="${req.contextPath}/manage">商品管理</a>
<a href="${req.contextPath}/index">商品瀏覽頁面</a>
<a href="${req.contextPath}/index2">商品詳情頁面</a>
</div>
</body>
</html>