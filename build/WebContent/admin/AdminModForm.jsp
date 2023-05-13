	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.sql.*" %>
    
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<html>
<head>
<meta charset="utf-8">
<title>회원수정</title>
</head>
<body>
    <% request.setCharacterEncoding("utf-8"); 
//회원정보페이지에서 수정버튼 클릭시 보내진 id값 받기    
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("ID");
//객체참조변수 선언    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
//DB 드라이버 로딩    
    Class.forName("com.mysql.jdbc.Driver");
//DB 연결, 객체생성    
    conn = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/micom?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root");
//쿼리문 준비    
    pstmt = conn.prepareStatement("SELECT id,password,name,gender,mail,phone,address FROM jsp_member WHERE ID=?");
    pstmt.setString(1, id);
//쿼리문 실행    
    rs = pstmt.executeQuery();
//결과값 사용    
    rs.next();
%>       
<h1>회원정보수정</h1>
	<form action="AdminModPro.jsp" method="post">
		id <input type="text" name="id" value=<%=rs.getString("id")%> readonly><br>
		패스워드 변경 <input type="password" name="password" value=<%=rs.getString("password")%>><br>
		이   름  변  경 <input type="text" name="name" value=<%=rs.getString("name")%>><br>
		성   별  변  경 <input type="text" name="gender" value=<%=rs.getString("gender")%>><br>
		이 메 일 변 경 <input type="text" name="mail" value=<%=rs.getString("mail")%>><br>
		연 락 처 변 경 <input type="text" name="phone" value=<%=rs.getString("phone")%>><br>
		주   소  변  경 <input type="text" name="address" value=<%=rs.getString("address")%>><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>