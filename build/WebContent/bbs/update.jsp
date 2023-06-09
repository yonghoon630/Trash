<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet" href="../css/bbs/custom.css">

<title>공지사항</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("sessionID") != null){
			userID = (String) session.getAttribute("sessionID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('로그인을 하세요')");
	 		script.println("location href = 'login.jsp'");
	 		script.println("</script>");
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
		if (!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('권한이 없습니다.')");
	 		script.println("location href = 'bbs.jsp'");
	 		script.println("</script>");
		}
	%>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">
				<p style="font-weight: bold">공지사항</p>
			</a>
		</div>
		
	</nav>
	<!-- 게시판 --> 
	<div class="container">
		<div class="row">
			<form method="post" encType = "multipart/form-data"  action="../bbsAct/updateAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">글수정 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>" ></td>
						</tr>
					<%if(boardID==1){ %>
						<tr>
							<td><input type="text" class="form-control" placeholder="주소" name="map" maxlength="50" value="<%=bbs.getMap()%>"></td>
						</tr>
					<%} %>						
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;" ><%= bbs.getBbsContent() %></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="fileName"></td>
						</tr>
					</tbody>
				</table>	
				<button type="submit" class="btn btn-primary pull-right" >글수정</button>
			</form>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>