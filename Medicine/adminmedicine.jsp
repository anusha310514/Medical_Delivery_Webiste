<%@page import="java.sql.*,java.util.*"%>
<%
String shopid=request.getParameter("shopid");
String name=request.getParameter("name");
String composition=request.getParameter("composition");
String quaninty=request.getParameter("quaninty");
String price=request.getParameter("price");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into adminmedicine values(?,?,?,?,?)");
	pst.setString(1,shopid);
	pst.setString(2,name);
	pst.setString(3,composition);
	pst.setString(4,quaninty);
	pst.setString(5,price);
	pst.executeUpdate();
	if(pst!=null)
	{
		 out.print("views/addmedicine.html");
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
response.sendRedirect("addmedicine.jsp");
%>