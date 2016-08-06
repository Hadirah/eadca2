<%--DISM2A01_GRP9_P1529687_SITINURHADIRAH_P1551338_CHANPEITING --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,stock.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SP Gamestore-Stock Summary</title>
<style>
table,td,tr,th {
	border: 2px solid white;
	padding: 5px;
	width: 40%;
	text-align: center;
	background: black;
	width: 40%;
}

thead {
	text-align: center;
}
</style>
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
	id="page-top">

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- header-->
		<div class="navbar-header">
			<a class="navbar-brand page-scroll" href="homepage.jsp">SP
				GameStore</a>
		</div>

		<!--Link -->


		<ul>
			<li>
				<!-- 				<form action="report" method="post"> --> <!-- 					<input type="text" name="Quantity"> <input type="submit" -->
				<%-- 						value="<%=Quantity %>" /> --%> <!-- 				</form> -->

			</li>

		</ul>

		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<header> <br>
	<br>
	<h1>Stock Report Summary</h1>
	 <%
 	//String Quantity=request.getParameter("Quantity");
 	//int Quantity = Integer.parseInt(request.getParameter("Quantity"));
  	ArrayList<reportsummary> summary = (ArrayList<reportsummary>) request.getAttribute("Quantity");
 	
 	//reportsummary summary = (reportsummary) request.getAttribute("Quantity");
 	if(summary != null){
 	//if(quantity != null) {
 %>

	<div align='center'>
		<table>
			<thead>
				<tr>
					<th>Game ID</th>
					<th>Title</th>
					<th>Price</th>
					<th>Quantity</th>
				</tr>
			</thead>
			<%
			for(reportsummary sum : summary){
 			%> 
			<tr>
				<td>
					<h4><%=sum.getGameid()%>
				</td>
				<td><h4><%=sum.getTitle()%></td>
				<td><h4><%=sum.getPrice()%></td>
				<td><h4><%=sum.getQuantity()%></td>
			</tr>
			<%
 				}
 			%> 
		</table>




		<%
			}
			//conn.close();
		%>
		<h2>
			<a href="adminhome.jsp">return to admin home</a>
		</h2>
		<br>
		<form action="report" method="post">
			<input type="text" name="Quantity"> <input type="submit"
				value="search" />

		</form>
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
	<script>
		/* When the user clicks on the button, 
		 toggle between hiding and showing the dropdown content */
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(e) {
			if (!e.target.matches('.dropbtn')) {

				var dropdowns = document
						.getElementsByClassName("dropdown-content");
				for (var d = 0; d < dropdowns.length; d++) {
					var openDropdown = dropdowns[d];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>

</body>

</html>