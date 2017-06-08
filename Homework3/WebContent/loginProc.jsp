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
		
		HttpSession sess = request.getSession(true);
		String inputid = request.getParameter("input_id");
		String inputpw = request.getParameter("input_pw");
		  session.setAttribute("id_ing",inputid);
	       session.setAttribute("pw_ing", inputpw);
	    String mileage;
	       if(inputid.equals("admin") || inputpw.equals("1234")){
				response.sendRedirect("mainForadmin.jsp");	      
				
			}
		
		
		
		Class.forName("com.mysql.jdbc.Driver");                   
		Connection conn = null;          
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://hwyncho.dlinkddns.com:9306/DBHW3";        
			String id = "tester";                                     
			String pw = "abc123";     
	
			

		conn=DriverManager.getConnection(url,id,pw);              
	

   		 String sql= "select * from User"; 
   		pstmt = conn.prepareStatement(sql); 
 		rs = pstmt.executeQuery(); 
 		
 		 while(rs.next()){                   
 		
			String temp_id = rs.getString("_id");
			String temp_password = rs.getString("password");
		
			if(inputid.equals(temp_id) && inputpw.equals(temp_password)){
				mileage = rs.getString("mileage");
				 session.setAttribute("point",mileage);
				response.sendRedirect("mainForuser.jsp");
			}
		
				 
		response.sendRedirect("login.jsp");
			
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


