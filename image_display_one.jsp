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
<body bgcolor = "dimgray">
<%
try{
   PreparedStatement pstmt = con.prepareStatement("SELECT * FROM artist natural join image as X, detail WHERE X.image_id=(?) and X.detail_id = detail.detail_id", Statement.RETURN_GENERATED_KEYS);
   pstmt.clearParameters();
   pstmt.setString(1, request.getParameter("search_image_id") );
   
   ResultSet rs=pstmt.executeQuery();

%>
<table border =1 align="center">
<%
        
        out.println("<td>artist name</td>");
        out.println("<td>title</td>"); 
        out.println("<td>detail_id</td>"); 
        out.println("<td>image_id</td>");  
        out.println("<td>year</td>");  
        out.println("<td>type</td>"); 
        out.println("<td>width</td>"); 
        out.println("<td>height</td>"); 
        out.println("<td>location</td>"); 
        out.println("<td>description</td>"); 

    while (rs.next()) {
        out.println("<tr>"); 

        %>
        <td><a href="artist_display_one.jsp?search_artist_id=<%=rs.getString("artist_id") %>"> <%=rs.getString("name")%> </a></td>
        <td><%=rs.getString("title")%></td>
        <%
        //out.println("<td>"+rs.getString("title")+"</td>");
        out.println("<td>"+rs.getString("detail_id")+"</td>"); 
        out.println("<td>"+rs.getString("image_id")+"</td>");  
        out.println("<td>"+rs.getString("year")+"</td>");  
        out.println("<td>"+rs.getString("type")+"</td>"); 
        out.println("<td>"+rs.getString("width")+"</td>"); 
        out.println("<td>"+rs.getString("height")+"</td>"); 
        out.println("<td>"+rs.getString("location")+"</td>"); 
        out.println("<td>"+rs.getString("description")+"</td>"); 
     %>   

        <img style="border:15px ridge green; margin-left:30%; margin-right:30%" src=<%=rs.getString("link")%> width="40%" >
        
    <%
        out.println("</tr>");

    }
%>
</table> 

    
    
    <form align="center" action="index.jsp">
        <input type="submit" value="Back"/>
    </form>
    
    
        
<%
}
catch(Exception e){
    out.println("error!");
    out.println(e.getMessage());
}
%>
<br><br><br><br><br><br><br><br>
</body>

