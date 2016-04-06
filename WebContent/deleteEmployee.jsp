

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


<%@ page import="java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete</title>
<!-- Basic CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/style.css" rel="stylesheet">


</head>
<body>

<!-- Navigation Bar -->
<jsp:include page="nav.jsp"></jsp:include>

<div class="container">
<div class="row">
 <h2>Search Records</h2>

 <form method="post" name="frm" action="SearchServlet">
 <div class="col-md-8">

<input class="form-control"  type="text" name="emp_ID" id="emp_ID" placeholder="Search Employee By ID eg. Emp001" required >
</div>

 <div class="col-md-4">
<input type="hidden" name="source_url" id="source_url" value="/deleteEmployee.jsp" />
<input class="btn"  type="submit" name="search" id="search" value="Search">
</div>



</form>
<hr>
</div>

<%
int count=0;
if(request.getAttribute("recordList")!=null)
{
	 ArrayList al = (ArrayList)request.getAttribute("recordList");
		Iterator itr = al.iterator();
		
		
		while(itr.hasNext())
		{
			
			if((count%2)==0)
			{
				
			
				
				
			}
			else
			{
				
			}
			count++;
			ArrayList recordList = (ArrayList)itr.next();
			%>

<div class="row">
<div class="col-md-5">


 <form method="post" action="DeleteEmployeeServlet" >
 
<h1>Employee Details</h1>
<input type="hidden" id="emp_ID" name="emp_ID" value="<%=recordList.get(1)%>" class="form-control"  />
<strong>Employee ID:</strong> <%=recordList.get(1)%>

<br/><br/>
<strong>First Name:</strong> <%=recordList.get(2)%>

<br/><br/>
<strong>Last Name:</strong> <%=recordList.get(3)%>

<br><br/>
<strong>Salary In Ringgits:</strong><%=recordList.get(11)%>

<br>

<br>
<br>


	<button type="submit" class="btn btn-danger">Delete Employee</button>
	
	</form>
</div>
<div class="col-md-2"></div>

</div>



<%
	
	}
}

%>

<%
if(count==0)
{
	%>
No Record
	<%
}
%>
</div>

  
 <!-- jQuery -->
    <script src="js/jquery.js"></script>
    
<script type="text/javascript">
    $(document).ready(function() {
     $('#calculate').click(function(e) {
     e.preventDefault();
     
     var medical = $("#medical").val();
     var bonus = $("#bonus").val();
     var overtime = $("#overtime").val();
     var lunch = $("#lunch").val();
     var gross_salary =  $("#gross_salary").val();
     
     
     var value ='medical='+medical + '&bonus='+bonus +'&overtime='+overtime + '&lunch='+lunch +'&gross_salary='+gross_salary;
 
     $.ajax({
     url: "calculateServlet",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
     //$("#medical").val('');
     $("#message").html("<span style='color:red'>Calculation Results</span>"+data).slideDown('slow');
     
    
     }
     });
});
});
</script>



    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>

<%

}

%>