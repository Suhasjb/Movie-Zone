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
//import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("movie_home_page.html");
		PrintWriter out=response.getWriter();
		//HttpSession session=request.getSession();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		//session.setAttribute("username",username);
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviezone","root","");
			PreparedStatement ps=con.prepareStatement("Select username,password from user_account where username=? and password=?");
			
			ps.setString(1, username);
			ps.setString(2,password);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				//out.println("<h1 style='color:blue;'>You are successfully logged in "+rs.getString(1)+"</h1>");
				request.getRequestDispatcher("http://localhost:8080/MovieZone/HTML/movie_home_page.html").include(request,response);
			}
			else
			{
				//out.println("username or password incorrect");
				request.getRequestDispatcher("login.html").include(request, response);
			}
		}
		catch(Exception e)
		{
			out.println("error "+e);
		}
	}

}
