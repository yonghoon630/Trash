<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cctv.cctvDAO"%>
<%@ page import="cctv.cctvBean"%>
<%@ page import=" java.util.List"%>
<%@ page import=" java.util.ArrayList"%>
<%@ page import="java.lang.String"%>
<%@ page import="open.openDAO"%>
<%@ page import="open.openBean"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>



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
			<p style="font-weight: bold">개폐기록</p>
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
							<th style="background-color: #eeeee; text-align: center;">no</th>
							<th style="background-color: #eeeee; text-align: center;">아이디</th>
							<th style="background-color: #eeeee; text-align: center;">쓰레기통
								이름</th>
							<th style="background-color: #eeeee; text-align: center;">시간</th>
						</tr>
					</thead>
					<tbody>
						<div class="container" id=wrap>
							<div class="row">
								<!-- 영상 리스트를 출력할 영역 -->
								<div
									class="MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 MuiGrid-grid-lg-4 css-1io53y1">
									<%
										openDAO open = new openDAO();
										ArrayList<openBean> list = open.getList(pageNumber);
										for (int i = 0; i < list.size(); i++) {
											LocalDateTime dateTime = list.get(i).getOpenTime().toLocalDateTime();
											DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
											String sr = dateTime.format(formatter);
											
											LocalDate date = dateTime.toLocalDate();  // LocalDate 객체를 얻어옴
										    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
										    String dateStr = date.format(formatter2);  // 년월일 값을 String으로 변환
										    // dateStr은 "2022-02-20"과 같은 형식
											// timestamp 값을 가져옴
											Timestamp timestamp = list.get(i).getOpenTime();
									%>
									<tr>
										<td><%=list.get(i).getIdx()%></td>
										<td><%=list.get(i).getId()%></td>
										<td><%=list.get(i).getTrashCanId()%></td>
										<%
												Connection conn = null;
												PreparedStatement pstmt = null;
												ResultSet rs = null;

												try {
													Class.forName("com.mysql.jdbc.Driver");
													conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/micom", "root", "root");													
													String Sql = "SELECT cctv_file FROM cctv_data WHERE date(cctv_data) = ?"; // cctv DB에서 해당 날짜의 데이터를 조회하는 쿼리
													pstmt = conn.prepareStatement(Sql);
													pstmt.setString(1, dateStr); // 비교할 날짜를 지정합니다. 이 부분은 개폐기록에서 가져와야 합니다.

													rs = pstmt.executeQuery();

													while (rs.next()) {
														String cctvFile = rs.getString("cctv_file");
										%>
										<td><a
											<% if (rs==null) %>
											href="<%=cctvFile%>&t=<%=list.get(i).getOpenTime().getHours()%>h<%=list.get(i).getOpenTime().getMinutes()%>m<%=list.get(i).getOpenTime().getSeconds()%>s"
											target="_blank"> <%=sr%>
											
										</a></td>
										<%
											}

												} catch (Exception e) {
													e.printStackTrace();
												}
										%>
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
				openDAO openDAO2 = new openDAO();
				int pages = (int) Math.ceil(openDAO2.getCount() / 10) + 1;
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