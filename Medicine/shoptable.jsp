<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
String shopid=request.getParameter("shopid");
String area=request.getParameter("area");
String pincode=request.getParameter("pincode");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into shoptable values(?,?,?,?)");
	pst.setString(1,name);
	pst.setString(2,shopid);
	pst.setString(3,area);
	pst.setString(4,pincode);
	pst.executeUpdate();
	if(pst!=null)
	{
		response.sendRedirect("views/adminshop.html");
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