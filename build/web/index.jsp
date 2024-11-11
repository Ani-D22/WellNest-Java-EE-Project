<%-- 
    Document   : index
    Created on : 19 Jun, 2024, 5:32:05 PM
    Author     : Asus
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <link rel="stylesheet" href="styles/index.css">
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/userOrSpecialistPage.css">
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
                <a href="login.html">Login</a>
                <a href="register.html">Register</a>
                <a href="adminLogin.html">Admin Login</a>
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
                            <div class="rows">
                                <div class="div1"><p><strong><%=name%></strong></p></div>
                                <div class="div1"><p><strong><%=profession%></strong></p></div>
                                <div><a href="login.html"><button>Login to View Details</button></a></div>
                            </div>
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
