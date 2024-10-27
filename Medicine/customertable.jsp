<%@page import="java.sql.*,java.util.*"%>
<%
String gmail=request.getParameter("papr_contact_us_email");
String phone=request.getParameter("papr_contact_us_phone");
String text=request.getParameter("text");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into customertable values(?,?,?)");
	pst.setString(1,gmail);
	pst.setString(2,phone);
	pst.setString(3,text);
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