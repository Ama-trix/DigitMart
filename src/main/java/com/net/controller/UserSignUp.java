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
@WebServlet("/UserSignUp")
public class UserSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			String name=request.getParameter("name");
			String pass=request.getParameter("pass");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			DAO db=new DAO();
			String status=db.userSignUp(name,phone, email,pass, address);
			
			db.closeConnection();
			HttpSession session=request.getSession();
			if (name!=null) {
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				response.sendRedirect("UserHome.jsp");
			} else {
				session.setAttribute("msg", "Invalid Entries");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
		
	}
}
