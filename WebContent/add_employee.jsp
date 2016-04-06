

<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("roles").equals("2"))) {
%>
You need to be logged in as to view this page<br/>
<a href="login.jsp">Please Login</a>
<%
response.sendRedirect("login.jsp");
%>
<%} else {
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Employee</title>
<!-- Basic CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/style.css" rel="stylesheet">


</head>
<body>

<!-- Navigation Bar -->
<jsp:include page="nav.jsp"></jsp:include>

<div class="container">
<div class="col-md-5">
<h1>Add Employee</h1>
 <form method="post" action="addEmployeeServlet" > 
<label for="emp_ID">Employee ID:</label>
<input type="text" id="emp_ID" name="emp_ID" maxLength="6" minLength="6"  pattern="[a-zA-Z0-9_-]{6,12}" title="Employee ID must be not less or more than 6 alphanumeric characters " value="" class="form-control" required/>
<br/>
<label for="first_name">First Name:</label>
<input type="text" id="first_name" name="first_name" value="" class="form-control" required />
<br/>
<label for="last_name">Last Name:</label>
<input type="text" id="last_name" name="last_name" value="" class="form-control"  required/>
<br/>
<label for="gender">Gender:</label><br/>

<input type="radio" name="gender" value="male" required> Male <input type="radio" name="gender" value="female" required> Female
<br/><br/>
<label for="dob">Date Of Birth:</label>
<input type="date" id="dob" name="dob" min="1940-12-31" max="1998-12-31"  value="" class="form-control" required />
<br/>
<label for="email">Email Address:</label>
<input type="email" id="email" name="email" value="" class="form-control"  required/>
<br/>

<label for="phone_number">Phone Number:</label>
<input type="text" id="phone_number" name="phone_number" value="" class="form-control"  required/>
<br/>
<label for="address">Home Address:</label>
<textarea type="text" id="address" name="address" value="" class="form-control"  required></textarea>
<br>
<label for="desig">Designation:</label>
<select id="desig" name="desig" class="form-control" onChange="ChangeSalary();" required>
<option value="">Please Select</option>
<option value="Receptionist">Receptionist</option>
<option value="Cleaner">Cleaner</option>
<option value="Developer">Developer</option>
<option value="Project_Manager">Project Manager</option>
<option value="Accountant">Accountant</option>
</select>

<br/>
<label for="depart">Department:</label>
<select id="depart" name="depart" class="form-control" required >
<option value="">Please Select</option>
<option value="General Worker">General Worker</option>
<option value="ICT">ICT</option>
<option value="Accounting and Finance">Accounting and Finance</option>
<option value="Human Resources">Human Resources</option>
</select>

<br/>
<label for="salary">Default Salary In Ringgits:</label>
<input type="text" id="salary" name="salary" value="" class="form-control" readonly  required/>
<label for="date_joined">Date Joined:</label>
<input type="date" id="date_joined" name="date_joined" value="" class="form-control"  /><br>
<input type="reset" id="reset" name="reset" value="Reset" class="btn btn-warning"  />
<input type="submit" id="submit" name="submit" value="Add" class="btn btn-primary"  />
</form>

</div>



</div>



<script>

function ChangeSalary(){
	
	var desg = document.getElementById("desig").value; 

	

	
	
	switch(desg) {
    case "Receptionist":
    	document.getElementById("salary").value =1500;
    	
        break;
    case "Cleaner":
    	
    	document.getElementById("salary").value =600;
        break;
        
    case "Developer":
    	document.getElementById("salary").value =6000;
        break;
    case "Project_Manager":
    	document.getElementById("salary").value =15000;
        break;
    case "Accountant":
    	document.getElementById("salary").value =3000;;
        break;
    default:
        salary =0;
}
	
}
</script>

 <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>

<%
}
%>