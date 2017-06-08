<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
	<head>
	<title>updatebook</title>
	<link rel="stylesheet" href="./css/normalize.css">
	<style type="text/css">	

	fieldset{
		width:16em;
		padding:1em;
		border:2px groove;
		margin:15em auto;
	}
	</style>



	<script type="javascript">
	
	</script>
	</head>
	<body>
	
		<%
			//세션시작
			//HttpSession sess = request.getSession(true);
			String id = (String)session.getAttribute("id_ing");  
			String pw= (String)session.getAttribute("pw_ing");
			// 세션끝
			
			//DB connection 시작

		Date nows= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(nows);
		
									
	%>
	
	
<!----------------------------- 상단 고정메뉴 --------------------------------------------------------->
		<h1><a href="mainForadmin.jsp">관리자 페이지</a></h1>
		<br>
<%=id %>
<br>
<br>
<%=pw %>
<br>
<%=date %>
<br>
<br>
<a href="logout.jsp">러그아우</a>
		<div id="navimenu">
			<ul>
				<li><a href="#">도서관리</a>
					<ul>
						<li><a href="bookUpdate.jsp">등록</a></li>
						<li><a href="bookdelete.jsp">삭제</a></li>
					</ul>
				</li>
				<li><a href="#">회원관리</a>
					<ul>
						<li><a href="userList.jsp">회원목록</a></li>
						<li><a href="orderList.jsp">주문정보</a></li>
					</ul>
				</li>
				<li><a href="#">매출관리</a></li>
			</ul>
		</div>
		
		
	<!----------------------------- 상단 고정메뉴 --------------------------------------------------------->
		
	<fieldset>
		<legend>도서등록</legend>
		<form action="bookUpdateProc.jsp" method="post">

			<p>책이름 : <input type="text" name="bookname" id="bookname"><br></p>
			<p>저자 : <input type="text" name="author" id="author"><br></p>
			<p>출판사 : <input type="text" name="publish" id="publish"><br></p>
			<p>가격 : <input type="text" name="price" id="price"><br></p>
			<p>개수 :  
				<select name="count">
		    		<option value="1">1</option>
				    <option value="2">2</option>
				    <option value="3">3</option>
				    <option value="4">4</option>
		  		</select>
		  <br></p>
			
			<p><input type="submit" value="등록"></p>
		</form>	
	</fieldset>

	<p id="result">
	</p>
	
	</body>
</html>