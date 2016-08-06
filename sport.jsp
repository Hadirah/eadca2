<%--DISM2A01_GRP9_P1529687_SITINURHADIRAH_P1551338_CHANPEITING --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db1.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SP Gamestore-Sports</title>
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
			<li><a href="javascript:void(0)" class="dropbtn"
				onclick="myFunction()">Genre</a>
				<div class="dropdown-content" id="myDropdown">
					<a href="action.jsp?genrename=action">Action</a> <a
						href="adventure.jsp?genrename=adventure">Adventure</a> <a
						href="casual.jsp?genrename=casual">Casual</a>  <a
						href="indie.jsp?genrename=indie">Indie</a> <a
						href="racing.jsp?genrename=racing">Racing</a> <a
						href="rpg.jsp?genrename=rpg">Rpg</a> <a
						href="simulation.jsp?genrename=simulation">Simulation</a> <a
						href="sport.jsp?genrename=sport">Sport</a> <a
						href="strategy.jsp?genrename=strategy">Strategy</a>
				</div>
			<li>
				<form action="searchgame.jsp" method="post">
					<input type="search" name="title"> 
					<input type="submit" value="search" />
					
				</form>
			</li>
			<li>
			<form action="preowned.jsp" method="post">
			<input type="radio" name="preowned" value="Yes" checked>Preowned
		<input type="radio" name="preowned" value="No">New
		<input type="submit" value="submit" />
		</form>
			</li>
								<li>
			<%String adminid = (String)request.getSession().getAttribute("adminid");
				if (adminid != null) {
					
			%>
			<li><a href="adminhome.jsp">Admin Home</a></li>
			<li><a href="endsession">Admin Logout</a></li>
			<%
				}
			%>
				<%
					String member = (String) request.getSession().getAttribute("email");
					if (member != null) {
				%>
			
			<li><a href="memberprofile.jsp">Profile</a></li>
			<li><a href="endsessionmember">Logout</a></li>
			<%
				}
			%>

			<% if(adminid==null){
				if (member == null) {
			%>
			<li><a href="register.jsp">Register </a></li>
			<li><a href="memberlogin.jsp">Login</a></li>
			<%
				}
			%>
<%
				}
			%>

			
			
		</ul>

		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	
	<header>
	<%
		Connection conn = DBConnection.getConnection();

		String genrename = request.getParameter("sports");

		String sql = "Select game.gameid,title,image,price from game,game_genre,genre where game.gameid=game_genre.gameid and genre.genreid=game_genre.genreid and genrename like '%sports%'";

		PreparedStatement pstmt = conn.prepareStatement(sql);


out.println("<br><br><h1>Sports</h1>");
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			int gameid=rs.getInt("gameid");
			String title = rs.getString("title");
			String image = rs.getString("image");
			String price = rs.getString("price");
	%>
<br>
<br>
	<div align='center'>
		<table>
			<tr>
				<th><td><a href="gameinfo.jsp?value=<%=gameid%>"><img src="<%=image%>"  onerror="if (this.src != 'pics/default.png') this.src = 'pics/default.png';" /></a></td></th>
				
			</tr>
			<tr><h4><%=gameid %></h4></tr>
			<tr>
				<h3>
					<%=title%>
				</h3>
			</tr>
			<tr>
				<h3><%="$"+price%></h3>
			</tr>
		</table>
		<%
			}
			conn.close();
		%><br><br>
<a href='#top'>Back to Top</a>
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
