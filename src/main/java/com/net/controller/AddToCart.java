package com.net.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.net.modal.DAO;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AddToCart")
@MultipartConfig
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");

			String p_name = request.getParameter("p_name");
			String name = request.getParameter("name");

			DAO db = new DAO();
			db.addToCart(email, name);
			db.closeConnection();

			session.setAttribute("msg", "Item added Successfully!");
			response.sendRedirect("UserHome.jsp?p_name=" + p_name);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}