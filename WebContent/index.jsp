<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>
<!-- Basic CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/style.css" rel="stylesheet">


</head>
<body>




<!-- Navigation Bar -->
<jsp:include page="nav.jsp"></jsp:include>

<div class="container">

<h1>IBM Payroll System</h1>

<table border="1"  id="tickets" class="table table-striped table-bordered" cellspacing="0" width="50%">
<tr>
<td><a href="add_employee.jsp">Add Employee</a></td>
<td><a href="search_employee.jsp">Search</a></td>
</tr>
<tr>
<td><a href="allowance.jsp">Allowance</a></td>
<td><a href="update_salary.jsp">Update Salary</a></td>
</tr>

<tr>
<td><a href="deduction.jsp">Deduction</a></td>
<td><a href="makepayment.jsp">Make Payment</a></td>
</tr>
</table>


</div>


 <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>