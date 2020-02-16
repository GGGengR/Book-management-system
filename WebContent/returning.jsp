<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" import="java.util.Date" import="java.util.Calendar" import="java.text.SimpleDateFormat"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>归还结果</title>
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
添加结果>
<%
int ISBN=Integer.parseInt(request.getParameter("ISBN"));
try {
	Date d = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String datanow= df.format(d);
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/book?serverTimezone=GMT%2B8";
	String username="root";
	String password="0000";
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	String sql="update sort set sign=0,databack =? where ISBN =? and sign=1";
	PreparedStatement ps= conn.prepareStatement(sql);
	ps.setString(1,datanow);
	ps.setInt(2,ISBN);
	int row=ps.executeUpdate();
	if(row>0){
		out.print("归还成功！");
	}else{
		out.print("归还失败！");
	}
		ps.close();
		stmt.close();
		conn.close();
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