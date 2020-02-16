<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.book.book.*" import="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加结果</title>
</head>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="book" class="com.book.book.book1"></jsp:useBean>
<jsp:setProperty property="*" name="book"/>
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
添加结果>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/book?serverTimezone=GMT%2B8";
		String username="root";
		String password="0000";
		Connection conn=DriverManager.getConnection(url,username,password);
		String sql="insert into book(Bname,press,author,ISBN,num,price,bookCount,Rname)values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, book.getBname());
		ps.setString(2,book.getPress());
		ps.setString(3,book.getAuthor());
		ps.setString(4,book.getIsbn());
		ps.setString(5,book.getNum());
		ps.setString(6,book.getPrice());
		ps.setInt(7,1);
		ps.setString(8,book.getRname());
		int row=ps.executeUpdate();
		ps.close();
		conn.close();
		if(row >0){
			out.print("添加成功");
		}
		}catch(Exception e){
		out.print("注册失败！"+e);
		}
%>
</div>
</div>
<div id="footer">西安理工大学 © xaut.Library.cn</div>
</div>
</div>
</body>
</html>