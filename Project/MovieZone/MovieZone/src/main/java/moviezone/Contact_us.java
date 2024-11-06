package moviezone;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Contact_us
 */
@WebServlet("/Contact_us")
public class Contact_us extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		//HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String message=request.getParameter("message");
		
		//session.setAttribute("username",username);
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviezone","root","");
			
			String sql="insert into user_feedback(name,mobile,email,message)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2,email);
			ps.setString(3,message);
			
			ps.executeUpdate();
			
			out.print("<html><head><title>Feedback notification</title></head>");
		}
		catch(Exception e)
		{
			out.println("error "+e);
		}
	}

}
