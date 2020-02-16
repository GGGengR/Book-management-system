package com.book.book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.book.Info;
/**
 * Servlet implementation class infoing
 */
@WebServlet("/infoing")
public class infoing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infoing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pwd=request.getParameter("password");
		String id=request.getParameter("id");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/book?serverTimezone=GMT%2B8";
			String username="root";
			String password="0000";
			Connection conn=DriverManager.getConnection(url,username,password);
			Statement stmt1=conn.createStatement();
			String sql1="select * from user,type where user.type=type.type AND id =?";
			PreparedStatement ps1= conn.prepareStatement(sql1);
			ps1.setString(1, id);
			ResultSet rs1=ps1.executeQuery();
			rs1.next();
		String passwd=rs1.getString("password");
		rs1.close();
		ps1.close();
		stmt1.close();
		if(pwd.equals(passwd)) {
			Statement stmt=conn.createStatement();
			String sql="select Bname,book.ISBN,dataout,datain,databack from sort,book where id=? and sort.ISBN=book.ISBN";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			List<Info> list=new ArrayList<Info>();
			while(rs.next()){
			Info info=new Info();
			info.setBname(rs.getString("Bname"));
			info.setISBN(rs.getInt("ISBN"));
			info.setDataback(rs.getString("databack"));
			info.setDatain(rs.getString("datain"));
			info.setDataout(rs.getString("dataout"));
			list.add(info);
			}
			request.setAttribute("list", list);
			rs.close();
			stmt.close();
			conn.close();
		}else {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		}catch(ClassNotFoundException e){
		e.printStackTrace();
		}catch(SQLException e){
		e.printStackTrace();
		}
		request.getRequestDispatcher("infoing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
