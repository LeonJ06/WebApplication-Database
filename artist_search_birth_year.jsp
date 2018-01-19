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


<style>
body {
    background-image: url("http://www.union-gallery.com/layout/img/union_body_bc.jpg");
    background-repeat: non-repeat;
    background-attachment: fixed;
    background-position: center;
}
</style>


<%-- display --%>

<%
try{
   PreparedStatement pstmt = con.prepareStatement("SELECT * from artist Where birth_year=(?)", Statement.RETURN_GENERATED_KEYS);
   pstmt.clearParameters();
   pstmt.setString(1, request.getParameter("artist_birth_year") );
   
   ResultSet rs=pstmt.executeQuery();

%>
<table border =1 align="center">
<%

        out.println("<td>artist_id</td>"); 
        out.println("<td>name</td>");
        out.println("<td>birth_year</td>"); 
        out.println("<td>country</td>");  
        out.println("<td>description</td>"); 

    while (rs.next()) {
        out.println("<tr>"); 
        out.println("<td>"+rs.getString("artist_id")+"</td>"); 
        //out.println("<td>"+rs.getString("name")+"</td>");
        %>
        <td><a href="artist_display_one.jsp?search_artist_id=<%=rs.getString("artist_id") %>"><%=rs.getString("name")%></a></td>
        <%
        out.println("<td>"+rs.getString("birth_year")+"</td>"); 
        out.println("<td>"+rs.getString("country")+"</td>");  
        out.println("<td>"+rs.getString("description")+"</td>");  
        out.println("</tr>");
    }

}
catch(Exception e){
    out.println("error!");
    out.println(e.getMessage());
}
%>
</table>

<%-- go back --%>
<form align="center" action="index.jsp">
    <input type="submit" value="Back"/>
</form>