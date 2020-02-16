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
 * Servlet implementation class minfo
 */
@WebServlet("/minfo")
public class minfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public minfo() {
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
				sql="select id,Bname,sort.ISBN,dataout,datain,databack,sign from book,sort where Bname=? and book.ISBN=sort.ISBN";
			}
			if(style.equals("b")) {
				sql="select id,Bname,sort.ISBN,dataout,datain,databack,sign from book,sort where sort.ISBN=? and book.ISBN=sort.ISBN";
			}
			if(style.equals("c")) {
				sql="select id,Bname,sort.ISBN,dataout,datain,databack,sign from book,sort where press=? and book.ISBN=sort.ISBN";
			}
			if(style.equals("d")) {
				sql="select id,Bname,sort.ISBN,dataout,datain,databack,sign from book,sort where author=? and book.ISBN=sort.ISBN";
			}
			if(style.equals("e")) {
				sql="select id,Bname,sort.ISBN,dataout,datain,databack,sign from book,sort where id=? and book.ISBN=sort.ISBN";
			}
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, Bname);
			ResultSet rs=ps.executeQuery();
			List<Info> list=new ArrayList<Info>();
			while(rs.next()){
			Info info=new Info();
			info.setId(rs.getString("id"));
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
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			}catch(SQLException e){
			e.printStackTrace();
			}
		request.getRequestDispatcher("m-infoing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
