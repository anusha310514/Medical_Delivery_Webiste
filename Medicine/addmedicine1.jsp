<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Medicine</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 20px;
      background-color: #004d99;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      color: white;
    }

    header .logo {
      font-size: 24px;
      font-weight: bold;
    }

    header .header-right {
      display: flex;
      align-items: center;
    }

    header .header-right a {
      text-decoration: none;
      color: white;
      margin-left: 20px;
      padding: 10px 20px;
      border: 1px solid white;
      border-radius: 5px;
      transition: background-color 0.3s, color 0.3s;
    }

    header .header-right a:hover {
      background-color: white;
      color: #004d99;
    }

    .cart {
      margin-top: 20px;
    }
  </style>
</head>
<body style='background-color: lavender;' text="indigo">

<header>
  <div class="logo">SELECT MEDICINE</div>
  <div class="header-right">
    <a href="login.html">Login</a>
    <a href="cart.jsp">Shopping Cart</a>
  </div>
</header>


<%
  Connection conn = null;
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Anusha");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM adminmedicine");

    int count = 0;
    while (rs.next()) {
      String Name = rs.getString("name");
      String composition = rs.getString("composition");
      double price = rs.getDouble("price");

      if (count % 3 == 0) {
        if (count > 0) {
          out.println("</div>");
        }
        out.println("<div class=\"row\">");
      }

      out.println("<div class=\"shop-card\">");
      out.println("<img src=\"images/tablets/expro.jpg\" alt=\"medicines\" style=\"width:92%\">");
      out.println("<h3><strong>Medicine:</strong> " + Name + "</h3>");
      out.println("<p><strong>Composition:</strong> " + composition + "</p>");
      out.println("<p><strong>Price:</strong> $" + price + "</p>");

      // Add form for adding to cart
      out.println("<form class=\"cartForm\" method=\"post\">");
      out.println("<input type=\"hidden\" name=\"name\" value=\"" + Name + "\">");
      out.println("<input type=\"hidden\" name=\"composition\" value=\"" + composition + "\">");
      out.println("<input type=\"hidden\" name=\"price\" value=\"" + price + "\">");
      out.println("<button type=\"button\" class=\"addToCart\" data-action=\"add\">Add</button>");
      out.println("<button type=\"button\" class=\"removeFromCart\" data-action=\"remove\">Remove</button>");
      out.println("</form>");

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

<script>
$(document).ready(function() {
  $('.addToCart, .removeFromCart').click(function() {
    var form = $(this).closest('.cartForm');
    var action = $(this).data('action');
    var name = form.find('input[name="name"]').val();
    var composition = form.find('input[name="composition"]').val();
    var price = form.find('input[name="price"]').val();

    $.ajax({
      url: 'cart.jsp',
      method: 'POST',
      data: {
        action: action,
        name: name,
        composition: composition,
        price: price
      },
      success: function(response) {
        // Update the cart table with the response
        $('#cartTable tbody').html(response);
      }
    });
  });
});
</script>

</body>
</html>