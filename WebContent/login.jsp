<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.book.book.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆</title>
</head>
<body>
<div id="Container">
<div id="header"> 	
	<nav>
		<ul>
			<li><a href="index.jsp">主菜单</a></li>
			<li><a href="borrow.jsp">图书借阅</a></li>
			<li><a href="return.jsp">图书归还</a></li>
			<li><a href="info.jsp">历史借阅信息</a></li>
		</ul>
	</nav>
	<div id="use"><a href="login.jsp">管理员登陆</a></div>
</div>
<div class="book">
<div class="background">
<div class="transbox">
<form name="form1"action="success" align="center">
<table align="center" width="350">
	<tr>
	<h2 id="head">请登录您的账号</h2>
	</tr>
	<tr>
		<td align="right">用户名</td> 
		<td><input type="text" name="用户"value=""></td>
	</tr>
	<tr>
		<td align="right">密码</td> 
		<td><input type="password" name="密码" value=""></td>
	</tr>
	<tr align="right">
	<tr align="center">
	<td><input type="reset" name="重置"></td>
		<td><input type="submit" name="提交" ></td>
	</tr>
</table>
</form>
</div>
</div>
<div id="footer">西安理工大学 © xaut.Library.cn</div>
</div>
</div>
</body>
</html>