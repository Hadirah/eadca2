package registering;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = (String) request.getSession()
				.getAttribute("email");
		int contact = Integer.parseInt(request.getParameter("contact"));
		String address = request.getParameter("address");

		registerDB db = new registerDB();
		registersummary results = db.updateregistersummary(name, password, email, contact, address);

		HttpSession session = request.getSession();
		session.setAttribute("results", results);
		session.setAttribute("email", email);
		session.setAttribute("password", password);
		session.setAttribute("name", name);
	    session.setAttribute("contact", contact);
		session.setAttribute("address", address);
	//	request.setAttribute("results", results);
		RequestDispatcher rd = request
				.getRequestDispatcher("memberprofile.jsp");
		rd.forward(request, response);
	}

}
