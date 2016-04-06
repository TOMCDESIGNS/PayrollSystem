<%
session.setAttribute("username", null);
session.setAttribute("roles", null);

session.invalidate();
response.sendRedirect("login.jsp");
%>