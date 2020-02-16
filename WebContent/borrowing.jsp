<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.book.book.*" import="java.sql.*"  import="java.util.Calendar"
import="java.util.Date" import="java.text.SimpleDateFormat"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<title>借阅结果</title>
</head>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.book.book.Reader"></jsp:useBean>
<jsp:useBean id="book" class="com.book.book.Book"></jsp:useBean>
<jsp:setProperty property="id" name="user"/>
<jsp:setProperty property="password" name="user"/>
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
添加结果>
<%
String pwd=user.getPassword();
String id=user.getId();
int ISBN=Integer.parseInt(request.getParameter("ISBN"));
try {
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/book?serverTimezone=GMT%2B8";
	String username="root";
	String password="0000";
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	String sql="select password,date from user,type where id=? and user.type=type.type";
	PreparedStatement ps= conn.prepareStatement(sql);
	ps.setString(1, id);
	ResultSet rs=ps.executeQuery();
	rs.next();
String passwd=rs.getString("password");
int date=rs.getInt("date");
if(pwd.equals(passwd)) {
	Statement stmt1=conn.createStatement();
	String sql1="select bookCount from book where ISBN=?";
	PreparedStatement ps1= conn.prepareStatement(sql1);
	ps1.setInt(1,ISBN);
	ResultSet rs1=ps1.executeQuery();
	rs1.next();
		book.setBookCount(rs1.getString("bookCount"));
		int count=book.getBookCount();
		if(count==0) {
			out.print("暂无库存");
		}else {
			Date d = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dataout= df.format(d);//借出日期
			Calendar c= Calendar.getInstance();
		    c.setTime(d);
		    c.add(Calendar.DATE, +date);
		    Date d1 = c.getTime();
		    String datain = df.format(d1);//应还日期
			Statement stmt2=conn.createStatement();
			String sql2="insert into sort(id,ISBN,dataout,datain,sign)values(?,?,?,?,?)";
			PreparedStatement ps2= conn.prepareStatement(sql2);
			ps2.setString(1,id);
			ps2.setInt(2,ISBN);
			ps2.setString(3,dataout);
			ps2.setString(4,datain);
			ps2.setInt(5, 1);
			int row=ps2.executeUpdate();
			if(row >0){
				out.print("借阅成功");
			}else{
				out.print("借阅失败");
			}
			ps2.close();
			stmt2.close();
		}
		rs1.close();
		ps1.close();
		stmt1.close();
		rs.close();
		ps.close();
		stmt.close();
		conn.close();
}else {
	request.getRequestDispatcher("error.jsp").forward(request, response);
}
}catch(Exception e) {
	e.printStackTrace();
}
%>
</div>
</div>
<div id="footer">西安理工大学 © xaut.Library.cn</div>
</div>
</div>
</body>
</html>