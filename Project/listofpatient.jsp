<%@ page import="java.sql.*" %>

<%
	if(request.getParameter("r") != null) {
		String name = request.getParameter("r");
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url = "jdbc:mysql://localhost:3306/clinic";						
			Connection con = DriverManager.getConnection(url, "root", "vivek123");
			String sql = "delete from listofpatient where name=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.executeUpdate();
			con.close();
		}
		catch(SQLException err) {
			out.println("Issue: " +err);
		}		
	}
%>

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
					<table class="tble">
						<tr>
							<th> No. </th>
							<th> Name </th>
							<th> Delete </th>
						</tr>

						<%
							if(session.getAttribute("user") != null) {
								String user = (String)session.getAttribute("user");
								int count = 0;
								try {
									DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
									String url = "jdbc:mysql://localhost:3306/clinic";
									Connection con = DriverManager.getConnection(url, "root", "vivek123");
									String sql = "select * from listofpatient where patientof = ?";
									PreparedStatement pst = con.prepareStatement(sql);
									pst.setString(1, user);
									ResultSet rs = pst.executeQuery();
									while(rs.next()) {
										String na = rs.getString(1);
										count++;
									%>
										<tr style="text-align:center;">
											<td> <%= count %> </td>
											<td> <%= na %> </td>
											<td>  <a href="?r=<%= na %> " onclick="return confirm('Are you sure to remove ?')" > Delete </a> </td>
										</tr>
									<%
									}
								}
								catch(SQLException err) {
									out.println("Issue in list : " +err);
								}
							}
						%>		

					</table>
				</form>
			</div>		
		</center>
	</body>
</html>