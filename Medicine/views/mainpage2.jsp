<!DOCTYPE html>
<html>
<head>
<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  color: #333;
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

.parent {
  padding: 2rem 2rem;
  text-align: center;
}

.child {
  display: inline-block;
  border: 2px solid orange;
  padding: 1rem 1rem;
  vertical-align: middle;
}

img {
  border: 3px solid black;
  border-radius: 8px;
  padding: 5px;
  width: 150px;
  transition: box-shadow 0.3s;
}

img:hover {
  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

div.polaroid {
  width: calc(33.33% - 20px);
  background-color: #ffffff;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin: 10px;
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.3s;
}

div.polaroid:hover {
  transform: translateY(-10px);
}

div.container {
  text-align: center;
  padding: 10px 20px;
}

.row {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.row img {
  width: 100px;
  height: 200px;
  margin: 15px;
}
</style>
</head>
<body>

  <header>
    <div class="logo">MEDICAL DELIVERY</div>
    <div class="header-right">
      <% 
          String role = (String) session.getAttribute("role");
          if (role != null) {
              if (role.equals("admin")) {
      %>
      
      <a href="adminshop.html">Add Shop</a>
      <% 
              }
      %>
      <a href="../logout.jsp">Logout</a>
      <% 
          } else {
      %>
      <a href="login.html">Login</a>
      <% 
          }
      %>
      <a href="../cart.jsp">Shopping Cart</a>
    </div>
  </header>

<div class="row">
  <div class="polaroid">
    <a href="../usershop.jsp">
      <img src="../images/Other/order.jpg" alt="order" style="width:92%">
      <div class="container">
        <p>ORDER</p>
      </a>
      <div class='parent'>
        <div class='child' style="background-color:#F6BA6F;">
          <span class="label call"><a href="Contact.html">REQUEST A CALL</a></span>
        </div>
      </div>
    </div>
  </div>

  <div class="polaroid">
    <a href="checkuppage.html">
      <img src="../images/Other/checkup.jpg" alt="checkup" style="width:92%">
      <div class="container">
        <p>CHECKUP</p>
        <div class='parent'>
          <div class='child' style="background-color:#F6BA6F;">
            <span class="label call"><a href="Contact.html">REQUEST A CALL</a></span>
          </div>
        </div>
      </div>
    </a>
  </div>

  <div class="polaroid">
    <a href="bloodtestform.html">
      <img src="../images/Other/bloodtest.jpg" alt="bloodtest" style="width:92%">
      <div class="container">
        <p>BLOODTEST</p>
        <div class='parent'>
          <div class='child' style="background-color:#F6BA6F;">
            <span class="label call"><a href="Contact.html">REQUEST A CALL</a></span>
          </div>
        </div>
      </div>
    </a>
  </div>
</div>

<div class="row">
  <div class="polaroid">
    <a href="doctorform.html">
      <img src="../images/Other/doctorhome.jpg" alt="order" style="width:92%">
      <div class="container">
        <p>DOCTOR AT YOUR HOME</p>
        <div class='parent'>
          <div class='child' style="background-color:#F6BA6F;">
            <span class="label call"><a href="Contact.html">REQUEST A CALL</a></span>
          </div>
        </div>
      </div>
    </a>
  </div>

  <div class="polaroid">
    <a href="customer.html">
      <img src="../images/Other/customercare.jpg" alt="customercare" style="width:92%">
      <div class="container">
        <p>CUSTOMER CARE</p>
        <div class='parent'>
          <div class='child' style="background-color:#F6BA6F;">
            <span class="label call"><a href="Contact.html">REQUEST A CALL</a></span>
          </div>
        </div>
      </div>
    </a>
  </div>

  <div class="polaroid">
    <a href="healthpart.html">
      <img src="../images/Other/healthblog.jpg" alt="bloodtest" style="width:92%">
      <div class="container">
        <p>HEALTH BLOG</p>
        <div class='parent'>
          <div class='child' style="background-color:#F6BA6F;">
            <span class="label call"><a href="Contact.html">REQUEST A CALL</a></span>
          </div>
        </div>
      </div>
    </a>
  </div>
</div>

</body>
</html>