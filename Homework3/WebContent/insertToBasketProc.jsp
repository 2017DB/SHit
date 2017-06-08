<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>update book</title>
	</head>
	<body>
		<%
			
		String _id = (String)session.getAttribute("id_ing");  
		String _pw= (String)session.getAttribute("pw_ing");
		
		
		
		Date nows= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		
		

		
		String rid = request.getParameter("rid");
		String rprice = request.getParameter("rprice");
		String rbookname = request.getParameter("rbookname");
		
			

		Class.forName("com.mysql.jdbc.Driver");                   
		Connection conn = null;          
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
			String id = "tester";                                     
			String pw = "abc123";                                     

		conn=DriverManager.getConnection(url,id,pw);              
		out.println("제대로 연결되었습니다.");                        

		String sql = "insert into Basket (user_id, book_id,book_name, price, _count) values('" + _id + "','" + rid + "','"+ rbookname + "'," + rprice + ",1)" ; 
   		
   		pstmt = conn.prepareStatement(sql); 
 		 pstmt.executeUpdate(sql);

 		
		}catch(Exception e){                                                  
		e.printStackTrace();
		}finally{
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}          
			if(conn != null) try{conn.close();}catch(SQLException sqle){}            


		}
		response.sendRedirect("mainForuser.jsp");
%>  

	</body>

</html>


