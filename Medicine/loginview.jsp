<%@ page import="java.sql.*" %>
<HTML>
 <HEAD>
 <TITLE>ADMIN VIEW</TITLE>
 <style>
 button{float:left;border-radius:10px;padding:10px;background-color:orange;}
 button{display:inline;margin-left:0px;}
 </style>
 </HEAD>
 <BODY BGCOLOR="cyan">
 <%
String mail=request.getParameter("uname");
String password=request.getParameter("psw");
int count=0;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Anusha");
 Statement st = con.createStatement() ;
%>
<%
 ResultSet resultset = st.executeQuery("select * from login") ;
 %>
 <br>
 <H1>USERS INFO DATABASE TABLE </H1>
 <TABLE BORDER="3" >
 <TR>
 <TH>USERNAME</TH>
 <TH>PASSWORD</TH>

 
 </TR>
 <% while(resultset.next()){ %>
 <TR>
 <TD> <%= resultset.getString(1) %></TD>
 <TD> <%= resultset.getString(2) %></TD>
 
 </TR>
 <%
}
%>
 </TABLE>
 </BODY>
</HTML>
<H1>TOUR BOOKING DATABASE TABLE </H1>
 <%
 ResultSet rs = st.executeQuery("select * from Booking") ;
 %>
 <TABLE BORDER="3" >
 <TR>
 
 <TH>First Name</TH>
 <TH>Last Name</TH>
 <TH>Email</TH>
 <TH>Contact no</TH>
 <TH>Destinations</TH>
 </TR>
 <% while(rs.next()){ %>
 <TR>
 <TD> <%= rs.getString(1) %></td>
 <TD> <%= rs.getString(2) %></TD>
 <TD> <%= rs.getString(3) %></TD>
 <TD> <%= rs.getString(4) %></TD>
 <TD> <%= rs.getString(5) %></TD>

 </TR>
 <%
} 
%>
 </TABLE>
 </BODY> 
</HTML>
 <% 
 }
catch(Exception e) {
       out.print(e);
}
%>