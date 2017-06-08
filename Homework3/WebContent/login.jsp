<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>KW BOOK - 로그인</title>
		<link href="./asset/css/common.css" rel="stylesheet">
		
		<style type=text/css>
		@charset "utf-8";


/* [S] reset */
body {overflow-x:hidden;}
* {
	margin: 0px;
	padding: 0px;
	font-family: 'Nanum Gothic';
	font-style: normal;
}
img {
	border: 0;
	vertical-align: middle;
}
li {list-style: none}
a {text-decoration: none}
a, html, button, input, textarea {
	color: #777;
	font-family: 'Nanum Gothic', dotum;
	font-size: 13px;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.004);
}
iframe {border: 0;}
a:hover {text-decoration: underline;}
em {font-style: normal;}
button, label, input[type="submit"], input[type="image"], input[type="button"] {
	border: 0;
	cursor: pointer
}
input[type="checkbox"],
input[type="radio"] {vertical-align: middle}
.hidden {display: none;}
/* [E] reset */

/* [S] header */
header {
	width: 100%;
	height: 150px;
	padding-top: 30px;
}
header > div {
	position: relative;
	width: 1100px;
	margin: 0 auto;
}
nav a:hover {text-decoration: none}
nav > ul {
	position: absolute;
	top: 98px;
	left: 300px;
}
nav > ul > li {
	position: relative;
	float: left;
	margin-left: 55px;
}
nav > ul > li:first-child {margin: 0;}
nav > ul > li > a {
	display: block;
	text-indent: -999em;
	font-size: 0;
}

/*로그인*/
#joinArea, 
#loginArea {
	background: #f1f1f1;
}
#joinArea header,
#loginArea header {
	height: 5px;
	padding: 0;
	background: #ff5c3c;
	border: 0;
}
#joinArea h1,
#loginArea h1 {display: none;}
#joinArea h2,
#loginArea h2 {
	padding: 20px;
	background: #4c4743;
	color: #fff;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	text-align: center;
	font-size: 12px;
}
#joinArea section,
#loginArea section {
	width: 430px;
	margin: 100px auto 0;
	border-radius: 3px;
	background: #fff;
}
#joinArea section > article > div, 
#loginArea section > article > div {
	padding: 40px 80px;
	width: 280px;
	min-height: 150px;
}
#joinArea p,
#loginArea p {
	text-align: center;
	margin-bottom: 10px;
}
#joinArea input[type="text"], 
#joinArea input[type="password"],
#loginArea input[type="text"], 
#loginArea input[type="password"] {
	width: calc(100% - 40px);
	height: 35px;
	padding: 0 5px;
	padding-left: 35px;
	margin-bottom: 5px;
	border: 0;
	line-height: 35px;
}
#joinArea input[type="text"], 
#joinArea input[type="password"] {
	padding: 0 10px;
	background: #f2f2f2;
	width: calc(100% - 20px);
}
#loginArea input[type="text"] {
	background: url("../img/user.png") #f2f2f2 no-repeat 8px center;
}
#loginArea input[type="password"] {
	background: url("../img/key.png") #f2f2f2 no-repeat 10px center;
}
.colorBtn, 
#joinArea input[type="submit"],
#loginArea input[type="submit"] {
	width: 100%;
	height: 35px;
	background: #ff5c3c;
	border: 1px solid #fa4b28;
	border-radius: 2px;
	color: #fff;
	line-height: 35px;
}
#joinArea footer,
#loginArea footer {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 30px 0;
	background: #fff
}
.colorBtn {
	height: 45px;
	line-height: 45px;
}


footer > div {
	width: auto;
	height: auto;
	padding: 130px 20px 10px;
	background-position: center 10px;
	text-align: center;
}
footer, 
footer a {font-size: 13px;}

}
		
		</style>
	</head>
	<body id="loginArea">
		<header>
			<h1>KW BOOK 광운서점</h1>
		</header>
		<section>
			<article>
				<h2>MEMBER LOGIN</h2>
				<div>
					<form action="loginProc.jsp" method="post">
						<input type="text" name="input_id" id="userId" placeholder="아이디" title="아이디">
						<input type="password" name="input_pw" id="userPw" placeholder="비밀번호" title="비밀번호">
						<input type="submit" id="submit" value="Log In">
					</form>
				</div>
			</article>
		</section>
		<footer>
			<p>Copyright (c) 광운서점. All rights reserved</p>
		</footer>
	</body>
</html>