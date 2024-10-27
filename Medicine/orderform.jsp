<%@page import="java.sql.*,java.util.*"%>
<%
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String age=request.getParameter("age");
String medicine=request.getParameter("medicine");
String address=request.getParameter("address");
String phno=request.getParameter("phno");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into Orderform values(?,?,?,?,?,?)");
	pst.setString(1,fname);
	pst.setString(2,lname);
	pst.setString(3,age);
	pst.setString(4,medicine);
	pst.setString(5,address);
	pst.setString(6,phno);
	pst.executeUpdate();
	if(pst!=null)
	{
		 response.sendRedirect("addmedicine1.jsp");
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