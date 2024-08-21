package com.net.controller;

import java.io.IOException;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.net.modal.DAO;

/**
 * Servlet implementation class AddEnquiryy
 */
@WebServlet("/AddEnquiry")
public class AddEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEnquiry() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		try {
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String msg=request.getParameter("msg");
			DAO db=new DAO();
			db.addEnquiry(name, phone, msg);
			db.closeConnection();
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Thank You! We will contact you soon!");
			response.sendRedirect("UserHome.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
