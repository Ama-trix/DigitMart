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
@WebServlet("/UserSignIn")
public class UserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			String email=request.getParameter("email");
			String pass=request.getParameter("pass");
			DAO db=new DAO();
			String name=db.userLogin(email, pass);
			db.closeConnection();
			System.out.println(name);
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
