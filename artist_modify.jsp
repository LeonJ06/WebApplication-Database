<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>



<%-- delete --%>
<%--
<form method="post" >
    <input name="funcID" type="hidden" value="2"> 
    gallery_id: <input name="gallery_gallery_id" type="text"> 
    name: <input name="gallery_name" type="text"> 
    description: <input name="gallery_description" type="text"> 
    <input type="submit" value="Add"/>
</form>
 --%>


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

<%-- delete --%>
<%
try{

    PreparedStatement pstmt0 = con.prepareStatement("SELECT * FROM artist WHERE artist_id=(?)", Statement.RETURN_GENERATED_KEYS);
    pstmt0.clearParameters();
    pstmt0.setInt(1, Integer.parseInt( request.getParameter("artist_artist_id") ) );        
    ResultSet rs0 = pstmt0.executeQuery();
    while(rs0.next()){

        PreparedStatement pstmt = con.prepareStatement("update artist set name=(?), birth_year=(?), country=(?),description =(?) where artist_id=(?)", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();

        pstmt.setInt(5, Integer.parseInt( request.getParameter("artist_artist_id") ) );

        pstmt.setString(1,request.getParameter("artist_name").length()==0?rs0.getString("name"):request.getParameter("artist_name") );
        pstmt.setInt(2, request.getParameter("artist_birth_year").length()==0?rs0.getInt("birth_year"): Integer.parseInt( request.getParameter("artist_birth_year") ) );
        pstmt.setString(3,request.getParameter("artist_country").length()==0?rs0.getString("country"):request.getParameter("artist_country") );
        pstmt.setString(4,request.getParameter("artist_description").length()==0?rs0.getString("description"):request.getParameter("artist_description") );
        pstmt.executeUpdate();
        ResultSet rs=pstmt.getGeneratedKeys();
        out.println("Successfully modify. artist_description");
        while (rs.next()) {
            out.println("Successfully modify. artist_description:"+rs.getInt(1));
        }
    }
}
catch(Exception e){
    out.println("error!");
    out.println(e.getMessage());
}
%>

<%-- back to index --%>
<form align="center" action="index.jsp">
    <input type="submit" value="Back"/>
</form>