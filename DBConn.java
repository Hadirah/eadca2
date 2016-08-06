package registering;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConnection() throws Exception{
	Class.forName("com.mysql.jdbc.Driver");
	String connURL = "jdbc:mysql://localhost/assignment?user=root&password=akamaru97";
	return DriverManager.getConnection(connURL);
	}
}

