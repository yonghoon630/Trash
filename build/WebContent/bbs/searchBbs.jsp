<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bbs/custom.css">

<title>맛집 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; //기본페이지
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		String search = null;
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="bbs.jsp">
				<p style="font-weight: bold">공지사항</p>
			</a>
		</div>

	</nav>
	<div class="container">

		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
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
							ArrayList<Bbs> list = bbsDAO.searchList(boardID, pageNumber, search);
							for (int i = 0; i < list.size(); i++) {
								System.out.println(list.get(i));
						%>
						<tr>
							<td><%=list.get(i).getBbsID()%></td>
							<td><a
								href="view.jsp?boardID=<%=boardID%>&bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<form name="p_search">
					<input type="button" value="검색" onclick="nwindow(<%=boardID%>)" />
				</form>
				<a href="write.jsp?boardID=<%=boardID%>"
					class="btn-primary pull-right">글쓰기</a>

				<div class=container style="text-align: center">
					<%
						BbsDAO bbsDAO1 = new BbsDAO();
						System.out.println(bbsDAO1.getCount(search));
						int pages = (int) Math.ceil(bbsDAO1.getCount(search) / 10) + 1;

						for (int i = 1; i <= pages; i++) {
					%>
					<button type="button"
						onclick="location.href='searchBbs.jsp?boardID=<%=boardID%>&pageNumber=<%=i%>&search=<%=search%>'"><%=i%></button>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<script>
	function nwindow(boardID){
		window.name = "parant";
		var url= "search.jsp?boardID="+boardID;
		window.open(url,"","width=250,height=200,left=300");
	}
</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>