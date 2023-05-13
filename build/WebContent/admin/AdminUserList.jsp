<!-- /* AdminUserList.jsp */  -->

<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<%@ page import="test.MemberDAO"%>
<%@ page import="test.MemberBean"%>
<%@ page import=" java.util.List"%>
<%@ page import=" java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="../css/bbs/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bbs/custom.css">

<title>회원관리</title>
</head>
<body>
	<%-- 입력된 값을 추출한다. --%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">
				<p style="font-weight: bold">회원관리</p>
			</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
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
							<th style="background-color: #eeeee; text-align: center;">아이디</th>
							<th style="background-color: #eeeee; text-align: center;">비밀번호</th>
							<th style="background-color: #eeeee; text-align: center;">이름</th>
							<th style="background-color: #eeeee; text-align: center;">성별</th>
							<th style="background-color: #eeeee; text-align: center;">생년월일</th>
							<th style="background-color: #eeeee; text-align: center;">이메일</th>
							<th style="background-color: #eeeee; text-align: center;">전화</th>
							<th style="background-color: #eeeee; text-align: center;">주소</th>
						</tr>
					</thead>
					<tbody>
					
						<%							
								MemberDAO member1 = new MemberDAO();
								ArrayList<MemberBean> list = member1.getList(pageNumber);
								System.out.println(list.size()+"reaa");
								for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getId()%></td>
							<td><%=list.get(i).getPassword()%></td>
							<td><%=list.get(i).getName()%></td>
							<td><%=list.get(i).getGender()%></td>
							<td><%=list.get(i).getBirthyy()%></td>
							<td><%=list.get(i).getMail1()%></td>
							<td><%=list.get(i).getPhone()%></td>
							<td><%=list.get(i).getAddress()%></td>
							<td><input type="button" value="삭제"
								onClick="location.href='AdminUserDel.jsp?ID=<%=list.get(i).getId()%>'"></td>
							<td><input type="button" value="수정"
								onClick="location.href='AdminModForm.jsp?ID=<%=list.get(i).getId()%>'"></td>

						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
		<div class=container style="text-align: center">
			<%
				MemberDAO member = new MemberDAO();
					int pages = (int) Math.ceil(member.getCount() / 10) + 1;
					for (int i = 1; i <= pages; i++) {					
			%>
			<button type="button"
				onclick="location.href='AdminUserList.jsp?pageNumber=<%=i%>'"><%=i%></button>
			<%
				}
			%>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

