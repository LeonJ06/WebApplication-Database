<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>


<%-- input --%>

<form method="post" >
    <input name="funcID" type="hidden" value="2"> 
    name: <input name="artist_name" type="text">
    birth_year: <input name="artist_birth_year" type="text"> 
    country: <input name="artist_country" type="text"> 
    description: <input name="artist_description" type="text"> 
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
    if(request.getMethod().equals("POST") ){
        PreparedStatement pstmt = con.prepareStatement("insert into artist values (default,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, request.getParameter("artist_name"));
        pstmt.setString(2, request.getParameter("artist_birth_year"));
        pstmt.setString(3, request.getParameter("artist_country"));
        pstmt.setString(4, request.getParameter("artist_description"));
        pstmt.executeUpdate();
        ResultSet rs=pstmt.getGeneratedKeys();
        while (rs.next()) {
            out.println("Successfully added. artist_id:"+rs.getInt(1));
        }
    }
}
catch(Exception e){
    out.println(e.getMessage());
}
%>

<%-- go back --%>
<form align="center" action="index.jsp">
    <input type="submit" value="Back"/>
</form>


