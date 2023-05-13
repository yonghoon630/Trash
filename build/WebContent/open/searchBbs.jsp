<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="cctv.cctvDAO"%>
<%@ page import="cctv.cctvBean"%>
<%@ page import=" java.util.*"%>
<%@ page import="java.lang.String"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bbs/custom.css">

<title>영상리스트</title>
</head>
<body>
	<%
		
		int pageNumber = 1; //기본페이지
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
		}
		 int Id = 0;
			if (request.getParameter("Id") != null){
				Id = Integer.parseInt(request.getParameter("Id"));
			}
			
		String search = null;
		if(request.getParameter("search") != null){
			search = request.getParameter("search");
			
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
			<a class="navbar-brand" href="cctvForm.jsp">
				<p style="font-weight: bold">영상리스트</p>
			</a>
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
							<th style="background-color: #eeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							cctvDAO cctvDAO1 = new cctvDAO();
							ArrayList<cctvBean> list = cctvDAO1.searchList(pageNumber,search);
							for(int i=0; i<list.size(); i++){
						%>
						<tr>
							<td><%= list.get(i).getId() %></td>							
							<td><%= list.get(i).getCctvData() %></td>
							<td><a href="<%=list.get(i).getCctvFile()%>"
											target="_blank"><%=list.get(i).getCctvFile()%></a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<form name = "p_search">
					<input type="button" value="검색" onclick="nwindow()"/>
				</form>				
				<div class=container style="text-align: center">
					<%
						cctvDAO da = new cctvDAO();

						int pages = (int) Math.ceil(da.getCount(search) / 10) + 1;
						for (int i = 1; i <= pages; i++) {
					%>
							<button type="button"
							onclick="location.href='searchBbs.jsp?pageNumber=<%=i%>&search=<%=search%>'"><%=i%></button>
					<%	}	%>
				</div>
			</div>
		</div>
	</div>
	<script>
	function nwindow(){
		window.name = "parant";
		var url= "search.jsp";
		window.open(url,"","width=250,height=200,left=300");
	}
</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>