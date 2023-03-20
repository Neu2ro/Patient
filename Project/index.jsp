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
						<h1 class="pagetitle">Login Page</h1>
					</div>
				</form>
				<br/>
				<form method="POST">
					<input type="name" class="inputs" name="username" placeholder="Username" />
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

		<%
			if(request.getParameter("btnlogin") != null) {
				String un = request.getParameter("username");
				String pw = request.getParameter("password");
				if( !(un.equals("")) && !(pw.equals("")) ) {
					try {
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/clinic";
						Connection con = DriverManager.getConnection(url, "root", "vivek123");
						String sql = "select * from Doctors where username = ? and password = ?";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1, un);
						pst.setString(2, pw);
						ResultSet rs = pst.executeQuery();
						if(rs.next()) {
							request.getSession().setAttribute("user", un);
							response.sendRedirect("dashboard.jsp");
						}
						else {
							%>
							<script> showAlert(); </script>
							<%
						}
					}	
					catch(SQLException sqer) {
						out.println("Issue: " +sqer);
					}
				}
				else {
					%>
					<script> showEmptyAlert(); </script>
					<%			
				}	
			}		
		%>

		<%
			if(request.getParameter("btnsign") != null) {
				response.sendRedirect("signupage.jsp");
			}		
		%>
		
	</body>
</html>