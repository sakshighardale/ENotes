package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.user.UserDetails;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		
		UserDetails user=new UserDetails();
		user.setEmail(email);
		user.setPassword(password);
		
		UserDAO dao=new  UserDAO();
		UserDetails user1=dao.loginUser(user);
		
		if(user1!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("userD",user1 );
			response.sendRedirect("home.jsp");
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("login-failed", "Invalid username or password");
			response.sendRedirect("login.jsp");
			
		}
		
	}

}
