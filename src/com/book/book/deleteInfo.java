package com.book.book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteInfo
 */
@WebServlet("/deleteInfo")
public class deleteInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=(String)(request.getParameter("id"));
		String ISBN=(String)(request.getParameter("ISBN"));
		String dataout=(String)(request.getParameter("dataout"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/book?serverTimezone=GMT%2B8";
			String username="root";
			String password="0000";
			Connection conn=DriverManager.getConnection(url,username,password);
			Statement stmt=conn.createStatement();
			String sql="delete from sort where id=? and ISBN=? and dataout=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, ISBN);
			ps.setString(3, dataout);
			ps.executeUpdate();
			ps.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		response.sendRedirect("m-info.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
