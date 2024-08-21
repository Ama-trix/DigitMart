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
@WebServlet("/ChangeOrderStatusadmin")
public class ChangeOrderStatusadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			String page=request.getParameter("page");
			String status=request.getParameter("status");
			String email=request.getParameter("email");
			int id=Integer.parseInt(request.getParameter("id"));
			
			DAO db=new DAO();
			db.changeOrderStatus(id, status);
			db.closeConnection();
			
			//mail send
			String sub="Order Status Update";
			String body="Your Order Status is "+status;
			SendMail.sendMail(email, sub, body);
			//mail code ends
			
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Status Updated Successfully!");
			response.sendRedirect("admin/adminHome.jsp");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
