<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="test.MemberDAO"%>
<%@ page import="test.MemberBean"%>

<html>
<head>
<title>현재 유저정보 출력화면</title>

<style type="text/css">
input[type="button"] {
	text-align: center;
	background-color: #0099ff;
	color: #fff;
	border: none;
	padding: 8px 16px;
	cursor: pointer;
	border-radius: 4px;
}

}
input[type="button"]:hover {
	background-color: #0066cc;
}

table {
	margin: 0 auto;
	border: 2px solid #0099ff;
	border-collapse: collapse;
}

td, th {
	padding: 8px;
	border: 1px solid #0099ff;
}

th {
	background-color: #0099ff;
	color: #fff;
	font-weight: bold;
}

#title {
	background-color: skyblue
}
</style>

<script type="text/javascript">
	function changeForm(val) {
		if (val == "-1") {
			location.href = "../res/index.jsp";
		} else if (val == "0") {
			location.href = "ModifyForm.jsp";
		} else if (val == "1") {
			location.href = "DeleteForm.jsp";
		}
	}
</script>

</head>
<body>
	<%
		String id = session.getAttribute("sessionID").toString();

		// 세션에 저장된 아이디를 가져와서
		// 그 아이디 해당하는 회원정보를 가져온다.
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean memberBean = dao.getUserInfo(id);
	%>

	<br>
	<br>
	<b><font size="6" color="gray">내 정보</font></b>
	<br>
	<br>
	<br>
	<!-- 가져온 회원정보를 출력한다. -->
	<table>
		<tr>
			<td id="title">아이디</td>
			<td><%=memberBean.getId()%></td>
		</tr>

		<tr>
			<td id="title">비밀번호</td>
			<td><%=memberBean.getPassword()%></td>
		</tr>

		<tr>
			<td id="title">이름</td>
			<td><%=memberBean.getName()%></td>
		</tr>

		<tr>
			<td id="title">성별</td>
			<td><%=memberBean.getGender()%></td>
		</tr>

		<tr>
			<td id="title">생일</td>
			<td><%=memberBean.getBirthyy()%>년 <%=memberBean.getBirthmm()%>월
				<%=memberBean.getBirthdd()%>일</td>
		</tr>

		<tr>
			<td id="title">이메일</td>
			<td><%=memberBean.getMail1()%>@ <%=memberBean.getMail2()%></td>
		</tr>

		<tr>
			<td id="title">휴대전화</td>
			<td><%=memberBean.getPhone()%></td>
		</tr>
		<tr>
			<td id="title">주소</td>
			<td><%=memberBean.getAddress()%></td>
		</tr>
		<tr>
			<td><input type="button" value="뒤로" onclick="changeForm(-1)"></td>
			<td><input type="button" value="회원정보 변경" onclick="changeForm(0)">
				<input type="button" value="회원탈퇴" onclick="changeForm(1)">
			</td>
		</tr>
	</table>

	<br>
</body>
</html>
