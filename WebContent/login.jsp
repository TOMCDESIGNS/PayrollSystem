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

<h1>Login To IBM Payroll System</h1>
 <form name="form" id="form" class="form-horizontal"  method="POST" action="processLogin.jsp">
<table border="1"  id="tickets" class="table table-striped table-bordered" cellspacing="0"  style="width:50%;">
<tr>
<td>Login as:</td>
<td><select class="form-control" id="roles" name="roles" required>
<option value="1">Admin</option>
<option value="2">Manager</option>
</select></td>
</tr>
<tr>
<td>Username</td>
<td><input class="form-control" type="text" name="username" id="username" required title="Please enter your username"></td>
</tr>
<tr>
<td>Password</td>
<td><input class="form-control" type="password" name="password" id="password" required title="Please enter your password"></td>
</tr>

<tr>
<td></td>
<td><input type="submit" class="btn" name="login" value="Login" id="login" ></td>
</tr>
</table>
</form>


</div>


 <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>