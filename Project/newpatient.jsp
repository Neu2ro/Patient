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
					<button type="submit" class="btnback" name="btngoback">
        					<img src="backbtn.png" alt="buttonpng" class="srch"/>
      					</button>
					<h1 class="pagetitle">New Patient</h1>
				</div>
			</form>
				<%
					if(request.getParameter("btngoback") != null) {
						response.sendRedirect("dashboard.jsp");
					}
				%>
				<form>
					<input type="name" class="inputs" name="pname" placeholder="Patient's Name" />
					<br/><br/>
  					<input type="name" class="inputs" name="dname" placeholder="Doctor's Username" />
					<br/><br/>
					<input type="submit" value="Add to List" name="btnaddtolist" class="btn topbtn" />
					<br/><br/>
					<input type="submit" value="Save" name="btnsave" class="btn bottombtn" />
					<br/><br/>
				</form>
			</div>		
		</center>
		<center>
			<div class="notice">
			<h2>Please Enter the patient name and Doctor's Username</h2>

			<%
				if(request.getParameter("btnaddtolist") != null) {
					String na = request.getParameter("pname");
					String un = request.getParameter("dname");
					if((na.equals("")) || (un.equals(""))) {
						%>
						<script> showEmptyAlert(); </script>
						<%
						return;
					}

					try {
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/clinic";
						Connection con = DriverManager.getConnection(url, "root", "vivek123");
						String sql = "insert into listofpatient values(?, ?)";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1, na);
						pst.setString(2, un);
						pst.executeUpdate();
						con.close();
						%>
						<script> showPatientListed(); </script>
						<%
					}	
					catch(SQLException sqer) {
						%>
						<script> showListedFailed(); </script>
						<%
					}
				}		
			%>

			<%
				if(request.getParameter("btnsave") != null) {
					String na = request.getParameter("pname");
					String un = request.getParameter("dname");
					if((na.equals("")) || (un.equals(""))) {
						%>
						<script> showEmptyAlert(); </script>
						<%
						return;
					}

					try {
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/clinic";
						Connection con = DriverManager.getConnection(url, "root", "vivek123");
						String sql = "insert into patient values(?, ?)";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1, na);
						pst.setString(2, un);
						pst.executeUpdate();
						con.close();
						%>
						<script> showPatientAdded(); </script>
						<%
					}	
					catch(SQLException sqer) {
						%>
						<script> showFailed(); </script>
						<%
					}	
				}
			
			%>
			</div>
		</center>
	</body>
</html>