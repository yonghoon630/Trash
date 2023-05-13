<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<!-- 번역 해주냐는 알림이 뜨는 이유 -->
<head>
<title>My Web</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="js/myscript.js"></script>
<style>
</style>
</head>
<body>

	<!-- 메인카테고리 시작 -->
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=request.getContextPath()%>">HOME</a>
				<!-- 원래 홈으로 돌아가기 위해서 index.jsp / myweb 불러오는 것을 명령어로 바꿔줌 -->
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<!-- 공통페이지로 빼도 됨, 어차피 변하는 것은 중간의 First Container 이기 때문에 -->
					

					<%
						String s = session.getId();
						// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
						if (session.getAttribute("sessionID") == null) {
						
					%>
					<li><a href="view/LoginForm.jsp">로그인</a></li>
					<li><a href="view/JoinForm.jsp">회원가입</a></li>

					<%
						} else {
					%>
					<li><a href="pro/LogoutPro.jsp">로그아웃</a></li>
					<li><a href="view/UserInfoForm.jsp">내정보</a></li>
					<li><a href="bbs/bbs.jsp">공지사항</a></li>
					<%
						}
					%>

					<%
						// 관리자 로그인
						if (session.getAttribute("sessionID") != null && session.getAttribute("sessionID").equals("admin")) {
					%>
					<li><a href="admin/AdminMain.jsp">회원보기</a></li>
					<li><a href="admin/cctvForm.jsp">CCTV</a></li>
					<%
						}
					%>

				</ul>
			</div>
		</div>
	</nav>
	<!-- 메인카테고리 끝 -->