<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.book.book.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书</title>
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
<form name="form1"action="book-adding.jsp" align="center">
<table align="center" width="350">
	<tr>
	<h2 id="head">请输入图书的信息</h2>
	</tr>
	<tr>
		<td align="right">书名</td> 
		<td><input type="text" name="bname" ></td>
	</tr>
	<tr>
		<td align="right">作者</td> 
		<td><input type="text" name="author" ></td>
	</tr>
	<tr>
		<td align="right">出版社</td> 
		<td><input type="text" name="press" ></td>
	</tr>
	<tr>
		<td align="right">ISBN</td> 
		<td><input type="text" name="isbn"></td>
	</tr>
	<tr>
		<td align="right">索书号</td> 
		<td><input type="text" name="num"  ></td>
	</tr>
	<tr>
		<td align="right">数量</td> 
		<td><input type="text" name="bookCount" ></td>
	</tr>
	<tr>
		<td align="right">存放地址</td> 
		<td><input type="text" name="rname" ></td>
	</tr>
	<tr>
		<td align="right">价格</td> 
		<td><input type="text" name=price value=""></td>
	</tr>
	<tr align="center">
	<td><input type="reset" name="重置"></td>
		<td ><input type="submit" name="提交" ></td>
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