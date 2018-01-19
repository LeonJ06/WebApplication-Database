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
<font size="6">
    <center>
        EECS 221B MP2 Gallery
    </center>
</font>
<font size="4"><p align=right>By Yuan-Hung Lin 28321104</p></font>






<%-- ////////////        Gallery         ///////////// --%>

<font size="4" ><center><strong>Gallery</strong></center></font>
<HR style="border-width: 3px"></HR>

<%-- Gallery display --%>
<font size="3" ><strong>Display Gallery</strong></font>

<form method="get" action="gallery_display.jsp">
    <input type="submit" value="display Gallery"/>
</form>

<%-- Gallery insert --%>
<font size="3" ><strong>Insert Gallery</strong></font><br>
<HR ></HR>

<form method="post" action="gallery_insert.jsp">
    <%-- gallery_id:<input type="text" name = "gallery_gallery_id"/> --%>
    Gallery Name: &emsp; &emsp; &emsp;<input type="text" name = "gallery_name" required/><br>
    Gallery Description: &emsp; <input type="text" name = "gallery_description"/>
    <input type="submit" value="Insert Gallery"/>
</form>


<%-- Gallery delete--%>
<font size="3" ><strong>Delete Gallery</strong></font>
<HR></HR>
<form method="post" action="gallery_delete.jsp">
    Gallery ID:&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;<input type="text" name = "gallery_gallery_id" required/>
    <input type="submit" value="Delete Gallery"/>
</form>

<%-- Gallery modify--%>
<font size="3" ><strong>Modify Gallery</strong></font>
<HR></HR>
<form method="post" action="gallery_modify.jsp">
    Gallery ID:&emsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name = "gallery_gallery_id"required/><br>
    Gallery_Title:&emsp;&emsp;&emsp;&emsp;<input type="text" name = "gallery_title"/>
    Gallery_Description:&emsp;<input type="text" name = "gallery_description"/>
    <input type="submit" value="modify gallery detail"/>
</form>






<br><br>
<%-- ////////////       Artist         ///////////// --%>

<font size="4" ><center><strong>Artist</strong></center></font>
<HR style="border-width: 3px"></HR>

<%-- Artist display--%>
<font size="3" ><strong>Display Artist</strong></font>

<form method="post" action="artist_display.jsp">
    <input type="submit" value="Display Artist"/>
</form>

<%-- Artist search country--%>
<font size="3" ><strong>Search Artist By Country</strong></font>
<hr></hr>
<form method="post" action="artist_search_country.jsp">
    Artist Country:&emsp;&emsp;&emsp;<input type="text" name = "artist_country" required/>
    <input type="submit" value="Search Artist by Country"/>
</form>

<%-- Artist search birth year--%>
<font size="3" ><strong>Search Artist By Birth Year</strong></font>
<hr></hr>
<form method="post" action="artist_search_birth_year.jsp">
    Artist Birth Year:&emsp;&emsp;<input type="text" name = "artist_birth_year"required/>
    <input type="submit" value="Search Artist by Birth Year"/>
</form>

<%-- Artist insert --%>
<font size="3" ><strong>Insert Artist</strong></font>
<hr></hr>
<form method="post" action="artist_insert.jsp">
    Artist Name::&emsp;&ensp;&emsp;&emsp;<input type="text" name = "artist_name"required/>
    Artist Birth Year:&emsp;<input type="text" name = "artist_birth_year"/>
    Artist Country:&emsp;<input type="text" name = "artist_country"/><br>
    Artist Description:&emsp;&ensp;<textarea input type="text" name = "artist_description"/> </textarea>
    <%-- </textarea><input type="text" name = "artist_description"/> --%>
    <input type="submit" value="Insert Artist"/>
</form>

<%-- artist delete--%>
<font size="3" ><strong>Delete Artist</strong></font>
<hr></hr>
<form method="post" action="artist_delete.jsp">
    Artist ID:&emsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name = "artist_artist_id" required/>
    <input type="submit" value="Delete Artist"/>
</form>

<%-- artist modify--%>
<font size="3" ><strong>Modify Artist</strong></font>
<hr></hr>
<form method="post" action="artist_modify.jsp">
    Artist ID:&emsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name = "artist_artist_id"required/>
    Artist Name:&emsp;&emsp;&emsp;&ensp;<input type="text" name = "artist_name"/>
    Artist Birth Year:&emsp;<input type="text" name = "artist_birth_year"/><br>
    Artist Country:&emsp;&emsp;&emsp;<input type="text" name = "artist_country"/>
    Artist Description:&emsp;<input type="text" name = "artist_description"/>
    <input type="submit" value="modify description"/>
