package com.net.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.net.modal.DAO;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/ChangeEnquiryStatus")
public class ChangeEnquiryStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			int id=Integer.parseInt(request.getParameter("id" ));
			DAO db=new DAO();
		    db.changeEnquiryStatus(id);
		    db.closeConnection();
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Status Updated");
				response.sendRedirect("admin/enquiries.jsp");
				}
		catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
