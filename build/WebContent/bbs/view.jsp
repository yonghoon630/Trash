<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet" href="../css/bbs/custom.css">

<title>맛집 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("sessionID") != null){
			userID = (String) session.getAttribute("sessionID");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('유효하지 않은 글입니다.')");
	 		script.println("location href = 'login.jsp'");
	 		script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" >
				<p style="font-weight: bold">공지사항</p>
			</a>
		</div>
		
	</nav>
	<div class="container">
		<div class="col-lg-5">
		<div class="container">
			<table class="table table-haver" style="border: 1px solid #dddddd">
					
					
					<%
					if (boardID == 2){%>
					<tr>
						<td colspan="6" align="left" bgcolor="beige">&nbsp;&nbsp;[제목]&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<%} %>	
					<tr>
						<td colspan="3" align="left">&nbsp;&nbsp;<%= bbs.getUserID() %></td>
						<td colspan="3" align="right"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" +  bbs.getBbsDate().substring(14,16) + "분"  %></td>
					</tr>
					<% 	
					String real = "C:/bbsUpload";
					File viewFile = new File(real+"\\"+bbsID+"사진.jpg");
					if(viewFile.exists()){
				%>
					<tr>
						<td colspan="6"><br><br><img src = "bbsUpload/<%=bbsID %>사진.jpg" border="300px" width="300px" height="300px"><br><br>
					<% }
					else {%><td colspan="6"><br><br><%} %>
						<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%><br><br></td>
					
					<%
						
					%>
					<td colspan="6" align="center">	<a href="bbs.jsp?boardID=<%=boardID %>" class="btn-primary" >목록</a>
					<%
						if(userID != null && userID.equals(bbs.getUserID())){
					%>
							<a href = "update.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "../bbsAct/deleteAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID %>" class="btn-primary">삭제</a>
					</td>
					</tr>
					<% } %>
			</table>		
		</div>
		
		
		</div>
	</div>
	<script type="text/javascript">
	function nwindow(boardID,bbsID,commentID){
		window.name = "commentParant";
		var url= "commentUpdate.jsp?boardID="+boardID+"&bbsID="+bbsID+"&commentID="+commentID;
		window.open(url,"","width=600,height=230,left=300");
	}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>