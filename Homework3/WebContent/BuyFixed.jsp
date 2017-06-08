<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>


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
	
	
	<%
	String point = (String)session.getAttribute("point");
	
	%>
	
	<script type = "text/javascript">
	
	
	</script>
	
	
	</head>
	<body>
	<!-- jsp시작 -->
	<%
// 세션처리
//HttpSession sess = request.getSession(true);
String s_id = (String)session.getAttribute("id_ing");  
String s_pw= (String)session.getAttribute("pw_ing");
// 세션끝

	String orderarray = request.getParameter("namearray");
	String totalPrice = request.getParameter("totalPrice");
	int totalCount = Integer.parseInt(request.getParameter("totalCount"));
	String minusPrice = request.getParameter("minusPrice");
	
	
	Date nows= new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String ndate = sdf.format(nows);
	   		
	
	int tprice = Integer.parseInt(totalPrice);
	int mprice = Integer.parseInt(minusPrice);
	
	int lastPrice = tprice-mprice;

%>

<!-- jsp끝 -->
	
	
	
	
		<h1><a href="mainForuser.jsp">KWBOOK</a></h1>
		<br>
<%=s_id %>
<br>
<br>
<%=s_pw %>
<br>

		<div id="navimenu">
			<ul>
				<li><a href="Basket.jsp">장바구니</a></li>
				<li><a href="orderList.jsp">주문정보</a></li>
				
			</ul>
		</div>
		<br>
		<hr>
		

			
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
	  
		
		     
	
		 String sql= "INSERT INTO DBHW3.Order (user_id, book_name, book_count, total_price, _date) values ('" + s_id + "', '" + orderarray + "', " + totalCount + ", " + lastPrice + ", '" + ndate + "')" ;
		 pstmt = conn.prepareStatement(sql); 
		
	
		
		 
	 	pstmt.executeUpdate(sql); 
      
		String t = "UPDATE DBHW3.User SET mileage=(mileage - "+ minusPrice +") where _id='" +s_id + "'";
		 
   		pstmt.executeUpdate(t);    
		
   		String j = "UPDATE DBHW3.User SET mileage=(mileage + "+ lastPrice*0.1 +") where _id='" +s_id + "'";
		 
   		pstmt.executeUpdate(j);    
   		
   		
	
		}catch(Exception e){                                                  
			e.printStackTrace();
			}finally{
				if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}          
				if(conn != null) try{conn.close();}catch(SQLException sqle){}            
		}
	
	%>
	
	정상적으로 주문이 이루어졌습니다.
	<br>
	<%=totalCount %>
	<br>
	<%=orderarray %>
	<br>
	<%=totalPrice%>
	<br>
	<%=ndate %>
	<br>
	<%=s_id%>
	<br>
	<%=minusPrice %>
	
	<br>
	<br>
	<br>
	<%=lastPrice %>
	
	
	</body>
</html>