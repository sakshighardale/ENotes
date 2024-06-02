package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.user.UserDetails;

@SuppressWarnings("serial")
public class UserServlet1 extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setPassword(password);
		us.setEmail(email);
		PrintWriter out=response.getWriter();
		UserDAO dao=new UserDAO();
		boolean f=dao.addUser(us);
		HttpSession session;
		
		if(f)
		{
			session=request.getSession();
			session.setAttribute("reg-success", "Registered Successfully..");
			response.sendRedirect("register.jsp");
		}
		else {
			session=request.getSession();
			session.setAttribute("failed-msg","Something went wrong on server...");
			response.sendRedirect("register.jsp");

		}
	}

}
