package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PostDAO1;
import com.user.post;

/**
 * Servlet implementation class AddNotesServlet
 */
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int user_id=Integer.parseInt(request.getParameter("user_id"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	PostDAO1 pdao=new PostDAO1();
	boolean f=pdao.addNotes(title,content,user_id);
	
	if(f)
	{
		System.out.print("success");
		response.sendRedirect("showNotes.jsp");
	}
	else
	{
		System.out.print("fail");
	}
	
	}

}
