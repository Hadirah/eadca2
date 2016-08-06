package stock;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class report
 */
@WebServlet("/report")
public class report extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public report() {
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
		
		reportsummary uBean = null;
		Connection conn=null;
		try { 
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/assignment?user=root&password=akamaru97";
		conn = DriverManager.getConnection(connURL);			

        int Quantity = Integer.parseInt(request.getParameter("Quantity"));

			String sql = "Select * from game where Quantity < ?";

		ArrayList<reportsummary> quantity =new ArrayList<reportsummary>();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1,Quantity);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				
				uBean = new reportsummary();
				uBean.setGameid(rs.getInt("gameid"));
				uBean.setPrice(rs.getDouble("price"));
				uBean.setTitle(rs.getString("title"));
				uBean.setQuantity(rs.getInt("Quantity"));
				quantity.add(uBean);
				
			}
			
		//	repsummary summary = new repsummary();
			//uBean = summary.getreportsummary(Quantity);

			request.setAttribute("Quantity", quantity);
			RequestDispatcher rd = request
					.getRequestDispatcher("stockreport.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			System.out.println("lol");
			// TODO Auto-generated catch block
		}

	}

}
