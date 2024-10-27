<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Medicine</title>
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
<body style='background-color: grey;'>
<center>
<h1>MEDICINE SELECTION</h1>
<hr>
</center>

	
  <%
    Connection conn = null;
    try 
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
      conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Anusha");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM adminmedicine");

	int count=0;
      while (rs.next()) {
        String Name = rs.getString("name");
        String composition = rs.getString("composition");
		if (count % 3 == 0) {
          if (count > 0) {
            out.println("</div>");
          }
          out.println("<div class=\"row\">");
        }
	  out.println("<div class=\"shop-card\">");
	  out.println("<img src=\"images/tablets/expro.jpg\" alt=\"meghana\" style=\"width:92%\"");
        out.println("<h3><strong>Shop Name:</strong> " + Name + "</h3>");
        out.println("<p><strong>Address:</strong> " + composition + "</p>");
	  out.println("</div>");

	  count++;

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
