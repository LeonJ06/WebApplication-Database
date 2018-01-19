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
<body bgcolor="dimgray">

<%-- display --%>
<table border="5" width="100%">
<%
try{
    PreparedStatement pstmt = con.prepareStatement("SELECT * from image natural join gallery Where gallery_id=(?) ", Statement.RETURN_GENERATED_KEYS);
    pstmt.clearParameters();
    pstmt.setString(1, request.getParameter("image_gallery_id") );
   
    ResultSet rs=pstmt.executeQuery();
    out.println("<td>picture</td>");
    out.println("<td>image_id</td>");
    out.println("<td>title</td>");
    out.println("<td>link</td>");
    out.println("<td>gallery_id</td>");
    out.println("<td>artist_id</td>");
    out.println("<td>detail_id</td>");
    

    while (rs.next()) {
        out.println("<tr>"); 
        %><td><img src=<%=rs.getString("link")%> width="100px" ></td><%
        out.println("<td>"+rs.getString("image_id")+"</td>");
        out.println("<td>"+rs.getString("title")+"</td>");
        //out.println("<td>"+rs.getString("link")+"</td>");
        %>
        <td><a href="image_display_one.jsp?search_image_id=<%=rs.getString("image_id") %>"><%=rs.getString("link")%></a></td>
        <%
        out.println("<td>"+rs.getString("gallery_id")+"</td>");
        out.println("<td>"+rs.getString("artist_id")+"</td>");
        out.println("<td>"+rs.getString("detail_id")+"</td>");  
        
        out.println("</tr>");
    }
}
catch(Exception e){
    out.println("error!");
    out.println(e.getMessage());
}
%>
</table>

<table border="3" align ="center" width ="10.8%">
<%
try{
    PreparedStatement pstmt2 = con.prepareStatement("SELECT count(*) from image natural join gallery Where gallery_id=(?) ", Statement.RETURN_GENERATED_KEYS);
    pstmt2.clearParameters();
    pstmt2.setString(1, request.getParameter("image_gallery_id") );
    ResultSet rs=pstmt2.executeQuery();

    out.println("<td>sum</td>");
    while (rs.next()) {
        out.println("<tr>"); 
        out.println("<td>"+rs.getString("count(*)")+"</td>");
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

</body>