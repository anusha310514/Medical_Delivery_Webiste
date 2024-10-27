<%@page import="java.sql.*,java.util.*"%>
<%
String mail=request.getParameter("email");
String phoneno=request.getParameter("phonenumber");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into usertable values(?,?)");
	pst.setString(1,mail);
	pst.setString(2,phoneno);
	pst.executeUpdate();
	if(pst!=null)
	{
		 response.sendRedirect("views/mainpage2.jsp");
	}
	con.close();
}
catch(Exception e)
{
	%>
		<%=e%>
}
<%
}
%>