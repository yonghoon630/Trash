
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="test.MemberDAO"%>
<%@ page import="test.MemberBean"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="author" content="Bin Recorder">
<meta name="description" content="반응형 사이트 따라하기">
<meta name="keywords"
	content="반응형사이트, 웹퍼블리셔, 웹접근성, HTML5, Bin Recorder, webs">


<title>반응형 사이트 만들기 : 사이드 이펙트3</title>

<!-- style -->
<link rel="stylesheet" href="css/real.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/lightgallery.css">

<!-- Facebook meta tags -->
<meta property="og:type" content="article" />
<meta property="og:title" content="반응형 사이트 만들기(title)" />
<meta property="og:url"
	content="http://richclub8.dothome.co.kr/responsive/html5/index.html" />
<meta property="og:image"
	content="http://richclub8.dothome.co.kr/assets/ico/icon.png" />
<meta property="og:site_name" content="반응형 사이트 만들기(site_name)" />
<meta property="og:description" content="반응형 사이트 따라하기(description)" />

<!-- twitter meta tags -->
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:site" content="@Bin Recorder" />
<meta name="twitter:title" content="반응형 사이트 만들기(title)" />
<meta name="twitter:description" content="반응형 사이트 만들기(description)." />
<meta property="twitter:image"
	content="http://richclub8.dothome.co.kr/assets/ico/icon.png" />

<!-- 파비콘 -->
<link rel="shortcut icon" href="icon/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="icon/favicon-152.png">
<link rel="icon" href="path/to/favicon.png">
<link rel="icon" href="icon/favicon-16.png" sizes="16x16">
<link rel="icon" href="icon/favicon-32.png" sizes="32x32">
<link rel="icon" href="icon/favicon-48.png" sizes="48x48">
<link rel="icon" href="icon/favicon-64.png" sizes="64x64">
<link rel="icon" href="icon/favicon-128.png" sizes="128x128">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abel"
	rel="stylesheet">

<!-- HTLM5shiv ie6~8 -->
<!--[if lt IE 9]> 
         <script src="js/html5shiv.min.js"></script>
         <script type="text/javascript">
            alert("현재 당신이 보는 브라우저는 지원하지 않습니다. 최신 브라우저로 업데이트해주세요!");
         </script>
      <![endif]-->
<style>
<!--
table {
	margin: 0 auto;
	border: 2px solid #0099ff;
	border-collapse: collapse;
}

td, th {
	padding: 6px;
	border: 1px solid #0099ff;
}

