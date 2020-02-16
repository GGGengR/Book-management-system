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

import com.book.book.*;

/**
 * Servlet implementation class muser
 */
@WebServlet("/muser")
public class muser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public muser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/book?serverTimezone=GMT%2B8";
			String username="root";
			String password="0000";
			Connection conn=DriverManager.getConnection(url,username,password);
			Statement stmt=conn.createStatement();
			String sql="select * from user,type where user.type=type.type";
			ResultSet rs=stmt.executeQuery(sql);
			List<Reader> list=new ArrayList<Reader>();
			while(rs.next()) {
				Reader user=new Reader();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setType(rs.getString("type"));
				user.setGrade(rs.getString("grade"));
				user.setSign(rs.getDouble("sign"));
				list.add(user);
			}
			request.setAttribute("list",list);
		}catch(ClassNotFoundException e){
		e.printStackTrace();
		}catch(SQLException e){
		e.printStackTrace();
		}
		request.getRequestDispatcher("m-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
