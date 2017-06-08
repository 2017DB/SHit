<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
	<head>
	<title>관리자 페이지입니다.</title>
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
<!-- jsp끝 -->
	
	

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
				<li><a href="account.jsp">매출관리</a></li>
			</ul>
		</div>
		
		<br>
		<br>
		<hr>
		
			
		
	<!----------------------------- 상단 고정메뉴 --------------------------------------------------------->
		
		<br>
		<br>
		<hr>
		<form action="searchAdmin.jsp" method="post">
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