th {
	background-color: #0099ff;
	color: #fff;
	font-weight: bold;
}
-->
</style>
</head>
<body>

	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header">
					<div class="header_tit">
						<h1>친환경 쓰레기통 빈레코더</h1>
						<br> <a href="http://webstoryboy.co.kr">www.capstonDesign.com</a>
					</div>
					<!-- //header_tit -->
					<div class="header_icon">
						<ul>
							<li><a href="#"><i class="fa fa-html5"
									aria-hidden="true"></i><span>HTML5</span></a></li>
							<li><a href="#"><i class="fa fa-github"
									aria-hidden="true"></i><span>GitHub</span></a></li>
							<li><a href="#" class="facebook"><i
									class="fa fa-facebook-square" aria-hidden="true"></i><span>Fackbook</span></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"
									aria-hidden="true"></i><span>twitter</span></a></li>
						</ul>
					</div>
					<!-- //header_icon -->
				</div>
			</div>
		</div>
		<script type="text/javascript">
         function checkValue() {
            inputForm = eval("document.loginInfo");
            if (!inputForm.id.value) {
               alert("아이디를 입력하세요");
               inputForm.id.focus();
               return false;
            }
            if (!inputForm.password.value) {
               alert("비밀번호를 입력하세요");
               inputForm.password.focus();
               return false;
            }
         }

         // 회원가입 버튼 클릭시 회원가입 화면으로 이동
         function goJoinForm() {
            location.href = "JoinForm.jsp";
         }
      </script>
	</header>
	<!-- //nav -->

	<main>
	<section id="contents">
		<div class="container">
			<h2 class="ir_su">반응형 사이트 컨텐츠</h2>
			<section id="cont_left">
				<h3 class="ir_su">메뉴 및 게시판 컨텐츠 영역</h3>
				<article class="column col1">
					<%
						if (session.getAttribute("sessionID") != null) {
					%>
					<h4 class="col_tit">Menu</h4>
					<%
						} else {
					%>
					<h4 class="col_tit">ID 로그인</h4>
					<%
						}
					%>
					<div class="menu">
						<ul>
							<%
								String s = session.getId();
								// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
								if (session.getAttribute("sessionID") == null) {
							%>

							<li><div id="wrap">
									<form name="loginInfo" method="post"
										action="../pro/LoginPro.jsp" onsubmit="return checkValue()">

										<table>
											<tr>
												<td bgcolor="skyblue">아이디</td>
												<td><input type="text" name="id" maxlength="50"></td>
											</tr>
											<tr>
												<td bgcolor="skyblue">비밀번호</td>
												<td><input type="password" name="password"
													maxlength="50"></td>
											</tr>
											<tr>
												<td colspan="2" style="width: 100%;"><input
													type="submit" value="로그인"
													style="width: 100%; padding: 10px;"></td>
											</tr>
										</table>
									</form>
									<%
										// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
											// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
											String msg = request.getParameter("msg");

											if (msg != null && msg.equals("0")) {
												out.println("<br>");
												out.println("<font color='red' size='2'>비밀번호를 확인해 주세요.</font>");
											} else if (msg != null && msg.equals("-1")) {
												out.println("<br>");
												out.println("<font color='red' size='2'>아이디를 확인해 주세요.</font>");
											}
									%>
								</div></li>
							<li><a href="../view/JoinForm.jsp">회원가입 <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<%
								} else {
							%>
							<li><a href="../pro/LogoutPro.jsp">로그아웃 <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="../view/UserInfoForm.jsp">내정보 <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="../bbs/bbs.jsp">공지사항 <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<%
								}
							%>

							<%
								// 관리자 로그인
								if (session.getAttribute("sessionID") != null && session.getAttribute("sessionID").equals("admin")) {
							%>
							<li><a href="../admin/AdminUserList.jsp">회원보기 <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="../admin/cctvForm.jsp">CCTV <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="../open/openForm.jsp">개폐기록 <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<%
								}
							%>

						</ul>
					</div>
					<!--//메뉴 -->
				</article>
				<!-- //col1 -->

				<article class="column col2">
					<h4 class="col_tit">Notice</h4>
					<p class="col_desc">공지사항을 꾸준히 확인해주세요</p>
					<!-- 게시판 -->
					<div class="notice1">
						<ul>
							<%
								int boardID = 0;
								if (request.getParameter("boardID") != null) {
									boardID = Integer.parseInt(request.getParameter("boardID"));
								}
								BbsDAO bbsDAO = new BbsDAO();
								ArrayList<Bbs> list = bbsDAO.getList(boardID, 1);
								for (int i = 0; i < 5; i++) {
							%>
							<%
								if (!list.isEmpty()) {
							%>
							<li><a
								href="../bbs/view.jsp?boardID=<%=boardID%>&bbsID=<%=list.get(i).getBbsID()%>">
									<%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
							</a></li>
							<%
								}
							%>

							<%
								}
							%>
						</ul>
						<a href="../bbs/bbs.jsp" class="more" title="더 보기">More <i
							class="fa fa-plus-circle" aria-hidden="true"></i></a>
					</div>
					<!--//게시판 -->
					<!-- 게시판2 -->

					<!--//게시판2 -->
				</article>
				<!-- //col2 -->

				<article class="column col3">
					<h4 class="col_tit">NEWS</h4>

					<!-- blog -->
					<div class="blog1">
						<h5 class="ir_su">Image1</h5>
						<figure>
							<a
								href="https://www.thereport.co.kr/news/articleView.html?idxno=34577"
								target='_blank'><img src="img/newsimg.jpg"
								class="img-normal" alt="normal image"></a>
							<a
								href="https://www.thereport.co.kr/news/articleView.html?idxno=34577"
								target='_blank'><p>
									<strong style="color: blue;">"쓰레기 버릴때 분리수거 철저"</strong>
								</p> <strong style="color: blue;">··· 종량제 봉투 뜯어 본다</strong> </a>
							<p></p>
							<p>배출된 생활폐기물에 재활용품이 혼입되는 등 반입 기준을 충족하지 못한 경우 동(洞)에 행정처분을 내린다.</p>
							<p>처분은 적발된 동에 1차 경고를 하고,</p>
							<p>1차 경고 후에도 적발된 동에는 3일 이상 반입정지 처분을 내린다.</p>
							<p>반입정지 처분을 받은 지역은 생활폐기물 수집 운반 대행업체의 생활폐기물 수거가 중단된다.</p>
						</figure>
					</div>
					<!--//blog -->

				</article>
				<!-- //col3 -->
			</section>
			<!-- //cont_left -->

			<section id="cont_center">
				<h3 class="ir_su">반응형 사이트 가운데 컨텐츠</h3>
				<article class="column col4">
					<h4 class="col_tit">Slick Slider</h4>
					<p class="col_desc">slick.js를 이용한 이미지 슬라이드 효과입니다.</p>
					<!-- 이미지 슬라이드 -->
					<div class="slider">
						<div>
							<figure>
								<img src="img/slider001.jpg" alt="이미지1">
								<figcaption>
									<em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지
										슬라이드 입니다.</span>
								</figcaption>
							</figure>
						</div>
						<div>
							<figure>
								<img src="img/slider001.jpg" alt="이미지2">
								<figcaption>
									<em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지
										슬라이드 입니다.</span>
								</figcaption>
							</figure>
						</div>
						<div>
							<figure>
								<img src="img/slider001.jpg" alt="이미지3">
								<figcaption>
									<em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지
										슬라이드 입니다.</span>
								</figcaption>
							</figure>
						</div>
					</div>
					<!--//이미지 슬라이드 -->
				</article>
				<!-- //col4 -->


				<!-- //col5 -->

				<article class="column col6">
					<h4 class="col_tit">실제사례</h4>
					<!-- video -->
					<!-- <video autoplay="autoplay" controls="controls" loop="loop">
                        <source src="img/video.mp4" type="video/mp4">
                     </video> -->
					<div class="video">
						<iframe src="https://www.youtube.com/embed/jdqwBnP1SY0"
							frameborder="0"
							allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<!--//video -->
				</article>
				<!-- //col6 -->
			</section>
			<!-- //cont_center -->

			<section id="cont_right">
				<h3 class="ir_su">반응형 사이트 오른쪽 컨텐츠</h3>
				<article class="column col7">
					<%
						String name = null;
						if (session.getAttribute("sessionID") != null) {
							String id = session.getAttribute("sessionID").toString();
							// 세션에 저장된 아이디를 가져와서
							// 그 아이디 해당하는 회원정보를 가져온다.
							MemberDAO dao = MemberDAO.getInstance();
							MemberBean memberBean = dao.getUserInfo(id);
							name = memberBean.getName() + "님 환영합니다";
						} else {
							name = "로그인 하십시오";
						}
					%>
					<h4 class="col_tit"><%=name%></h4>
					<p class="col_desc">수정 및 삭제는 메뉴를 이용하세요</p>
					<!-- side2 -->
					<div class="side2">
						<%
							String name2 = null;
							if (session.getAttribute("sessionID") != null) {
								String id = session.getAttribute("sessionID").toString();
								// 세션에 저장된 아이디를 가져와서
								// 그 아이디 해당하는 회원정보를 가져온다.
								MemberDAO dao = MemberDAO.getInstance();
								MemberBean memberBean = dao.getUserInfo(id);
						%>
						<table>
							<tr>
								<td id="title">아이디</td>
								<td><%=memberBean.getId()%></td>
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
						</table>
						<%
							}
						%>

					</div>
					<!-- side2//-->
				</article>
				<!-- //col8 -->


			</section>
			<!-- //cont_right -->
		</div>
	</section>
	<!-- //contents --> </main>

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="footer">
					<ul>
						<li><a href="#">사이트 도움말</a></li>
						<li><a href="#">사이트 이용약관</a></li>
						<li><a href="#">사이트 운영원칙</a></li>
						<li><a href="#"><strong>개인정보취급방침</strong></a></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="#">게시중단요청서비스</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					<address>
						Copyright &copy; <a href="http://webstoryboy.co.kr"><strong>Bin
								Recorder</strong></a> All Rights Reserved.
					</address>
				</div>
			</div>
		</div>
	</footer>
	<!-- //footer -->

	<!-- JavaScript Libraries -->
	<script src="js/jquery.min_1.12.4.js"></script>
	<script src="js/modernizr-custom.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/lightgallery.min.js"></script>
	<script>
      //접기/펼치기
      $(".btn").click(function(e) {
         e.preventDefault();
         $(".nav").slideToggle();
         $(".btn").toggleClass("open");
         //var btn = $(".btn").find(">i").attr("class");
         //alert(btn);

         if ($(".btn").hasClass("open")) {
            //open이 있을 때
            $(".btn").find(">i").attr("class", "fa fa-angle-up");
         } else {
            //open이 없을 때
            $(".btn").find(">i").attr("class", "fa fa-angle-down");
         }
      });

      $(window).resize(function() {
         var wWidth = $(window).width();
         if (wWidth > 600) {
            $(".nav").removeAttr("style");
         }
      });

      //라이트 박스
      $(".lightbox").lightGallery({
         thumbnail : true,
         autoplay : true,
         pause : 3000,
         progressBar : true
      });

      //이미지 슬라이더
      $(".slider").slick({
         dots : true,
         autoplay : true,
         autoplaySpeed : 3000,
         arrows : true,
         responsive : [ {
            breakpoint : 768,
            settings : {
               autoplay : false,
            }
         } ]
      });

      //sns 공유하기
      $(".facebook")
            .click(
                  function(e) {
                     e.preventDefault();
                     window
                           .open(
                                 'https://www.facebook.com/sharer/sharer.php?u='
                                       + encodeURIComponent(document.URL)
                                       + '&t='
                                       + encodeURIComponent(document.title),
                                 'facebooksharedialog',
                                 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=300, width=600');
                  });
      $(".twitter")
            .click(
                  function(e) {
                     e.preventDefault();
                     window
                           .open(
                                 'https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20'
                                       + encodeURIComponent(document.URL)
                                       + '%20-%20'
                                       + encodeURIComponent(document.title),
                                 'twittersharedialog',
                                 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=300, width=600');
                  });
   </script>
</body>
</html>

<script>
	function showLoginForm() {
		var loginForm = document.createElement("iframe");
		loginForm.src = "../view/LoginForm.jsp";
		loginForm.style.position = "fixed";
		loginForm.style.top = "0";
		loginForm.style.left = "0";
		loginForm.style.width = "100%";
		loginForm.style.height = "100%";
		loginForm.style.border = "none";
		loginForm.style.backgroundColor = "rgba(0, 0, 0, 0.5)";
		document.body.appendChild(loginForm);
	}
	//-->
</
