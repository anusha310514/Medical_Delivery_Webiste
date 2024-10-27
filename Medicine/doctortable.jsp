<%@page import="java.sql.*,java.util.*"%>
<%
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String gender=request.getParameter("age");
String address=request.getParameter("address");
String city=request.getParameter("city");
String phno=request.getParameter("phno");
String problem=request.getParameter("problem");
String doctor=request.getParameter("doctor");
String doctortype=request.getParameter("doctortype");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into doctortable values(?,?,?,?,?,?,?,?,?)");
	pst.setString(1,fname);
	pst.setString(2,lname);
	pst.setString(3,gender);
	pst.setString(4,address);
	pst.setString(5,city);
	pst.setString(6,phno);
	pst.setString(7,problem);
	pst.setString(8,doctor);
	pst.setString(9,doctortype);
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