<%--DISM2A01_GRP9_P1529687_SITINURHADIRAH_P1551338_CHANPEITING --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db1.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Register</title>
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
<script>
	function validate() {
		
		var name = document.forms["myForm"]["name"].value;
		if (name == null || name == "") {
			alert("Name can't be blank");
			return false;
		}
		
		var password = document.forms["myForm"]["password"].value;
		var passw = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;  
		if(password.length<8 || password.length>16){
			alert("Password must be between 8 to 16 characters");
		}
		if(!password.match(passw))   
		{   
		alert('Password must contain number and alphabet')  ;
		return false;  
		}  
		
	
	  var x = document.forms["myForm"]["email"].value;
	    var atpos = x.indexOf("@");
	    var dotpos = x.lastIndexOf(".");
	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
	        alert("Not a valid e-mail address");
	        return false;
	    }
	 
		var contact = document.forms["myForm"]["contact"].value;
		if (contact.length < 8 || contact.length>8) {
			alert("Contact must contain only 8 digits");
			return false;
			
		}
		var address = document.forms["myForm"]["address"].value;
		 if (address == null || address == "") {
				alert("Address can't be blank");
				return false;
			
			}
	

	}

</script>


</head>
<body>
<%
String errormessage =(String) request.getAttribute("errormessage");

if(errormessage!=null){
	out.println("errormessage");
}

%>

	<header>
	<div class="header-content">
		<div class="header-content-inner">
		
		<br><br>
			<h1>Register</h1>
			<form name="myForm" action="register" method="post" onsubmit="return validate()">
				<h3>
					Name: <input type="text" name="name" >
				</h3>
				<br />
				<h3>
					Password: <input type="password" name="password" >
				</h3>
				<br />
				<h3>
					Email: <input type="email" name="email" >
				</h3>
				<br>
				<h3>
					Contact: <input type="number" name="contact" >
				</h3>
				<br>
				<h3>
					Address: <input type="text" name="address" >
				</h3>
				<br> <br> <input type="submit" name="btnSubmit"
					value="submit" /> <input type="reset" name="btnreset"
					value="reset" />
					<h4><a href="homepage.jsp">Return to homepage</a></h4>
					<h4><a href="memberlogin.jsp">Go to Login</a></h4>
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