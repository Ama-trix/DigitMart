package com.net.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.net.modal.DAO;
import com.net.modal.SendMail;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/OrderPlaced")
public class OrderPlaced extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			HttpSession session=request.getSession();
			String email=(String)session.getAttribute("email");
			if(email==null) {
				session.setAttribute("msg", "Please login First");
				response.sendRedirect("index.jsp");
			}else {
				String address=request.getParameter("address");
				DAO db=new DAO();
				db.orderPlaced(email, address);
				db.closeConnection();
				String sub="Order Placed";
				String body="Your Order is Placed Successfully";
				SendMail.sendMail(email, sub, body);
				//mail code ends
				
				session.setAttribute("msg", "Order Placed added Successfully!");
				response.sendRedirect("UserHome.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
