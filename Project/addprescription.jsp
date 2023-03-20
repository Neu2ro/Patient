<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

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
					<h1 class="pagetitle">List of Patients Waiting</h1>
				</div>
			</form>
				<%
					if(request.getParameter("btngoback") != null) {
						response.sendRedirect("dashboard.jsp");
					}
				%>
				<form>
					<input type="name" class="inputs" name="name" placeholder="Name" />
					<br/><br/>
					<div class="aajkadin">
					<%	
						Date today = new Date();
						SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
						String formatedDate = DATE_FORMAT.format(today);
					%>
					<p>Date: <%= formatedDate %> </p>
					</div>
					<br/><br/>
					<textarea name="prescription" rows="4" cols="50" class="inputsarea" ></textarea>
					<br/><br/>
					<input type="submit" value="Add" name="btnAdd" class="btn topbtn" />
					<br/><br/>
					<input type="submit" value="Show History" name="btnshwhist" class="btn bottombtn" style="width:50%;"/>
					<br/><br/>
				</form>
			</div>		
		</center>
		<%
			Date aaj = new Date();
			SimpleDateFormat DATE_FO = new SimpleDateFormat("yyyy-MM-dd");
			if(request.getParameter("btnAdd") != null) {
				String na = request.getParameter("name");
				String dt = DATE_FO.format(aaj);
				String desc = request.getParameter("prescription");
				if((na .equals("")) || (desc.equals(""))) {
					%>
					<script> showEmptyAlert(); </script>
					<%
					return;
				}

				try {
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url = "jdbc:mysql://localhost:3306/clinic";
					Connection con = DriverManager.getConnection(url, "root", "vivek123");
					String sql = "insert into patientprescription values(?, ?, ?)";
					PreparedStatement pst = con.prepareStatement(sql);
					pst.setString(1, na);
					pst.setString(2, dt);
					pst.setString(3, desc);
					pst.executeUpdate();
					con.close();
					%>
					<script> showPatientAdded(); </script>
					<%
				}	
				catch(SQLException sqer) {
					%>
					<script> showErrorAlert(); </script>
					<%
				}	
			}
		%>
		<%
			if(request.getParameter("btnshwhist") != null) {
				response.sendRedirect("patienthistory.jsp");
			}
		%>
	</body>
</html>