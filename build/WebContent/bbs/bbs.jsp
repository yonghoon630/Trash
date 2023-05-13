<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bbs/custom.css">

<title>공지사항</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; //기본페이지
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
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
			<a class="navbar-brand" >
				<p style="font-weight: bold">공지사항</p>
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="../res/index.jsp">메인</a></li>
				
				<li><a href="../pro/LogoutPro.jsp">로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">	   
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(boardID, pageNumber);
							for(int i=0; i<list.size(); i++){	
								
						%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="view.jsp?boardID=<%=boardID%>&bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<form name = "p_search">
					<input type="button" value="검색" onclick="nwindow(<%=boardID%>)"/>
				</form>				
				<% if(session.getAttribute("sessionID")!=null && session.getAttribute("sessionID").equals("admin")){%>
				<a href="write.jsp?boardID=<%=boardID%>" class="btn-primary pull-right">글쓰기</a>
				<%} %>
			</div>
		</div>
		<div class=container style="text-align:center">
			<%
				BbsDAO bbsDAO1 = new BbsDAO();
				int pages = (int) Math.ceil(bbsDAO1.getCount(boardID)/10)+1;
				for(int i=1; i<=pages; i++){ %>
					<button type="button" onclick="location.href='bbs.jsp?boardID=<%=boardID %>&pageNumber=<%=i %>'"><%=i %></button>
				<%} %>
		</div>
	</div>
	
	<script>
	function nwindow(boardID){
		window.name = "parant";
		var url= "search.jsp?boardID="+boardID;
		var _width = '500';
		var _height = '200'
		window.open(url,"","width=500,height=200,left=300");
	}
</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>