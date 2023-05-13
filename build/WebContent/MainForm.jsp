<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String contentPage=request.getParameter("contentPage");
	if(contentPage==null)
		contentPage="FirstView.jsp";
%>
<html>
<head>
	<title>메인 화면</title>
	
	<style>
		/* 
		레이아웃 전체 가운데 정렬 태그  
		- margin:0 auto 0 auto;(시계방향으로 위, 오른쪽, 아래, 왼쪽)
		왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬이 된다. 
		
		전체를 감싸주는 태그 #wrap 
		*/
		#wrap {
			text-align: center;
		}
		
		#header {
			text-align: center;
			width: 800px;
			height: 150px;
			background-color: #92FFFF;
			padding: 60px 0px;
		}
		
		#main { //중앙
			float: left;
			width: 800px;
			height: 500px;
			background-color: #FFCA6C;
			text-align:center;
			vertical-align: middle;
		}
		#footer {
			clear: left;
			width: 800px;
			height: 60px;
			background-color: #7DFE74;
		}
	</style>
	
</head>
<body>

	<div id="wrap">
		<div>
			<jsp:include page="webHeader.jsp" />
		</div>
		<div >
			<jsp:include page="<%=contentPage%>" />
			<jsp:include page="mainmain.jsp" />
		</div>
		<div> 
		<jsp:include page="webFooter.jsp" />
		</div>
	</div>
	
</body>
</html>