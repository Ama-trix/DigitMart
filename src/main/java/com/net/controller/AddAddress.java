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
@WebServlet("/AddAddress")
public class AddAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			HttpSession session=request.getSession();
			String email=(String)session.getAttribute("email");
			System.out.println(email);
			String address= request.getParameter("address");
			DAO db=new DAO();
			db.addAddress(email, address);
			db.closeConnection();
			session.setAttribute("msg", "Address added Successfully");
			response.sendRedirect("PlaceOrder.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
