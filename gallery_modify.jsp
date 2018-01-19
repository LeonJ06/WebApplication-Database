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


<%-- delete --%>
<%
try{
    PreparedStatement pstmt0 = con.prepareStatement("SELECT * FROM gallery WHERE gallery_id=(?)", Statement.RETURN_GENERATED_KEYS);
    pstmt0.clearParameters();
    pstmt0.setInt(1, Integer.parseInt( request.getParameter("gallery_gallery_id") ) );        
    ResultSet rs0 = pstmt0.executeQuery();
    while(rs0.next()){

        PreparedStatement pstmt = con.prepareStatement("update gallery set name =(?),description=(?) where gallery_id=(?)", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();

        pstmt.setInt(3, Integer.parseInt( request.getParameter("gallery_gallery_id") ) );
        pstmt.setString(1,request.getParameter("gallery_title").length()==0?rs0.getString("name"):request.getParameter("gallery_title") );
        pstmt.setString(2,request.getParameter("gallery_description").length()==0?rs0.getString("description"):request.getParameter("gallery_description") );
        pstmt.executeUpdate();
        ResultSet rs=pstmt.getGeneratedKeys();
        out.println("Successfully modify. gallery's title and description");
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