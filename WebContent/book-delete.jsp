<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.book.book.*" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理</title>
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
<form name="form1" align="center">
<table align="center" width=80%>
	<tr>
		<td align="center" colspan="6" width=80% height=30px>
			<h3>查询结果</h2>
		</td>
	</tr>
	</tr>
	<tr align="center">
	<td><b>书名</b></td>
	<td><b>作者</b></td>
	<td><b>出版社</b></td>
	<td><b>索书号</b></td>
	<td><b>ISBN</b></td>
	<td><b>价格</b></td>
	<td><b>在馆数量</b></td>
	<td><b>存放位置</b></td>
	<td><b>删除</b></td>
	</tr>
<% 	
List<book1> list1=(List<book1>)request.getAttribute("list");
if(list1==null||list1.size()<1){
	%>
	<tr align="center"><td>暂无库存</td></tr><%
}else {
	for(book1 book:list1){
		%>
		<tr align="center"><td><%=book.getBname() %></td><td><%=book.getAuthor() %></td><td><%=book.getPress()%></td>
		<td><%=book.getNum() %></td><td><%=book.getIsbn()%></td><td><%=book.getPrice()%></td>
		<td><%=book.getBookCount()%></td><td><%=book.getRname()%></td>
		<td><a href="bookdeleting?isbn=<%=book.getIsbn() %>">删除</a></td>
			<%
	}
}
%>
</table>
</form>
</div>
</div>
<div id="footer">西安理工大学 © xaut.Library.cn</div>
</div>
</div>
</body>
</html>