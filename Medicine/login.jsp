<%@ page import="java.sql.*, javax.servlet.http.HttpSession, javax.servlet.ServletException, java.io.IOException" %>

<%
    String username = request.getParameter("uname");
    String password = request.getParameter("psw");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Anusha");

        PreparedStatement pst = conn.prepareStatement("SELECT ROLE FROM login WHERE MAIL = ? AND PASSWORD = ?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            String role = rs.getString("ROLE");

            // Check if session already exists
            HttpSession session1 = request.getSession(false); // retrieve existing session
            
            if (session1 == null) {
                // Create a new session if one does not exist
                session1 = request.getSession(true);
            }

            // Store user information in session attributes
            session1.setAttribute("username", username);
            session1.setAttribute("role", role);

            // Redirect to main page
            response.sendRedirect("views/mainpage2.jsp");
        } else {
            // Invalid username or password
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Username or Password');");
            out.println("location='views/login.html';");
            out.println("</script>");
        }

        // Close resources
        rs.close();
        pst.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>