</form>








<br><br>
<%-- ////////////       Image         ///////////// --%>

<font size="4" ><center><strong>Image</strong></center></font>
<HR style="border-width: 3px"></HR>

<%-- Image display--%>
<font size="3" ><strong>Display Image</strong></font>
<hr></hr>
<form method="post" action="image_display2.jsp">
    <input type="submit" value="Display Image"/>
</form>

<%-- Image search by gallery--%>
<font size="3" ><strong>Search Image By Gallery</strong></font>
<hr></hr>
<form method="post" action="image_display_gallery.jsp">
    Gallery:&emsp;&emsp;&emsp;&emsp;<input type="text" name = "image_gallery_id"required/>
    <input type="submit" value="Search Artist by Gallery"/>
</form>

<%-- image insert --%>
<font size="3" ><strong>Insert Image</strong></font>
<hr></hr>
<form method="post" action="image_insert.jsp">
    Img Title: &emsp;&emsp;&emsp;<input type="text" name = "image_title"required/>
    Img Link:&emsp;&emsp;&emsp;<input type="text" name = "image_link"/>
    Img Gallery ID: &emsp;<input type="text" name = "image_gallery_id"/><br>
    Img Artist ID:&emsp;&ensp;<input type="text" name = "image_artist_id"/>
    Img Detail ID:&emsp;<input type="text" name = "image_detail_id"/>
    <input type="submit" value="Insert Image"/>
</form>

<%-- image modify--%>
<font size="3" ><strong>Modify Image</strong></font>
<hr></hr>
<form method="post" action="image_modify_title_link.jsp">
    Image ID:&emsp;&emsp;&emsp;<input type="text" name = "modify_image_id"required/>
    Title:&emsp;&emsp;&emsp;<input type="text" name = "modify_image_title"/>
    Link:&emsp;&emsp;&emsp;<input type="text" name = "modify_image_link"/><br>
    Gallery ID:&emsp;&emsp;&ensp;<input type="text" name = "modify_image_gallery_id"/>
    Artist ID:&emsp;&ensp;<input type="text" name = "modify_image_artist_id"/>
    Detail ID:&emsp;<input type="text" name = "modify_image_detail_id"/>
    <input type="submit" value="modify detail"/>
</form>

<%-- image search by year--%>
<font size="3" ><strong>Search Image By Year</strong></font>
<hr></hr>
<form method="post" action="image_search_year.jsp">
    From:&emsp;&emsp;<input type="text" name = "image_year_lower"required/>
    To:&emsp;&emsp;<input type="text" name = "image_year_upper"required/>
    <input type="submit" value="Search image by year"/>
</form>


<%-- image search by artist--%>
<font size="3" ><strong>Search Image By Artist</strong></font>
<hr></hr>
<form method="post" action="image_search_artist.jsp">
    Artist:&emsp;&emsp;<input type="text" name = "image_artist"/>
    <input type="submit" value="Search image by artist"/>
</form>

<%-- image search by location--%>
<font size="3" ><strong>Search Image By Location</strong></font>
<hr></hr>
<form method="post" action="image_search_location.jsp">
    Location:&emsp;<input type="text" name = "image_location"required/>
    <input type="submit" value="Search image by location"/>
</form>


<%-- image search by type--%>
<font size="3" ><strong>Search Image By Type</strong></font>
<hr></hr>
<table border = 1>
current type:&emsp;&emsp;
<%
Statement stmt = con.createStatement();
String sql="SELECT distinct type FROM detail"; 
ResultSet rs=stmt.executeQuery(sql);
while (rs.next()) {
    out.println("<td>"+rs.getString("type")+"</td>");
}
%>
</table>

<form method="post" action="image_search_type.jsp">
    Type:&emsp;&emsp;<input type="text" name = "image_type"required/>
    <input type="submit" value="Search image by type"/>
</form>

<%-- image delete--%>
<font size="3" ><strong>Delete Image</strong></font>
<hr></hr>
<form method="post" action="image_delete.jsp">
    Image ID:<input type="text" name = "image_id"required/>
    <input type="submit" value="Delete Image"/>
</form>



<font size="4"><p align=right>By Yuan Hung Lin</p></font>
<font size="4"><p align=right>28321104</p></font>
<br><br><br><br><br><br><br><br><br><br>
