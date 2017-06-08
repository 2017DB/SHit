<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>업데이트 중</title>
	</head>
	<body>
		<%
			
		
		String bookname = request.getParameter("name");
		
		Class.forName("com.mysql.jdbc.Driver");                   
		Connection conn = null;          
		PreparedStatement pstmt = null;
		try{
			String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
			String id = "tester";                                     
			String pw = "abc123";                                     

		conn=DriverManager.getConnection(url,id,pw);              
		out.println(bookname);                        

   		 String sql= "delete from Book where name = " + bookname ; 
   		pstmt = conn.prepareStatement(sql); 
 		 pstmt.executeUpdate(sql); 


		}catch(Exception e){                                                  
		e.printStackTrace();
		}finally{
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}          
			if(conn != null) try{conn.close();}catch(SQLException sqle){}            


		}
		response.sendRedirect("bookdelete.jsp");
%>  

	</body>

</html>


