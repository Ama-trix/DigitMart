package com.net.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.net.modal.DAO;

/**
 * Servlet implementation class GetProductImage
 */
@WebServlet("/GetProductImage")
public class GetProductImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			try {
				String name=request.getParameter("name");
				DAO db=new DAO();
				byte[] image=db.getProductImage(name);
				db.closeConnection();
				response.getOutputStream().write(image);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
