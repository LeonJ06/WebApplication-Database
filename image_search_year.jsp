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
<table border = 1 align="center">
<%
try{
    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM image join detail WHERE image.image_id = detail.image_id and year<=(?) and year>=(?)", Statement.RETURN_GENERATED_KEYS);
    pstmt.clearParameters();
    pstmt.setInt(1, Integer.parseInt( request.getParameter("image_year_upper") ) );
    pstmt.setInt(2, Integer.parseInt( request.getParameter("image_year_lower") ) );
   
    ResultSet rs=pstmt.executeQuery();

        out.println("<td>image_id</td>"); 
        out.println("<td>title</td>");
        out.println("<td>link</td>"); 
        out.println("<td>gallery_id</td>");  
        out.println("<td>artist_id</td>");
        out.println("<td>detail_id</td>");    
        out.println("<td>picture</td>"); 

    while (rs.next()) {
        out.println("<tr>"); 
        out.println("<td>"+rs.getInt("image_id")+"</td>"); 
        out.println("<td>"+rs.getString("title")+"</td>");
        %>
        <td><a href="image_display_one.jsp?search_image_id=<%=rs.getString("Image_id") %>"><%=rs.getString("link")%></a></td>
        <%
        //out.println("<td>"+rs.getString("link")+"</td>"); 
        out.println("<td>"+rs.getInt("gallery_id")+"</td>");  
        out.println("<td>"+rs.getInt("artist_id")+"</td>");
        out.println("<td>"+rs.getInt("detail_id")+"</td>");
        %><td><img src=<%=rs.getString("link")%> width="100px" ></td><%  
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


<br><br><Br><BR><br><br><br><BR><BR><BR><BR>