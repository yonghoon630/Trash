<!-- /* AdminUserList.jsp */  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
    <%
	  request.setCharacterEncoding("utf-8");
	  // id passwd name가져오기
	  String id = request.getParameter("id");
	  String password = request.getParameter("password");
	  String name = request.getParameter("name");
	  String gender = request.getParameter("gender");
	  String mail = request.getParameter("mail");
	  String phone = request.getParameter("phone");
	  String address = request.getParameter("address");
	  
	    //객체참조변수 선언    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	  
	   // 1단계 드라이버로더
	   Class.forName("com.mysql.jdbc.Driver");
	   
	// 2단계 디비연결
	   String DB_URL = "jdbc:mysql://localhost:3306/micom?characterEncoding=UTF-8&serverTimezone=UTC";
	   String DB_USER = "root";
	   String DB_PASSWORD= "root";
	   conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	   String sql = "UPDATE jsp_member SET password=?, name=?, gender=?, mail=?, phone=?, address=? WHERE ID=?";
	   pstmt = conn.prepareStatement(sql);

	   pstmt.setString(1, password);
	   pstmt.setString(2, name);
	   pstmt.setString(3, gender);
	   pstmt.setString(4, mail);
	   pstmt.setString(5, phone);
	   pstmt.setString(6, address);
	   pstmt.setString(7, id);
	
		int result = pstmt.executeUpdate();

		System.out.println(result + "<-- result");
 
		pstmt.close();
		conn.close(); 
		
 		response.sendRedirect("AdminUserList.jsp");
%>
 