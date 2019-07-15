package com.iandonaldson.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iandonaldson.data.Customer;
import com.iandonaldson.data.CustomerDaoImpl;

/**
 * Servlet implementation class WebCustomer
 */
@WebServlet("/WebCustomer")
public class WebCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String customerIDParam;
    private int customerID;
    private Customer customer;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WebCustomer() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		if (request.getParameter("action") == null) {
			request.getRequestDispatcher("CustomerList.jsp").forward(request, response);
		}
		else {
			CustomerDaoImpl customerDaoImpl = new CustomerDaoImpl();
			switch (request.getParameter("action")) {
			case "getAllCustomers":
				request.getSession().setAttribute("CustomerList", customerDaoImpl.getAllCustomers());
				request.getRequestDispatcher("CustomerList.jsp").forward(request, response);
				break;
			case "getCustomer":
				customerIDParam = request.getParameter("id");
				customerID = Integer.parseInt(customerIDParam);
				break;
			case "updateCustomer":
				break;
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
