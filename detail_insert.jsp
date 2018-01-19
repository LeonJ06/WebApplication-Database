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
<style>
body {
    background-image: url("http://www.union-gallery.com/layout/img/union_body_bc.jpg");
    background-repeat: non-repeat;
    background-attachment: fixed;
    background-position: center;
}
</style>
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


<%-- Insert --%>
<%

   PreparedStatement pstmt = con.prepareStatement("insert into detail values (default,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
   pstmt.clearParameters();
   pstmt.setInt(1, Integer.parseInt( request.getParameter("image_id") ) );
   pstmt.setInt(2, Integer.parseInt( request.getParameter("image_year") ) );
   pstmt.setString(3, request.getParameter("image_type"));
   pstmt.setInt(4, Integer.parseInt( request.getParameter("image_width") ) );
   pstmt.setInt(5, Integer.parseInt( request.getParameter("image_height") ) );
   pstmt.setString(6, request.getParameter("image_location"));
   pstmt.setString(7, request.getParameter("image_description"));
   pstmt.executeUpdate();
   ResultSet rs=pstmt.getGeneratedKeys();
   while (rs.next()) {
   out.println("Successfully added. detail_id:"+rs.getInt(1));

   PreparedStatement pstmt2 = con.prepareStatement("UPDATE image SET detail_id=(?) WHERE image_id=(?)", Statement.RETURN_GENERATED_KEYS);
   pstmt2.clearParameters();
   pstmt2.setInt(1,  rs.getInt(1)  );
   pstmt2.setInt(2, Integer.parseInt( request.getParameter("image_id") ) );
   pstmt2.executeUpdate();


   }



%>

<%-- go back --%>
<form align="center" action="index.jsp">
    <input type="submit" value="Back"/>
</form>


