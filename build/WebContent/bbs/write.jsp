<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet" href="../css/bbs/custom.css">
<script type="text/javascript">
	function goPopup(){
		var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadAddrPart1){
		document.form.map.value = roadAddrPart1;
	}
</script>
<title>공지사항</title>
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
			<a class="navbar-brand" href="main.jsp">
				<p style="font-weight: bold">공지사항</p>
			</a>
		</div>
		
	</nav>
	<div class="container">
		<div class="row">
		<form name = "form" method="post" encType = "multipart/form-data" action="../bbsAct/writeAction.jsp?boardID=<%=boardID%>&keyValue=multipart">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="5" style="background-color: #eeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5" ><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>					
						<tr>
							<td colspan="5" ><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="5" ><input type="file" name="fileName"></td>
						</tr>
					</tbody>
				</table>
					<input type="submit" class="btn-primary pull-right" value="글쓰기">
		</form>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
</body>
</html>