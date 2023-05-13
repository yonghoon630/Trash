<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <title>가을여행 (인트로)</title>
  <style>
   table{
            margin-left:auto; 
            margin-right:auto;
        }
   section > div {width: auto;height: 370px;font: bold 30px/300px "Helvetica";background: black;color: black;text-align: center;}
   @-webkit-keyframes myani {
    from {color: rgba(0, 0, 0, 0);text-shadow: 0 -15px 30px rgba(255, 255, 255, 0);} 
    50% {color: rgba(0, 0, 0, 1);text-shadow: 0 0px 5px rgba(255, 255, 0, 1);}
    to {color: rgba(0, 0, 0, 0);text-shadow: 0 15px 30px rgba(255, 255, 255, 0);}
   }
    .ani {
     -webkit-animation-name: myani;
     -webkit-animation-delay: 1s;
     -webkit-animation-duration: 4s;
     -webkit-animation-iteration-count: infinite;
     -webkit-animation-timing-function: ease;
     -webkit-animation-direction: alternate; }
   footer p {padding:20px;}
   footer{clear:both;width: 830px;margin-bottom:0;background-color:#333;color:white;text-align:center;}    
  </style>
 </head>
 <body>
  <div id="container">
   <header>
    <h1>캡스톤디자인 6조 사이트</h1>

	<table>
  <tr>
    <th><div style="width: 100px; height: 50px; margin: auto; text-align: center; line-height: 50px; background-color: #50bcdf; border-radius: 20%;">캔</div></th>
	<th><div style="width: 70px; height: 50px;"></div></th></th>
    <th><div style="width: 100px; height: 50px; margin: auto; text-align: center; line-height: 50px; background-color: #50bcdf; border-radius: 20%;">플라스틱</div></th>

  </tr>
  <tr>
	<th><div style="width: 120px; height: 200px; text-align: center; line-height: 50px; border-radius: 20%; border: 2px solid black;">0%</div></th>
	<th></th>
	<th><div style="width: 120px; height: 200px; text-align: center; line-height: 50px; border-radius: 20%; border: 2px solid black;">0%</div></th>
  </tr>
  <tr>
	<th><button type="button" style="width: 100px; height: 50px;" onclick=" alert('버튼이 클릭되었습니다.')">개폐</button></th>
	<th></th>
	<th><button type="button" style="width: 100px; height: 50px;" onclick=" alert('버튼이 클릭되었습니다.')">개폐</button></th>
</table>
   </header>
  </div>
 	<button type="button" style="width: 100px; height: 50px; float: right; background-color: #ff0000;" onclick=" alert('버튼이 클릭되었습니다.')">신고</button>
  
 </body>
</html>
