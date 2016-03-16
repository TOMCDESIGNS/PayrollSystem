
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
<input type="hidden" name="source_url" id="source_url" value="/allowance.jsp" />
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
<div class="col-md-5"><h1>Allowance</h1>

 <form name="sub" action="" id="sub">
<p>Bonus and incentives for the month of    <input type="month" name="date_of_payment" id="date_of_payment" required title="Please select the appropriate month to add the allowances" />

<input type="hidden" id="emp_ID" name="emp_ID" value="<%=recordList.get(1)%>" class="form-control" required readonly  />

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
<td>Salary</td>
<td><input type="text" id="gross_salary" name="gross_salary" value="<%=recordList.get(11)%>" class="form-control" readonly required/></td>
</tr>
<tr>
<td>Overtime</td>
<td><input type="text" name="overtime" id="overtime"  value="0" class="form-control" required/></td>
</tr>

<tr>
<td>Medical</td>
<td><input type="text" name="medical" id="medical"  value="0" class="form-control" required/></td>
</tr>

<tr>
<td>Lunch</td>
<td><input type="text" name="lunch" id="lunch"  value="0" class="form-control" required/></td>
</tr>

<tr>
<td>Bonus</td>
<td><input type="text" name="bonus" id="bonus"  value="0" class="form-control" required/>


</td>
</tr>

<tr  >
<td  colspan="2" id="message">



</td>

</tr>

<tr>
<td></td>
<td>

<input type="submit" name="calculate" id="calculate" onclick="form.action='calculateServlet';AddToGross();"  value="Calculate" class="btn btn-warning"/>
<input type="submit" name="save" id="save"  value="Save" onclick="form.action='SaveAllowanceServlet'; form.method='POST'" class="btn btn-primary"/></td>
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