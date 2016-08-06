package registering;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.*;
import java.lang.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import stock.reportsummary;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		//String contact = request.getParameter("contact");
		Integer contact = Integer.parseInt(request.getParameter("contact"));
		
			String contact1= contact.toString();
		
//		Integer contact = Integer.parseInt(request.getParameter("contact"));
//		if(contact != null ) {
//			contact1 = contact;
//		}
		
			
//		System.out.print(name+","+password+","+email+","+contact+","+address);
		String errormessage = "Invalid input, please re enter your values";
//		//String passerror = "";
//
		boolean check = true;
//try{
//		// cecks if null or not
		if (name =="" || name == null) {
			check = false;
			request.setAttribute("errorname", errormessage);
		}
		// check password
		if (password.length() < 8 || password.length() > 16) {
			check = false;
			request.setAttribute("errorname", errormessage);
		}
		 if (!password.matches(".*\\d+.*")) {
			check = false;
			request.setAttribute("errorname", errormessage);
		}
		if (password.equals("")) {
			check = false;
			request.setAttribute("errorname", errormessage);
		}
		if (email.equals("")) {
			check = false;
			request.setAttribute("errorname", errormessage);
		}
		// check contact
		if (contact1.length() < 8 || contact1.length()> 8) {
			check = false;
			request.setAttribute("errorname", errormessage);
		}
		if (address.equals("")) {
			check = false;
			request.setAttribute("errorname", errormessage);
		}


		//check email
		String regex = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
		if(!email.matches(regex)){
			check = false;
			request.setAttribute("errorname", errormessage);
	}
		
		


		if (check == false) {
			//request.setAttribute("errorname", errormessage);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		} 
		else{
registerDB db = new registerDB();
registersummary results = db.addregistersummary(name, password,
		email, contact, address);

request.setAttribute("results", results);
RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
rd.forward(request, response);

	}
	}
}
