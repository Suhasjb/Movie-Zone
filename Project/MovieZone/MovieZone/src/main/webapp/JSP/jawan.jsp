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
try{
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	int tickets=Integer.parseInt(request.getParameter("tickets"));
	String showtime=request.getParameter("showtime");
	String moviename=request.getParameter("moviename");
	//int price=Integer.parseInt(request.getParameter("price");
	
String url="jdbc:mysql://localhost:3306/moviezone";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection(url,"root","");
//out.println(" Database Sucessfully connected");
PreparedStatement ps=con.prepareStatement("insert into credentials values(?,?,?,?,?)");

ps.setString(1,name);
ps.setString(2,email);
ps.setInt(3, tickets);
ps.setString(4,showtime);
ps.setString(5,moviename);

ps.executeUpdate();
%>
<html>
<head>
    <title>Receipt Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: lightgoldenrodyellow;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .total-price {
            font-weight: bold;
            text-align: right;
            font-size: 18px;
            margin-top: 20px;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
        footer {
    text-align: center;
    padding: 10px 0;
    margin: auto auto;
    background-color: #333;
    color: #fff;
}
	</style>
</head>
<%
  double totalamount = tickets* 200;
%>
    <div class="container">
        <h1>Receipt</h1>
        <form method="post" action="../HTML/jawan-booking.html">
        	<div class="form-group">
        		<label for="name">Name:</label>
                <input type="text" id="name"  name="name" value="<%= request.getParameter("name")%>"  required> 
            </div>  
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="<%= request.getParameter("email")%>" required>
            </div>
            <div class="form-group">
                <label for="moviename">Movie Name:</label>
                <input type="text" id="moviename" name="moviename" value="<%= request.getParameter("moviename")%>" required>
            </div>
            <div class="form-group">
             	<label for="showtime">Showtime:</label>
                <input type="text" id="showtime" name="showtime" value="<%= request.getParameter("showtime")%>" required>
             </div>
            <div class="form-group">
                <label for="tickets">Tickets</label>
                <input type="text" id="tickets" name="tickets" value="<%=request.getParameter("tickets") %>" required>
            </div>
            <div class="total-price">
                Total: <span id="totalAmount"><%= +totalamount%></span>
            </div>
            <footer>
				<p>&copy; MovieZone 2023</p>
			</footer>
         </form>
    </div>
    </html>	
<%
con.close();
}
catch(Exception e){
	out.println("error" +e);
}
%>
</body>
</html>