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
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			DAO db=new DAO();
			String name=db.adminLogin(id, pass);
			db.closeConnection();
			HttpSession session=request.getSession();
			if (name!=null) {
				session.setAttribute("adminName", name);
				response.sendRedirect("admin/adminHome.jsp");
			} else {
				session.setAttribute("msg", "Invalid Entries");
				response.sendRedirect("admin/index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
		
	}
}
