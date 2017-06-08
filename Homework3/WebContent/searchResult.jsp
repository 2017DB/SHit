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
	
	
String s_id = (String)session.getAttribute("id_ing");  
String s_pw= (String)session.getAttribute("pw_ing");
String point = (String)session.getAttribute("point");
// 세션끝

	
		Class.forName("com.mysql.jdbc.Driver");                   
		Connection conn = null;          
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
			String id = "tester";                                     
			String pw = "abc123";                                     

		conn=DriverManager.getConnection(url,id,pw);              
	                      
		
		String opt = request.getParameter("opt");
		String keyword = request.getParameter("keyword");
		
		if(opt.equals("1")){
			String sql= "select * from Book where name='" + keyword + "'"; 
			pstmt = conn.prepareStatement(sql); 
		}else if(opt.equals("2")){
			String sql= "select * from Book where author='" + keyword + "'";
			pstmt = conn.prepareStatement(sql); 
		}else if(opt.equals("3")){
			String sql= "select * from Book where publish='" + keyword +"'";
			pstmt = conn.prepareStatement(sql); 
		}
		

   		 
   		
   		
   		
   		rs = pstmt.executeQuery();                                        
		
		while(rs.next()){                 
			int rid = rs.getInt("_id");
			String rbookname = rs.getString("name");
			String rauthor = rs.getString("author");
			String rpublish = rs.getString("publish");
			int rprice = rs.getInt("price");
			int rcount = rs.getInt("_count");
	
%>
<!-- jsp끝 -->
	
	
	
	
		<h1>KWBOOK</h1>
		<br>
<%=s_id %>
<br>
<br>
<%=s_pw %>
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

		<table border=1>
			<tr>
				<th>식별번호</th>
				<th>이름</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>수량</th>
				<th>주문하기</th>
			</tr>
			<tr>
				<td><%=rid %></td>
				<td><%=rbookname %></td>
				<td><%=rauthor %></td>
				<td><%=rpublish %></td>
				<td><%=rprice %></td>
				<td><%=rcount %></td>
				<td><a href="insertToBasketProc.jsp?rid=<%=rid%>&rprice=<%=rprice%>&rbookname=<%=rbookname %>">주문하기</a></td>
			
			</tr>
	</table>
		
	<%
	}
		}catch(Exception e){                                                  
			e.printStackTrace();
			}finally{
				if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}          
				if(conn != null) try{conn.close();}catch(SQLException sqle){}            
		}
	
	%>
	</body>
</html>