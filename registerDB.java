package registering;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class registerDB {

	public registersummary updateregistersummary(String name, String password,
			String email, int contact, String address) {
		
		
		try {
			Connection conn = DBConn.getConnection();
			
			

			String sql1 = "update member set name=?, password=?, contact=?, address=? where email=?";

			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			
			pstmt.setInt(3, contact);
			pstmt.setString(4, address);
			pstmt.setString(5, email);

			pstmt.executeUpdate();

			String sql2 = "select * from member where email = ?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql2);
			pstmt1.setString(1, email);
			ResultSet rs = pstmt1.executeQuery();

			registersummary update = new registersummary();
			while (rs.next()) {
				
				name = rs.getString("name");
				password = rs.getString("password");
				email = rs.getString("email");
			 contact = rs.getInt("contact");
				address = rs.getString("address");

				update.setName(name);
				update.setPassword(password);
				update.setEmail(email);
				update.setContact(contact);
				update.setAddress(address);

				
			} 
			conn.close();
			return update;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	public registersummary getregistersummary(String email) {

		registersummary summary = new registersummary();
		try {
			Connection conn = DBConn.getConnection();

			String sql = "select * from member where email = ?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				String password = rs.getString("password");
				email = rs.getString("email");
				int contact = rs.getInt("contact");
				String address = rs.getString("address");

				summary.setName(name);
				summary.setPassword(password);
				summary.setEmail(email);
				summary.setContact(contact);
				summary.setAddress(address);

			}
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return summary;
	}

	public registersummary addregistersummary(String name, String password,
			String email, int contact, String address) {
		try {
			Connection conn = DBConn.getConnection();

			String sql1 = "insert into member(name,password,email,contact,address) values (?,?,?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setInt(4, contact);
			pstmt.setString(5, address);

			pstmt.executeUpdate();

			String sql2 = "select * from member";
			PreparedStatement pstmt1 = conn.prepareStatement(sql2);

			ResultSet rs = pstmt1.executeQuery();

			registersummary addregister = new registersummary();
			while (rs.next()) {

				name = rs.getString("name");
				password = rs.getString("password");
				email = rs.getString("email");
				contact = rs.getInt("contact");
				address = rs.getString("address");

				addregister.setName(name);
				addregister.setPassword(password);
				addregister.setEmail(email);
				addregister.setContact(contact);
				addregister.setAddress(address);

			}
			conn.close();
			return addregister;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
