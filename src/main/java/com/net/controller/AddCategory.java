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
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			String name=request.getParameter("name");
			DAO db=new DAO();
			String result=db.addCategory(name);
			db.closeConnection();
			HttpSession session=request.getSession();
			session.setAttribute("msg", result);
			response.sendRedirect("admin/Products.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
