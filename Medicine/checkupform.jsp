<%@page import="java.sql.*,java.util.*"%>
<%
String fname=request.getParameter("uname");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String problem=request.getParameter("problem");
String address=request.getParameter("address");
String phno=request.getParameter("phno");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into checkupform values(?,?,?,?,?,?)");
	pst.setString(1,fname);
	pst.setString(2,age);
	pst.setString(3,gender);
	pst.setString(4,problem);
	pst.setString(5,address);
	pst.setString(6,phno);
	pst.executeUpdate();
	if(pst!=null)
	{
		 response.sendRedirect("views/checkuppage.html");
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