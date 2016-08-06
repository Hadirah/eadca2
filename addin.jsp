<%--DISM2A01_GRP9_P1529687_SITINURHADIRAH_P1551338_CHANPEITING --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding game in progress</title>

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
<% String adminid = (String)request.getSession().getAttribute("adminid");
if (adminid==null){
response.sendRedirect("adminlogin.jsp");
}
%>
<header>
	<div class="header-content">
		<div class="header-content-inner">
			<h1>Adding games for you</h1>
<form action="add.jsp" method="post">

			<h3>Game Title: <input type="text" name="title" required></h3>
		
		
			<h3>Company: <input type="text" name="company" required></h3>
		
		
			<h3>Release Date: <input type="text" name="releasedate" required></h3>
		
	
			<h3>Description: <input type="text" name="description" required></h3>
		
		
			<h3>Price: <input type="text" name="price" required></h3>
		
		
			<h3>Image: <input type="text" name="image" ></h3>
		

		
			<h3>Genre: <input type="text" name="genre" required></h3>
		
		
			<h3>Preowned: <input type="text" name="preowned" required></h3>
			
			<h3>Quantity: <input type="text" name="Quantity" required></h3>
	
			<input type="submit" name="btnSubmit" value="Add Game"> 
			<input type="reset" name="btnReset" value="Reset">
		
<h2><a href="adminhome.jsp">return to admin home</a></h2>
</form>
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