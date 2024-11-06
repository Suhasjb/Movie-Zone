<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	String username=request.getParameter("username");
	String mobile=request.getParameter("mobile");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String conpass=request.getParameter("confirm-password");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	out.print("loaded");
	
	String url="jdbc:mysql://localhost:3306/moviezone";
	Connection con=DriverManager.getConnection(url,"root","");
	out.print("connection successful");
	
	if(password.equals(conpass))
	{
		String sql="insert into user_account(username,mobile,email,password) values(?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, mobile);
		ps.setString(3, email);
		ps.setString(4, password);
		ps.executeUpdate();
	}
	else
	{
		out.print("Check your password and re-enter");
	}
}
catch(Exception e)
{
	out.print("error "+e);
}
%>
<a href="movie_home_page.html"></a>
</body>
</html>