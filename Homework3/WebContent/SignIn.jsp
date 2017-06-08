<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<title>Sign In</title>
	<link rel="stylesheet" href="./css/normalize.css">
	<style type="text/css">	

	fieldset{
		width:16em;
		padding:1em;
		border:2px groove;
		margin:15em auto;
	}
	</style>



	<script type="javascript">
	
	</script>
	</head>
	<body>

	<fieldset>
		<legend>Sign In</legend>
		<form action="signProc.jsp" method="get">

			<p>Name : <input type="text" name="username" id="username"><br></p>
			<p>ID : <input type="text" name="userid" id="ID"><br></p>
			<p>Password : <input type="password" name="userpw" id="PW"><br></p>
			<p>Phone : <input type="text" name="userphone" id="phone"><br></p>
			<p>address : <input type="date" name="useraddress" id="address"><br></p>
			<p><input type="submit" value="Sign in"></p>
		</form>	
	</fieldset>

	<p id="result">
	</p>
	
	</body>
</html>