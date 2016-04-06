

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
<title>Make Payment</title>
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

 <form method="post" name="frm" action="SearchPayServlet">
 <div class="col-md-8">

<input class="form-control"  type="text" name="emp_ID" id="emp_ID" placeholder="Search Employee By ID eg. Emp001" required >
</div>

 <div class="col-md-4">
 
 <input type="month" name="date_of_payment" id="date_of_payment" required title="Please select the appropriate month of payment" />
<input type="hidden" name="source_url" id="source_url" value="/makepayment.jsp" />
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
<div class="col-md-5" id="printable" style="background-color:#cff9fc">

<h1 style="text-align: center">IBM Sdn Bhd</h1>

<p><strong>Address:</strong>   Jalan Teknokrat 3, 63000 Cyberjaya, Selangor, Malaysia</p>

<p><strong>Phone:</strong> +60 3-2301 8888</p>

<p style="text-align: right"><i><%
   Date date = new Date();
   out.print( "<span align=\"right\">" +date.toString()+"</span>");
%></i></p>


 <form method="post" action="MakePaymentServlet" > 	
<table  class="table table-striped table-bordered" cellspacing="0" width="100%">

<tr><td><strong>Employee ID:</strong> </td><td><%=recordList.get(1)%>
<input type="hidden" name="payslip_id" id="payslip_id" value="<%=recordList.get(0)%>" />
<input type="hidden" name="emp_ID" id="emp_ID" value="<%=recordList.get(1)%>" />

</td></tr>

<tr><td><strong>Payment for:</strong> </td><td><%=recordList.get(2)%>
<input type="hidden" name="payment_for" id="payment_for" value="<%=recordList.get(2)%>" />


</td></tr>

<tr><td><strong>Gross Salary:</strong> </td><td><%=recordList.get(3)%>
<input type="hidden" name="gross_salary" id="gross_salary" value="<%=recordList.get(3)%>" />
</td></tr>

<tr><td><strong>Total Allowances:</strong> </td><td><%=recordList.get(4)%>

<input type="hidden" name="allowances" id="allowances" value="<%=recordList.get(4)%>" />
</td></tr>

<tr><td><strong>Total Deductions:</strong> </td><td><%=recordList.get(5)%>

<input type="hidden" name="deductions" id="deductions" value="<%=recordList.get(5)%>" />

</td></tr>

<tr><td><strong></strong> </td><td><hr></td></tr>
<tr style="color:red"><td  ><strong>Net Salary:</strong> </td><td><%=recordList.get(6)%>
<input type="hidden" name="net_salary" id="net_salary" value="<%=recordList.get(6)%>" />
<br>
<hr style="color:red; width: 100%;" color="black">
</td></tr>
</table>
<br>
<button type="button" class="btn btn-warning print">Print PaySlip</button> <input class=
"btn btn-primary" type="submit" id="make_payment" name="make_payment" value="Make Payment">
</form>






	
</div>
<div class="col-md-2"></div>
<div class="col-md-5">



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
<script type='text/javascript'>

$(function() {

$("#printable").find('.print').on('click', function() {

$.print("#printable");

});

});

</script>

  <script src="js/jQuery.print.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>

<%

}
%>