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

        PreparedStatement pstmt = con.prepareStatement("delete from gallery where gallery_id=(?)", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setInt(1, Integer.parseInt( request.getParameter("gallery_gallery_id") ) );
        pstmt.executeUpdate();
        ResultSet rs=pstmt.getGeneratedKeys();
        out.println("Successfully delete. Gallery ID:"+request.getParameter("gallery_gallery_id"));

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