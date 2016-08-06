<%--DISM2A01_GRP9_P1529687_SITINURHADIRAH_P1551338_CHANPEITING --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ page import="java.sql.*,db1.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">

<!-- Plugin CSS -->
<link rel="stylesheet" href="css/animate.min.css" type="text/css">

<!-- Custom CSS -->

<link rel="stylesheet" href="css/creative.css" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<header>
	<div class="header-content">
		<div class="header-content-inner">
			<h1>Commented</h1>

<%
		Connection conn = DBConnection.getConnection();

String gameid = request.getParameter("value");

// 	String gameid = request.getParameter("gameid");
		String commenter = request.getParameter("commenter");
		String rating = request.getParameter("rating");
		String date = request.getParameter("date");
		String comment = request.getParameter("comment");

		String sql = "Insert into comment(gameid,commenter,rating,date,comment) values(?,?,?,?,?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,gameid);
		pstmt.setString(2, commenter);
		pstmt.setString(3, rating);
		pstmt.setString(4, date);
		pstmt.setString(5, comment);


		int recsModified = pstmt.executeUpdate();

		out.println(recsModified + " comment inserted");
		
		conn.close();
		
	%>
	
	<a href="commentform.jsp?value=<%=gameid%>">Return to add comments</a>
	<h3><a href="comments.jsp?value=<%=gameid%>">Return to Comments</a></h3>
	<h2><a href="homepage.jsp">Go to home page</a></h2>
	</div>
	</div>
	</header>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/jquery.fittext.js"></script>
	<script src="js/wow.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/creative.js"></script>
</body>
</html>