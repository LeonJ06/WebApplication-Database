<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>


<%-- Load SQL driver --%>
<%
try { 
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   }
   catch(Exception e) {
   out.println("can't load mysql driver"); 
   out.println(e.toString());
}
%>

<%-- login --%>
<%
String url="jdbc:mysql://127.0.0.1:3306/gallery"; 
String id="gallery"; 
String pwd="eecs118";
Connection con= DriverManager.getConnection(url,id,pwd);
%>

<%-- display --%>
<table border="1">
<%
Statement stmt = con.createStatement();
String sql="SELECT * FROM image"; 
ResultSet rs=stmt.executeQuery(sql);

    out.println("<td>image_id</td>");
    out.println("<td>title</td>");
    out.println("<td>link</td>");
    out.println("<td>gallery_id</td>");
    out.println("<td>artist_id</td>");
    out.println("<td>detail_id</td>");
    
while (rs.next()) {
    out.println("<tr>"); 
    out.println("<td>"+rs.getString("image_id")+"</td>");
    out.println("<td>"+rs.getString("title")+"</td>");
    out.println("<td>"+rs.getString("link")+"</td>");
    out.println("<td>"+rs.getString("gallery_id")+"</td>");
    out.println("<td>"+rs.getString("artist_id")+"</td>");
    out.println("<td>"+rs.getString("detail_id")+"</td>");  
    out.println("</tr>");
}

%>
</table>

<%-- go back --%>
<form align="center" action="index.jsp">
    <input type="submit" value="Back"/>
</form>