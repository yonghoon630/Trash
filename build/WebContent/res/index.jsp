
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
 <!-- real.css 참조 -->
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
	</header>
	<!-- //nav -->

	<!-- //title -->

	<main>
	<section id="contents">
		<div class="container">
			<h2 class="ir_su">반응형 사이트 컨텐츠</h2>
			<section id="cont_left">
				<h3 class="ir_su">메뉴 및 게시판 컨텐츠 영역</h3>
				<article class="column col1">
					<h4 class="col_tit">Menu</h4>
					<!-- 메뉴 -->
					<div class="menu">
						<ul>

							<%
								String s = session.getId();
								// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
								if (session.getAttribute("sessionID") == null) {
							%>
							<li><a href="../view/LoginForm.jsp">로그인 <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
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
							<li><a href="../admin/AdminMain.jsp">회원보기 <i
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
							<li><a
								href="../bbs/view.jsp?boardID=<%=boardID%>&bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></li>
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
					<h4 class="col_tit">Blog</h4>
					<p class="col_desc">해상도에 따라 이미지를 다르게 표현하는 방법입니다.</p>
					<!-- blog -->
					<div class="blog1">
						<h5 class="ir_su">Image1</h5>
						<figure>
							<img src="img/blog4_@1.jpg" class="img-normal" alt="normal image">
							<img src="img/blog4_@2.jpg" class="img-retina" alt="retina image">
							<figcaption>반응형 웹 사이트 이미지 글입니다. 반응형 웹 사이트 이미지 글입니다.
								반응형 웹 사이트 이미지 글입니다. 반응형 웹 사이트 이미지 글입니다.</figcaption>
						</figure>
					</div>
					<!--//blog -->
					<!-- blog2 -->
					<div class="blog2 mt15">
						<div class="img-retina">
							<h5>Image2</h5>
						</div>
						<p>반응형 웹 사이트 이미지 글입니다. 반응형 웹 사이트 이미지 글입니다. 반응형 웹 사이트 이미지 글입니다.</p>
					</div>
					<!--//blog2 -->
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
					<h4 class="col_tit">Video</h4>
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

					<h4 class="col_tit">환영합니다.</h4>

				</article>
				<!-- //col7 -->

				<article class="column col8">
					<h4 class="col_tit"></h4>
					
					<!-- side2 -->
					<div class="side2">
						<figure class="front">
							<img src="img/side2.jpg" alt="이미지2">
							<figcaption>
								<h3>Hover Effect</h3>
							</figcaption>
						</figure>
						<figure class="back">
							<img src="img/side4.jpg" alt="이미지2">
							<figcaption>
								<h3>Hover Effect</h3>
							</figcaption>
						</figure>
					</div>
					<!-- side2//-->
				</article>
				<!-- //col8 -->

				<article class="column col9">
					<h4 class="col_tit">Effect3</h4>
					<p class="col_desc">CSS3의 transform을 이용한 마우스 오버효과입니다.</p>
					<!-- side3 -->
					<div class="side3">
						<figure>
							<img src="img/side3.jpg" alt="이미지3">
							<figcaption>
								<h3>
									Hover<em>Effect</em>
								</h3>
							</figcaption>
						</figure>
					</div>
					<!-- side3//-->
				</article>
				<!-- //col9 -->
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


