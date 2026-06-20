<%@ page import="java.sql.*" %>

<%
String account = request.getParameter("account no");

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

    // INTENTIONALLY VULNERABLE + BROKEN
	String query = "SELECT name, lastname FROM account WHERE city = '" + account no;
	// Enter this: ' UNION SELECT USERNAME, PASSWORD FROM users 

    out.println("<b>Query:</b> " + query + "<br><br>");

    rs = stmt.executeQuery(query);

    while(rs.next()) {
        out.println(rs.getString("name") + "<br>");
		out.println(rs.getString("lastname") + "<br>");		
    }

} catch(Exception e) {
    out.println("<b>Error:</b> " + e + "<br>");
}
%>
