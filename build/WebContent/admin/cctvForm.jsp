<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cctv.cctvDAO"%>
<%@ page import="cctv.cctvBean"%>
<%@ page import=" java.util.List"%>
<%@ page import=" java.util.ArrayList"%>
<%@ page import="java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bbs/custom.css">
<title>영상 리스트</title>
</head>

<style>
.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

#wrap {
	text-align: center;
}

div {
	float: left;
}
}
</style>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand">
			<p style="font-weight: bold">영상리스트</p>
		</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="../res/index.jsp">메인</a></li>

			<li><a href="../pro/LogoutPro.jsp">로그아웃</a></li>

		</ul>
	</div>
	</nav>

	<%
		int pageNumber = 1; //기본페이지
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
		}
		
	%>

	<div class="container">
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeee; text-align: center;">날짜</th>
							<th style="background-color: #eeeee; text-align: center;">주소</th>
						</tr>
					</thead>
					<tbody>
						<div class="container" id=wrap>
							<div class="row">
								<!-- 영상 리스트를 출력할 영역 -->
								<div
									class="MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 MuiGrid-grid-lg-4 css-1io53y1">
									<%
										cctvDAO cctv = new cctvDAO();
										ArrayList<cctvBean> list = cctv.getList(pageNumber);
										for (int i = 0; i < list.size(); i++) {
									%>
									<tr>
										<td><%=list.get(i).getId()%></td>
										<td><%=list.get(i).getCctvData()%></td>
										<td><a href="<%=list.get(i).getCctvFile()%>"
											target="_blank"><%=list.get(i).getCctvFile()%></a></td>
									</tr>
									<%
										}
									%>


								</div>
							</div>
						</div>
					</tbody>
				</table>
				<form name="p_search">
					<input type="button" value="검색" onclick="nwindow()" />
				</form>

			</div>
		</div>

		<div class=container style="text-align: center">
			<%
				cctvDAO cctvDAO2 = new cctvDAO();
				int pages = (int) Math.ceil(cctvDAO2.getCount() / 10) + 1;
				for (int i = 1; i <= pages; i++) {
			%>
			<button type="button"
				onclick="location.href='cctvForm.jsp?pageNumber=<%=i%>'"><%=i%></button>
			<%
				}
			%>
		</div>
	</div>

	<script>
		function nwindow() {
			window.name = "parant";
			var url = "search.jsp";
			var _width = '500';
			var _height = '200'
			window.open(url, "", "width=500,height=200,left=300");
		}
	</script>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>