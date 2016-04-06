

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
<title>Allowance</title>
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
<input type="hidden" name="source_url" id="source_url" value="/deduction.jsp" />
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



	
<h1>Employee Details</h1>

<strong>Employee ID:</strong> <%=recordList.get(1)%>

<br/><br/>
<strong>First Name:</strong> <%=recordList.get(2)%>

<br/><br/>
<strong>Last Name:</strong> <%=recordList.get(3)%>

<br><br/>
<strong>Salary In Ringgits:</strong><%=recordList.get(11)%>

<br>



	
</div>
<div class="col-md-2"></div>
<div class="col-md-5"><h1>Deduction</h1>

 <form name="sub" action="" id="sub">
 
 
<p>Deductions for the month of    <input type="month" name="date_of_payment" id="date_of_payment" onChange="form.action='CalculateAllowanceServlet';" required title="Please select the appropriate month to add the allowances" />

<input type="text" id="emp_ID2" name="emp_ID2" value="<%=recordList.get(1)%>" class="form-control" required readonly  />

</p>


<table  class="table table-striped table-bordered" cellspacing="0" width="100%">
<thead>
<tr>
                <th><strong>Type</strong></th>
                <th><strong>Amount</strong></th>
                </tr>
</thead>

<tbody>
<tr>
<td>Gross Salary<br> (Including Allowances)</td>
<td>
<span id="check_message"></span>

</td>
</tr>
<tr>
<td>Advance Pay</td>
<td><input type="text" name="advance_pay" id="advance_pay"  value="0" class="form-control" required/></td>
</tr>

<tr>
<td>Leaves in Days</td>
<td><input type="text" name="leaves" id="leaves"  value="0" class="form-control" required/></td>
</tr>

<tr>
<td>Gvnt Tax 6%</td>
<td><input type="text" name="gst" id="gst"  value="0.06" class="form-control" required/></td>
</tr>

<tr>
<td>Other Tax</td>
<td><input type="text" name="other_tax" id="other_tax"  value="0" class="form-control" required/>


</td>
</tr>

<tr  >
<td  colspan="2" id="message">



</td>

</tr>

<tr>
<td></td>
<td>

<input type="submit" name="calculate" id="calculate" onclick="form.action='CalculateDeductionServlet';"  value="Calculate" class="btn btn-warning"/>
<input type="submit" name="save" id="save"  value="Save" onclick="form.action='SaveDeductionServlet'; form.method='POST'" class="btn btn-primary"/></td>
</tr>
</tbody>

</table>
</form>



</div>
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
     
     var advance_pay = $("#advance_pay").val();
     var leaves = $("#leaves").val();
     var gst = $("#gst").val();
     var other_tax = $("#other_tax").val();
     var gross_salary =  $("#gross_salary").val();
     
     
     var value ='advance_pay='+advance_pay + '&leaves='+leaves +'&gst='+gst + '&other_tax='+other_tax +'&gross_salary='+gross_salary;
 
     $.ajax({
     url: "CalculateDeductionServlet",
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





<script type="text/javascript">
    $(document).ready(function() {
     $('#date_of_payment').change(function(e) {
     e.preventDefault();
    
     

     

     var emp_ID = $("#emp_ID2").val();
     var date_of_payment = $("#date_of_payment").val();
   
    
     
     
     var value ='emp_ID='+emp_ID + '&date_of_payment='+date_of_payment;
 
     $.ajax({
     url: "CheckAllowanceServlet",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
     //$("#medical").val('');
     $("#check_message").html(data).slideDown('slow');
     
    
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