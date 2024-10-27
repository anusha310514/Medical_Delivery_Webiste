<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
String shopname=request.getParameter("shopname");
String shopid=request.getParameter("shopid");
String phoneno=request.getParameter("phno");
String address=request.getParameter("address");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
	PreparedStatement pst=con.prepareStatement("insert into adminshop values(?,?,?,?,?)");
	pst.setString(1,name);
	pst.setString(2,shopname);
	pst.setString(3,shopid);
	pst.setString(4,phoneno);
	pst.setString(5,address);
	pst.executeUpdate();
	if(pst!=null)
	{
		 out.print("views/adminmedicineform.html");
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
  response.sendRedirect("addshop.jsp"); // Redirect to the shop list page
%>