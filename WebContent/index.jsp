<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书管理系统</title>

        
</head>
<body>
 
    <div  style="width:100%">
     
    <div style="background-color:#4196E1;text-align:center;height:100px;padding: 20px;">
    <h1 style="margin-top:20px;font-size: 60px;font-family:Arial,Helvetica,sans-serif;">图书借还系统
    <div id="use" style="color: #ffffff;position:relative;float:right;font-size:15px;padding:15px;"><a href="login.jsp">管理员登陆</a></div></h1>
    </div>
    <div  style="background-color:#B0C4DE;height:500px;width:30%;float:left;">
    <h1 align="center"style="font-family:Arial,Helvetica,sans-serif;">菜单</h1>
    <ul style="list-style-type:square;">
       <a href="lookup.jsp" ><h2 align="left"style="padding-bottom:10px;padding-top:20px;"><li>查询图书</li></h2></a>
       <a href="borrow.jsp"><h2 align="left"style="padding-bottom:10px;"><li>借阅图书</li></h2></a>
       <a href="return.jsp"><h2 align="left"style="padding-bottom:10px;"><li>归还图书</li></h2></a>
       <a href="info.jsp"><h2 align="left"style="padding-bottom:10px;"><li>借阅历史查询</li></h2></a>
    </ul>
    </div>
</div>  
    <div style="background-color:#4196E1;clear:both;text-align:center;height:60px;padding: 20px;">
            <h4 style="margin-bottom:0;">西安理工大学 © xaut.448.com</h4>
    </div>
    </body>
</html>