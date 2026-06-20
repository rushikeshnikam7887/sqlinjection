<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Secure Search Results</title>
</head>
<body>

<%
String accountNo = request.getParameter("accountNo");

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://db:3306/testdb?useSSL=false&serverTimezone=UTC",
        "root",
        "root"
    );

    String query = "SELECT name, lastname FROM account WHERE account_no = ?";
    ps = conn.prepareStatement(query);
    ps.setString(1, accountNo);

    rs = ps.executeQuery();

    out.println("<h4>Results for Account No: " + accountNo + "</h4>");

    boolean found = false;

    while (rs.next()) {
        found = true;
        out.println("Name: " + rs.getString("name") + "<br>");
        out.println("Last Name: " + rs.getString("lastname") + "<br><br>");
    }

    if (!found) {
        out.println("No account found.");
    }

} catch(Exception e) {
    out.println("<b>Error:</b> " + e);
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(conn != null) conn.close(); } catch(Exception e){}
}
%>

</body>
</html>
