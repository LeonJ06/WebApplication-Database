<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<style>
body {
    background-image: url("http://www.union-gallery.com/layout/img/union_body_bc.jpg");
    background-repeat: non-repeat;
    background-attachment: fixed;
    background-position: center;
}
</style>

<%-- input --%>

<form method="post" >
    <input name="funcID" type="hidden" value="2"> 
    <%-- gallery_id: <input name="gallery_gallery_id" type="text">  --%>
    name: <input name="gallery_name" type="text"> 
    description: <input name="gallery_description" type="text"> 
    <input type="submit" value="Add"/>
</form>


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

<%-- Insert --%>
<%
if(request.getMethod().equals("POST") ){
   PreparedStatement pstmt = con.prepareStatement("insert into gallery values (default,?,?)", Statement.RETURN_GENERATED_KEYS);
   pstmt.clearParameters();
   //pstmt.setInt(1, Integer.parseInt( request.getParameter("gallery_gallery_id") ) );
   pstmt.setString(1, request.getParameter("gallery_name"));
   pstmt.setString(2, request.getParameter("gallery_description"));
   pstmt.executeUpdate();
   ResultSet rs=pstmt.getGeneratedKeys();
   while (rs.next()) {
   out.println("Successfully added. gallery_id:"+rs.getInt(1));

   }
}
%>

<%-- go back --%>
<form align="center" action="index.jsp">
    <input type="submit" value="Back"/>
</form>


