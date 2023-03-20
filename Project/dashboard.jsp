<html>
	<head>
		<title>Clinic</title>
		<link rel="stylesheet" href="styles.css">
		<link rel="icon" type="image/x-icon" href="Clinic.ico">
	</head>
	<body>
		<center>
			<div class="screen">
				<form>
					<div class="header">
						<button type="submit" class="btnback" name="btngoback">
        						<img src="backbtn.png" alt="buttonpng" class="srch"/>
      						</button>
						<h1 class="pagetitle">DashBoard</h1>
					</div>
				</form>
				<br/>
				<form>
					<input type="submit" class="custbtn" value="Waiting List" name="btnlistofpatient" />
					<br/><br/>
					<input type="submit" class="custbtn" value="New Patient" name="btnnewpatient" />
					<br/><br/>
					<input type="submit" class="custbtn" value="Add Prescription" name="btnprescription" />
					<br/><br/>
					<input type="submit" class="custbtn" value="Patient's history" name="btnhistory" />
					<br/><br/>
					<input type="submit" class="custbtn" value="Logout" name="btnhistory" />
				</form>
			</div>		
		</center>
		<%
			if(request.getParameter("btnlistofpatient") != null) {
				response.sendRedirect("listofpatient.jsp");
			}		
		%>
		<%
			if(request.getParameter("btnnewpatient") != null) {
				response.sendRedirect("newpatient.jsp");
			}		
		%>
		<%
			if(request.getParameter("btnprescription") != null) {
				response.sendRedirect("addprescription.jsp");
			}		
		%>
		<%
			if(request.getParameter("btnhistory") != null) {
				response.sendRedirect("patienthistory.jsp");
			}		
		%>
	</body>
</html>