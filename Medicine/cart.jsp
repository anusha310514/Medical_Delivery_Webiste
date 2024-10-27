<%@ page import="java.util.*" %>
<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    String composition = request.getParameter("composition");
    String price = request.getParameter("price");

    if (action != null && name != null && composition != null && price != null) {
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("add".equals(action)) {
            // Add item to cart
            Map<String, String> item = new HashMap<>();
            item.put("name", name);
            item.put("composition", composition);
            item.put("price", price);
            cart.add(item);
        } else if ("remove".equals(action)) {
            // Remove item from cart
            cart.removeIf(item -> item.get("name").equals(name));
        }

        session.setAttribute("cart", cart);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            padding: 0;
        }
        .cart {
            width: 80%;
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .checkout {
            text-align: right;
        }
        .checkout button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }
        .checkout button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="cart">
        <h2>Shopping Cart</h2>
        <table>
            <thead>
                <tr>
                    <th>Medicine</th>
                    <th>Composition</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
                    if (cart != null) {
                        for (Map<String, String> item : cart) {
                %>
                <tr>
                    <td><%= item.get("name") %></td>
                    <td><%= item.get("composition") %></td>
                    <td>$<%= item.get("price") %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <div class="checkout">
            <button>Proceed to Checkout</button>
        </div>
    </div>
</body>
</html>