<%@ page import="java.sql.*" %>

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
					<div>
						<input type="name" class="inputs" name="name" placeholder="Patient's Name" />
						<button type="submit" class="btnsrch" name="btnsearch">
        						<img src="srch.png" alt="buttonpng" class="srch" />
      						</button>
					</div>
					<br/><br/>
					<table class="tble">
						<tr>
							<th> Date </th>
							<th> Prescription </th>
						</tr>
						<%
						if(request.getParameter("btnsearch") != null) {
							String na = request.getParameter("name");
							if(na .equals("")) {
								%>
								<script> showEmptyAlert(); </script>
								<%
								return;
							}
							try {
								DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
								String url = "jdbc:mysql://localhost:3306/clinic";
								Connection con = DriverManager.getConnection(url, "root", "vivek123");
								String sql = "select * from patientprescription where name = ?";
								PreparedStatement pst = con.prepareStatement(sql);
								pst.setString(1, na);
								ResultSet rs = pst.executeQuery();
								if(rs.next()) {
									while(rs.next()) {
										String dt = rs.getString(2);
										String desc = rs.getString(3);
										%>
											<tr style="text-align:center;">
												<td> <%= dt %> </td>
												<td> <%= desc %> </td>
											</tr>
										<%									
									}
								}
								else {
									%>
									<script> showNotFoundAlert(); </script>
									<%
								}
								
							}
							catch(SQLException err) {
								out.println("Issue: " +err);
							}
						}
						%>
					</table>
					<br/><br/>
					<input type="submit" value="Add Prescription" name="btnaddprescrip" class="btn bottombtn" style="width:50%;" />
					<br/><br/>	
				</form>
			</div>		
		</center>
		<%
			if(request.getParameter("btnaddprescrip") != null) {
				response.sendRedirect("addprescription.jsp");
			}
		%>
	</body>
</html>