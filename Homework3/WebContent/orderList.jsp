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
int totalPrice = 0;
int totalCount = 0;
String namearray = " ";   

%>

<!-- jsp끝 -->
	
	
	
	
		<h1><a href="mainForuser.jsp">KWBOOK</a></h1>
		<br>
<%=s_id %>
<br>
<br>
<%=s_pw %>
<br>

<%=point %>

		<div id="navimenu">
			<ul>
				<li><a href="Basket.jsp">장바구니</a></li>
				<li><a href="orderList.jsp">주문정보</a></li>
				
			</ul>
		</div>
		<br>
		<hr>
		

		<table border=1>
			<tr>
				<th>주문자</th>
				<th>책이름</th>
				<th>가격</th>
				<th>수량</th>
				<th>날짜</th>
			</tr>
			
<%
	
		Class.forName("com.mysql.jdbc.Driver");                   
		Connection conn = null;          
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
			String id = "tester";                                     
			String pw = "abc123";                                     

		conn=DriverManager.getConnection(url,id,pw);              
	                
		
		String sql= "select * from DBHW3.Order where user_id = '"+ s_id +"'"; 
		pstmt = conn.prepareStatement(sql); 
		   		
   		
   		rs = pstmt.executeQuery();                                        
		
   		
   		
   		
		while(rs.next()){                 
			String rid = rs.getString("user_id");
			String rbookname = rs.getString("book_name");
			int rbookcount = rs.getInt("book_count");
			int rprice = rs.getInt("total_price");
			String rdate = rs.getString("_date");
	
			
%>

			<tr>
			

			
			
				<td><%=rid %></td>
				<td><%=rbookname %></td>
				<td><%=rprice %></td>
				<td><%=rbookcount%></td>
				<td><%=rdate %></td>
			</tr>
			
				<%
	}
		}catch(Exception e){                                                  
			e.printStackTrace();
			}finally{
				if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}          
				if(conn != null) try{conn.close();}catch(SQLException sqle){}            
		}
	
	%>
	</table>




	</body>
</html>