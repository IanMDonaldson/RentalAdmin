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
				customer = customerDaoImpl.getCustomer(customerID);
				request.getSession().setAttribute("customer", customer);
				request.getRequestDispatcher("Customer.jsp").forward(request, response);
				break;
			case "updateCustomerGET":
				customerIDParam = request.getParameter("id");
				customerID = Integer.parseInt(customerIDParam);
				customer = customerDaoImpl.getCustomer(customerID);
				request.getSession().setAttribute("id", Integer.toString(customerID));
				request.getSession().setAttribute("firstName", customer.getFirstName());
				request.getSession().setAttribute("lastName", customer.getLastName());
				request.getSession().setAttribute("email", customer.getEmail());
				request.getRequestDispatcher("Customer.jsp").forward(request, response);
				break;
			case "manageCustomers":
				request.getRequestDispatcher("CustomerManagement.jsp").forward(request, response);
				break;
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDaoImpl customerDaoImpl = new CustomerDaoImpl();
		if (request.getParameter("action") == null) {
			request.getRequestDispatcher("Menu.jsp").forward(request, response);
		}
		else {
			switch (request.getParameter("action")) {
			case "updateCustomerPOST":
				customerIDParam = request.getParameter("id");
				customerID = Integer.parseInt(customerIDParam);
				customer = customerDaoImpl.getCustomer(customerID);
				customer.setFirstName(request.getParameter("firstName").toString());
				customer.setLastName(request.getParameter("lastName").toString());
				customer.setEmail(request.getParameter("email").toString());
				
				if (!customerDaoImpl.updateCustomer(customer) ) {
					request.getRequestDispatcher("updateFailure.jsp").forward(request, response);
				}
				else {
					request.getSession().setAttribute("customer", customer);
					request.getRequestDispatcher("Customer.jsp").forward(request, response);		
				}
				break;
			case "searchCustomerPOST":
				customerIDParam = request.getParameter("customerName").toString();
				if (customerDaoImpl.validCustomerNameSearch(customerIDParam)) {
					request.getSession().setAttribute("customerList", customerDaoImpl.getCustomersByName(customerIDParam));
					request.getRequestDispatcher("CustomerList.jsp").forward(request, response);
				}
				break;
			
			}
		}
	}

}
