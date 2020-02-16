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

/**
 * Servlet implementation class bookdelete
 */
@WebServlet("/bookdelete")
public class bookdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookdelete() {
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
			String sql="select * from book";
			ResultSet rs=stmt.executeQuery(sql);
			List<book1> list=new ArrayList<book1>();
			while(rs.next()) {
				book1 book=new book1();
				book.setBname(rs.getString("Bname"));
				book.setAuthor(rs.getString("author"));
				book.setBookCount(rs.getString("bookCount"));
				book.setIsbn(rs.getString("ISBN"));
				book.setNum(rs.getString("num"));
				book.setPress(rs.getString("press"));
				book.setPrice(rs.getString("price"));
				book.setRname(rs.getString("Rname"));
				list.add(book);
			}
			request.setAttribute("list",list);
		}catch(ClassNotFoundException e){
		e.printStackTrace();
		}catch(SQLException e){
		e.printStackTrace();
		}
		request.getRequestDispatcher("book-delete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
