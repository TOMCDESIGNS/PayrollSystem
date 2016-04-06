<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    String roles = request.getParameter("roles");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Payroll",
            "root", "123456");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users_tb where username='" + username + "' and password ='" + password+ "' and roles='"+ roles +"'" );
    if (rs.next()) {
        session.setAttribute("username", username);
        session.setAttribute("roles", roles);
      
       
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.jsp");
    } else {
        out.println("You are not authorized to view this page <a href='login.jsp'>Login Again With Other Credentials again</a>");
    }
%>