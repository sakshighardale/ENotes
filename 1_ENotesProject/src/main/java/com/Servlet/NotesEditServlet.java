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
 * Servlet implementation class NotesEditServlet
 */
@WebServlet("/NotesEditServlet")
public class NotesEditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int noteId=Integer.parseInt(request.getParameter("noteId"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		try {
			PostDAO1 dao=new PostDAO1();
			boolean f=dao.postUpdat(noteId, title, content);
			if(f)
			{
				System.out.println("update");
				HttpSession session=request.getSession();
				session.setAttribute("updateMsg", "Updated Successfully");
				response.sendRedirect("showNotes.jsp");
			}
			else
			{

				System.out.println("not update");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
