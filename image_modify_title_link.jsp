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


<%-- update --%>
<%
try{
        PreparedStatement pstmt0 = con.prepareStatement("SELECT * FROM image WHERE image_id=(?)", Statement.RETURN_GENERATED_KEYS);
        pstmt0.clearParameters();
        pstmt0.setInt(1, Integer.parseInt( request.getParameter("modify_image_id") ) );
        
        ResultSet rs0 = pstmt0.executeQuery();
        while(rs0.next()){
            PreparedStatement pstmt = con.prepareStatement("UPDATE image SET title =(?), link=(?), gallery_id=(?), artist_id=(?), detail_id=(?) WHERE image_id=(?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.clearParameters();
            
            pstmt.setInt(6, Integer.parseInt( request.getParameter("modify_image_id") ) );

            
            pstmt.setString(1,request.getParameter("modify_image_title").length()==0?rs0.getString("title"):request.getParameter("modify_image_title") );
            pstmt.setString(2,request.getParameter("modify_image_link").length()==0?rs0.getString("link"):request.getParameter("modify_image_link") );
            pstmt.setInt(3,Integer.parseInt( request.getParameter("modify_image_gallery_id").length()==0?rs0.getString("gallery_id"):request.getParameter("modify_image_gallery_id") ) );
            pstmt.setInt(4,Integer.parseInt( request.getParameter("modify_image_artist_id").length()==0?rs0.getString("artist_id"):request.getParameter("modify_image_artist_id") ) );
            pstmt.setInt(5,Integer.parseInt( request.getParameter("modify_image_detail_id").length()==0?rs0.getString("detail_id"):request.getParameter("modify_image_detail_id") ) );
            pstmt.executeUpdate();
            ResultSet rs=pstmt.getGeneratedKeys();
            out.println("Successfully modify. image_description");
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