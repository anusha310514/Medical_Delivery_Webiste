<%@ page import="java.sql.*" %>
<%
String uname = request.getParameter("uname");
String psw = request.getParameter("psw");
String role = "user"; // Default role

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Anusha");
    PreparedStatement pst = con.prepareStatement("INSERT INTO login (MAIL, PASSWORD, ROLE) VALUES (?, ?, ?)");
    pst.setString(1, uname);
    pst.setString(2, psw);
    pst.setString(3, role);
    int result = pst.executeUpdate();
    if (result > 0) {
        response.sendRedirect("views/mainpage2.jsp");
    } else {
        out.print("Error: Unable to sign up.");
    }
    con.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>