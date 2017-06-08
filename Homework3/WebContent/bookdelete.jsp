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
				<li><a href="#">매출관리</a></li>
			</ul>
		</div>
		
		<br>
		<br>
		<hr>
		
			
		
	<!----------------------------- 상단 고정메뉴 --------------------------------------------------------->
		
		<table border=1>
			<tr>
				<th>이름</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>등록일자</th>
				<th>개수</th>
				<th>삭제</th>
			</tr>
				
			
			<tr>
			<%
			Connection conn = null;                                        
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			
			
			try{
				String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
				String _id = "tester";                                     
				String _pw = "abc123";                                     
                                            
			
				Class.forName("com.mysql.jdbc.Driver");                       
				conn=DriverManager.getConnection(url,_id,_pw);              
			
			
				String sql = "select * from Book";                        
			
				pstmt = conn.prepareStatement(sql);                         
				rs = pstmt.executeQuery();                                        
			
				while(rs.next()){                                                 
					String rname = rs.getString("name");
					String rauthor = rs.getString("author");
					String rpublish = rs.getString("publish");
					String rdate= rs.getString("_date");
					String rcount = rs.getString("_count");
					String rprice = rs.getString("price");
				
									
	%>
		
			
				<td><%=rname %></td>
				<td><%=rauthor %></td>
				<td><%=rpublish %></td>
				<td><%=rprice %></td>
				<td><%=rdate %></td>
				<td><%=rcount %></td>
			    <td><a href="bookDeleteProc.jsp?name='<%=rname%>'">삭제</a></td>	
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