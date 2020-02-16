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

import com.book.book.Book;

/**
 * Servlet implementation class looking
 */
@WebServlet("/looking")
public class looking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public looking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String style=request.getParameter("style");
		String Bname=request.getParameter("bname");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/book?serverTimezone=GMT%2B8";
			String username="root";
			String password="0000";
			Connection conn=DriverManager.getConnection(url,username,password);
			Statement stmt=conn.createStatement();
			String sql="";
			if(style.equals("a")) {
				sql="select * from book where Bname=? and bookCount=1 group by press";
			}
			if(style.equals("b")) {
				sql="select * from book where ISBN=?";
			}
			if(style.equals("c")) {
				sql="select * from book where press=? and bookCount=1 group by Bname";
			}
			if(style.equals("d")) {
				sql="select * from book where author=? and bookCount=1 group by Bname";
			}
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, Bname);
			ResultSet rs=ps.executeQuery();
			List<Book> list=new ArrayList<Book>();
			while(rs.next()) {
				Book book=new Book();
				book.setBname(rs.getString("Bname"));
				book.setISBN(rs.getString("ISBN"));
				book.setBookCount(rs.getString("bookCount"));
				book.setNum(rs.getString("num"));//索书号
				book.setAuthor(rs.getString("author"));
				book.setPress(rs.getString("press"));//出版社
				book.setRname(rs.getString("Rname"));//存放位置
				list.add(book);
			}
			request.setAttribute("list", list);
			rs.close();
			stmt.close();
			conn.close();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			}catch(SQLException e){
			e.printStackTrace();
			}
		request.getRequestDispatcher("looking.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
}
