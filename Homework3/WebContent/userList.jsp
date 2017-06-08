<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>회원정보</title>
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


	<table border=1>
		<tr>
			<th>이름</th>
			<th>ID</th>
			<th>번호</th>
			<th>주소</th>
			<th>마일리지</th>
			<th>주문정보</th>
		</tr>
		<tr>
		
		
		<%
		
		
			
		Class.forName("com.mysql.jdbc.Driver");                   
		Connection conn = null;          
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
			String _id = "tester";                                     
			String _pw = "abc123";                                     

		conn=DriverManager.getConnection(url,_id,_pw);              
		out.println("제대로 연결되었습니다.");                        

		

   		 String sql= "select * from User" ; 
   		pstmt = conn.prepareStatement(sql); 
   		
   		
   		rs = pstmt.executeQuery();                                        
		
		while(rs.next()){                                                 
			String name = rs.getString("name");
			String rid = rs.getString("_id");
			String phone = rs.getString("phone");
			String address = rs.getString("address");
			String mileage = rs.getString("mileage");
		
		
		
%>  
		
			<td><%=name %></td>
			<td><%=rid %></td>
			<td><%=phone %></td>
			<td><%=address %></td>
			<td><%=mileage %></td>
			<td><a href="">주문정보</a></td>
		
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


