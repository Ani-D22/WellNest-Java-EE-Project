<%-- 
    Document   : specialistHome
    Created on : 8 Sep, 2024, 10:31:29 PM
    Author     : Asus
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="styles/index.css">
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/specialistListPage.css">
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="images/WellNest.png" alt="WellNest">
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Search">
                <button>Search</button>
            </div>
            <div class="nav-links">
                <a href="userProfile.jsp">Profile</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </header>
        
        <div class="heading">
            <h1>Registered Specialists</h1>
        </div>
        <%
            String name = "", profession = "";
            try{
                Statement st = DBConnector.getStatement();
                String query = "SELECT Name, Profession FROM specialist;";
                System.out.println("Query = " + query);
                
                ResultSet rs = st.executeQuery(query);%>
                <div class="container">
                  <table><%
                while(rs.next()){
                    name = rs.getString(1);
                    profession = rs.getString(2); %>
                    <tr>
                        <td>
                            <form action="UserToSpecialistProfileChecker">
                            <div class="rows">
                                <input class="div1" type = "text" name = "name" value = "<%=name%>">
                                <input class="div1" type = "text" name = "profession" value = "<%=profession%>">
                                <input class="button" type="submit" value="View Details">
                            </div>
                            </form>
                        </td>
                    </tr>            
                <%}
                %></table>
                </div><%
            }
            catch(SQLException e){
                System.out.println(e);
            }
        %>
    </body>
</html>
