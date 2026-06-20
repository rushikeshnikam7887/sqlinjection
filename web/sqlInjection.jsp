<%@ page import="java.sql.*" %>

<%
String accountNo = request.getParameter("accountNo");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://db:3306/testdb?useSSL=false&serverTimezone=UTC",
        "root",
        "root"
    );

    stmt = conn.createStatement();

    // VULNERABLE QUERY
    String query =
        "SELECT name, lastname FROM account WHERE account_no = '" + accountNo;

    out.println("<b>Query:</b> " + query + "<br><br>");

    rs = stmt.executeQuery(query);

    while(rs.next()) {
        out.println("Name: " + rs.getString("name") + "<br>");
        out.println("Last Name: " + rs.getString("lastname") + "<br><br>");
    }

} catch(Exception e) {
    out.println("<b>Error:</b> " + e + "<br>");
}
%>
