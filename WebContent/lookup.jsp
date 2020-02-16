<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书查询</title>
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
<form name="form1"action="looking" align="center">
<table align="center" width="400">
	<tr height="200">
		<td  align="left"><h3>查询方式</h3></td> </tr>
		<tr>
		<td><input type="radio" name="style"value="a">图书名称</td>
		<td><input type="radio" name="style"value="b">ISBN</td>
		<td><input type="radio" name="style"value="d">作者</td>
		<td><input type="radio" name="style"value="c">出版社</td>
	</tr>
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