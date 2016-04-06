
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
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
<title>Expenditure By Month Report</title>
<!-- Basic CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/style.css" rel="stylesheet">


</head>
<body>

<!-- Navigation Bar -->
<jsp:include page="nav.jsp"></jsp:include>

<div class="container">
<div class="col-md-12" id="printable">
<h1>Expenditure Report</h1>

<input type="month" name="payment_for" id="payment_for">
<br>


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
<table border="1"   class="table table-striped table-bordered" cellspacing="0" width="100%">
           
           
          <thead>
            <tr>
                <th><strong>Payment ID</strong></th>
                <th><strong>Pay Slip ID</strong></th>
                 <th><strong>Employee ID</strong></th>
                <th><strong>Payment For</strong></th>
                <th><strong>Gross Salary</strong></th>
              <th><strong>Allowances</strong></th>
              <th><strong>Deductions</strong></th>
               <th><strong>Net Salary</strong></th>
               
            </tr>
        </thead>    
        
       



<tbody>       

  
    <tr>
      <td> <%=recordList.get(1)%></td>
      <td> <%=recordList.get(1)%></td>
      <td> <%=recordList.get(1)%></td>
      <td> <%=recordList.get(1)%></td>
      <td>RM  <%=recordList.get(1)%>></td>
      <td>RM  <%=recordList.get(1)%></td>
       <td>RM  <%=recordList.get(1)%></td>
        <td>RM  <%=recordList.get(1)%></td>
      
    
<tr>


  

   <tr>
  <td><strong><span style="color:red;">Total Expenditure</span></strong></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
       <td></td>
        <td>  
 <strong><span style="color:red;">RM   </span></strong>
    
    </td>

</tr>
</tbody>
   
   

</table>


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

<br>
<button type="button" class="btn btn-warning print">Print Report</button>



</div>



</div>




 <!-- jQuery -->
    <script src="js/jquery.js"></script>

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