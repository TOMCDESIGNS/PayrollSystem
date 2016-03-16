<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">IBM</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="add_employee.jsp">Add Employee</a></li>
            <li><a href="update_employee.jsp">Update Employee</a></li>
            <li><a href="#">Search</a></li>
           
            <li role="separator" class="divider"></li>
            <li><a href="#">Delete</a></li>
           
          </ul>
        </li>
        
        
        
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Payroll<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="allowance.jsp">Allowance</a></li>
            <li><a href="deduction.jsp">Deduction</a></li>
             <li><a href="#">Update Salary</a></li>
             <li><a href="makepayment.jsp">Make Payment</a></li>
             
           
          
           
          </ul>
        </li>
        
        
        
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reports<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="expenditure_report.jsp">Expenditure Report</a></li>
            <li><a href="expenditure_month.jsp">Expenditure Report By Month</a></li>
   
          </ul>
        </li>
        
        
        <li><a href="#">Logout</a></li>
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
</html>