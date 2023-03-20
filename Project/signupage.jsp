<%@page import="java.sql.*" %>

<html>
	<head>
		<title>Clinic</title>
		<link rel="stylesheet" href="styles.css">
		<link rel="icon" type="image/x-icon" href="Clinic.ico">
		<script type="text/javascript" src="scripts.js"></script>
	</head>
	<body>
		<center>
			<div class="screen">
				<form>
					<div class="header">
						<h1 class="pagetitle">Signup Page</h1>
					</div>
				</form>
				<form method="POST">
					<input type="name" class="inputs" name="name" placeholder="Name" />
					<br/><br/>
					<input type="name" class="inputs" name="username" id="username" placeholder="Username" />
					<br/><br/>
  					<input type="password" class="inputs" name="password" placeholder="Password" />
					<br/><br/>
					<input type="submit" value="Login" name="btnlogin" class="btn topbtn" />
					<br/><br/>
					<input type="submit" value="Signup" name="btnsign" class="btn bottombtn" />
					<br/><br/>
				</form>
			</div>		
		</center>
		<center>
			<div class="notice">
			<h2>Password must have atleast 8 characters</h2>
			<h2>Username must have atleast 6 characters</h2>
			<%
				if(request.getParameter("btnsign") != null) {
					String na = request.getParameter("name");
					String un = request.getParameter("username");
					String pw = request.getParameter("password");

					if((na .equals("")) || (un.equals("")) || (pw.equals(""))) {
						%>
						<script> showEmptyAlert(); </script>
						<%
						return;
					}

					if(un.length() < 5) {
						%>
						<script> showUn(); </script>
						<%
						return;
					}

					if(pw.length() < 7) {
						%>
						<script> showPw(); </script>
						<%
						return;
					}

					try {
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/clinic";
						Connection con = DriverManager.getConnection(url, "root", "vivek123");
						String sql = "insert into doctors values(?, ?, ?)";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1, na);
						pst.setString(2, un);
						pst.setString(3, pw);
						pst.executeUpdate();
						con.close();
						%>
						<script> showSuccessAlert(); </script>
						<%
						
					}	
					catch(SQLException sqer) {
						%>
						<script> showFailAlert(); </script>
						<%
					}	
				}		
			%>

			<%
				if(request.getParameter("btnlogin") != null) {
					response.sendRedirect("index.jsp");
				}		
			%>
			</div>
		</center>
	</body>
</html>