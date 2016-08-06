<%--DISM2A01_GRP9_P1529687_SITINURHADIRAH_P1551338_CHANPEITING --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>     <%@ page import="java.sql.*,db1.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		Connection conn = DBConnection.getConnection();

		String image = request.getParameter("image");

		String sql = "Select title,description,image,price from game where image like ?" ;
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, "%" + image + "%");

		ResultSet rs = pstmt.executeQuery();

		if (rs.next() == true) {
			response.sendRedirect("gameinfo.jsp");

		} else {
			response.sendRedirect("homepage.jsp");
			
		}
	%>
</body>
</html>