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
<%-- Insert --%>
<%
try{
        PreparedStatement pstmt = con.prepareStatement("insert into image values (default,?,?,?,?,null)", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, request.getParameter("image_title"));
        pstmt.setString(2, request.getParameter("image_link"));
        pstmt.setInt(3, Integer.parseInt( request.getParameter("image_gallery_id")));
        pstmt.setInt(4, Integer.parseInt( request.getParameter("image_artist_id")));
        //pstmt.setInt(5, Integer.parseInt( request.getParameter("image_detail_id")));
        pstmt.executeUpdate();
        ResultSet rs=pstmt.getGeneratedKeys();
        while (rs.next()) {
        out.println("Successfully added. image_id:"+rs.getInt(1));
        }

        %>
        <form method="post"  action="detail_insert.jsp">

            Image_id:&emsp;<input type="text" name = "image_id"/>
            Year:&emsp;&emsp;<input type="text" name = "image_year"/>
            Type:&emsp;&emsp;&emsp;<input type="text" name = "image_type"/>
            Width:<input type="text" name = "image_width"/><br>
            Height:&emsp;&emsp;<input type="text" name = "image_height"/>
            Location:&ensp;<input type="text" name = "image_location"/>
            Description:<input type="text" name = "image_description"/>
            <input type="submit" value="Insert detail"/>
        </form>
        <%

}
catch(Exception e){
    out.println("error!");
    out.println(e.getMessage());
}
%>

<%-- go back --%>
<form align="center" action="index.jsp">
    <input type="submit" value="Back"/>
</form>


