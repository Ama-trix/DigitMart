package com.net.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.net.modal.DAO;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			String name=request.getParameter("name");
			HttpSession session=request.getSession();
			int qty=(int)(session.getAttribute("qty"));
			int price=(int)(session.getAttribute("price"));
			
			DAO db=new DAO();
			db.updateProduct(name,qty,price);
			db.closeConnection();
			
			session.setAttribute("msg", "Product Updated!");
			response.sendRedirect("admin/ViewProducts.jsp");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
