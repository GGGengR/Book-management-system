<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.book.book.*" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的信息</title>
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
	<td><b>ISBN</b></td>
	<td><b>借出日期</b></td>
	<td><b>应还日期</b></td>
	<td><b>还书日期</b></td>
	</tr>
<% 	
List<Info> list1=(List<Info>)request.getAttribute("list");
if(list1==null||list1.size()<1){
	%>
	<tr align="center"><td>暂无库存</td></tr><%
}else {
	for(Info info:list1){
		%>
		<tr align="center"><td><%=info.getBname() %></td><td><%=info.getISBN() %></td><td><%=info.getDataout()%></td><td><%=info.getDatain() %></td>
		<td><%=info.getDataback() %></td></tr>
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