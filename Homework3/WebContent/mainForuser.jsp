<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<title>어서오세요 KWBOOK입니다.</title>
	<link rel="stylesheet" href="./css/normalize.css">
	<style type="text/css">
		div#navimenu li{
			float:left;
			margin-right:10px;
			list-style:none;
		}
	</style>


	
	</head>
	<body>
	<!-- jsp시작 -->
	<%
// 세션처리
//HttpSession sess = request.getSession(true);
String id = (String)session.getAttribute("id_ing");  
String pw= (String)session.getAttribute("pw_ing");
String point = (String)session.getAttribute("point");
// 세션끝

%>
<!-- jsp끝 -->
	
	
	
	
		
		<h1><a href="mainForadmin.jsp">KWBOOK</a></h1>
		<br>
<%=id %>
<br>
<br>
<%=pw %>
<br>
포인트 : <%=point %>

		<div id="navimenu">
			<ul>
				<li><a href="Basket.jsp">장바구니</a></li>
				<li><a href="orderList.jsp">주문정보</a></li>
				
			</ul>
		</div>
		<br>
		<hr>
		<form action="searchResult.jsp" method="post">
			<select name="opt">
		    		<option value="1">도서이름</option>
				    <option value="2">저자</option>
				    <option value="3">출판사</option>
			</select>
		       <input type="text" name="keyword" width=30>
   			   <input type="submit" value="검색">
		</form>

	
	</body>
</html>