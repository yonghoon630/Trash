<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- 자바빈 클래스 import --%>      
<%@ page import="test.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="test.MemberDAO" %> 
    
<html>
<head>
    <title>회원정보 수정처리</title>
</head>
<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="test.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%
        // 세션에서 아이디를 가져와 MemberBean에 세팅한다.
        String id= (String)session.getAttribute("sessionID"); 
        memberBean.setId(id);
    
        // 수정할 회원정보를 담고있는 MemberBean을 DAO로 전달하여 회원정보 수정을 한다.
        MemberDAO dao = MemberDAO.getInstance();
        dao.updateMember(memberBean);
    %>
    
    <br><br>
    <font size="5" color="gray">회원정보가 수정되었습니다.</font>
    <br><br>
    <input type="button" value="메인으로" onclick="javascript:window.location='../res/index.jsp'"/>
    
</body>
</html>