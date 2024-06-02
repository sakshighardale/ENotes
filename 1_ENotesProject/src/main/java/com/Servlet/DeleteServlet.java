package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO1;

/**
 * Servlet implementation class DeleteServlet
 */
@SuppressWarnings("serial")
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int noteID=Integer.parseInt(request.getParameter("note_id"));
		PostDAO1 postDao=new PostDAO1();
		boolean f=postDao.deletePost(noteID);
		HttpSession session;
		if(f)
		{
			session=request.getSession();
			session.setAttribute("updateMsg", "Note deleted successfully...");
			response.sendRedirect("showNotes.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("NotdeleteMsg", "Something went wrong on server...");
			response.sendRedirect("showNotes.jsp");
		}
	}

}
