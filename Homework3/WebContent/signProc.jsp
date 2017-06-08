<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>로그인 중</title>
	</head>
	<body>

		<%
		
		String name = request.getParameter("username");
		String id = request.getParameter("userid");
		String password = request.getParameter("userpw");
		String phone = request.getParameter("userphone");
		String address = request.getParameter("useraddress");
		

		Class.forName("com.mysql.jdbc.Driver");                   
		Connection conn = null;          
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
			String _id = "tester";                                     
			String pw = "abc123";     
	
			

		conn=DriverManager.getConnection(url,_id,pw);              
	

  		 String sql= "insert into User (_id, password, name, phone, address, mileage) values('" + id + "','" + password + "','" + name + "','" + phone + "','" + address + "',0)" ; 
  		pstmt = conn.prepareStatement(sql); 
		 pstmt.executeUpdate(sql); 

 	
  		 
 		}catch(Exception e){                                                  
 		e.printStackTrace();
 		}finally{
 			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}          
 			if(conn != null) try{conn.close();}catch(SQLException sqle){}            


 		}

		 
		pageContext.forward("login.jsp");

 			
		
 %>  
		
  
	</body>

</html>


