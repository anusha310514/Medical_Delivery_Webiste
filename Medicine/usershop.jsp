<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Shop List</title>
  <style>
    .shop-card {
      display: inline-block;
      width: 25%;
      margin: 7px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      text-align: center;
    }
  </style>
</head>
<body>
  <center>
<h1>SHOP SELECTION</h1>
<hr>
</center>
  <%
    Connection conn = null;
    try 
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
      conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM adminshop");
	int count = 0;
      while (rs.next()) {
        String shopName = rs.getString("name");
        String address = rs.getString("address");
        if (count % 3 == 0) {
              if (count > 0) {
                out.println("</div>");
              }
              out.println("<div class=\"row\">");
        }
        out.println("<div class=\"shop-card\">");	  
        out.println("<a href=\"addmedicine1.jsp\">");
        out.println("<img src=\"images/shopnames/shop1.jpg\" alt=\"shop1\" style=\"width:92%\"></a>");
        out.println("<p><strong>Shop Name:</strong> " + shopName + "</p>");
        out.println("<p><strong>Address:</strong> " + address + "</p>");
        out.println("</div>");
	      count++;
    	} 
      if (count % 3 != 0) {
        out.println("</div>");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      if (conn != null) {
        try {
          conn.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
    }
  %>
</body>
</html>
