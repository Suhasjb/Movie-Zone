<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.feedback{
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    padding: 40px;
    margin: 50px auto;
    max-width: 400px;
}
</style>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String message=request.getParameter("message");

//session.setAttribute("username",username);

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviezone","root","");
	
	String sql="insert into user_feedback(name,email,message) values(?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	
	ps.setString(1, name);
	ps.setString(2,email);
	ps.setString(3,message);
	
	ps.executeUpdate();
	out.print("added successfully");

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Process the form submission here if needed
%>
	<div class="feedback">
        <p>Feedback entered successfully!</p>
<%
    }
%>

<a href="../HTML/movie_home_page.html">Go Back</a>
</div>

<%
}
catch(Exception e)
{
	out.println("error "+e);
}
%>

</body>
</html>