<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.book.book.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书借阅信息</title>
</head>
<body>
<div id="Container">
<div id="header"> 	
	<nav>
		<ul>
			<li><a href="mindex.jsp">管理员主菜单</a></li>
			<li><a href="register.jsp">新用户注册</a></li>
			<li><a href="muser">用户管理</a></li>
			<li><a href="book-add.jsp">图书添加</a></li>
			<li><a href="bookdelete">图书删除</a></li>
			<li><a href="m-info.jsp">图书借阅信息</a></li>
		</ul>
	</nav>
	<div id="use"><a href="login.jsp">管理员登陆</a></div>
</div>
<div class="book">
<div class="background">
<div class="transbox">
<form name="form1" action="minfo" align="center">
<table align="center" width="450">
		<h3>查询方式</h3>
		<tr  height="200">
		<td><input type="radio" name="style"value="a">图书名称</td>
		<td><input type="radio" name="style"value="b">ISBN</td>
		<td><input type="radio" name="style"value="d">作者</td>
		<td><input type="radio" name="style"value="c">出版社</td>
		<td><input type="radio" name="style"value="e">读者ID</td>
	</tr>
	<tr><a href="minfoall">查询全部</a></tr>
	<tr align="center">
		<td align="center"><input type="text" name="bname"></td>
		<td align="center"><input type="submit" name="查询" value="查询"></td>
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