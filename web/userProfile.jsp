<%-- 
    Document   : home
    Created on : 29 Jun, 2024, 9:52:48 AM
    Author     : Asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile Page</title>
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/profile.css">
        <style>
            .rows{
                background-color: white;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="images/WellNest.png" alt="WellNest">
            </div>
            <div class="nav-links">
                <a href="userHome.jsp">Home</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </header>
        <%
            int id = 0,age = 0;
            String gender = "", address = "", phone = "";
            
            String username = (String)session.getAttribute("username");
            if(username == null){
                response.sendRedirect("login.html");
            }
            try{
                Statement st = DBConnector.getStatement();
                String query = "SELECT * FROM User WHERE Name = '"+username+"';";
                System.out.println("Query = " + query);
                
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                    id = rs.getInt(1);
                    age = rs.getInt(4);
                    gender = rs.getString(5);
                    address = rs.getString(6);
                    phone = rs.getString(7);
                }
                
            }
            catch(SQLException e){
                System.out.println(e);
            }
            String[] words = username.split("\\s"); 
            StringBuilder result = new StringBuilder(); 
            for (String word : words) {
                    result.append(Character.toTitleCase(word.charAt(0))) 
                  .append(word.substring(1)) 
                  .append(" "); 
            }
            String name = result.toString().trim();
        %>
        <div class="rows">
            <h1>Hello <%=name%>, Login Successful..!</h1>
        </div>
        <div>
            <table class="rows">
                <tr class="div1">
                    <td><strong>Id: <%=id%></strong></td>
                    <td><strong>Username: <%=name%></strong></td>
                    <td><strong>Age: <%=age%></strong></td>
                    <td><strong>Gender: <%=gender%></strong></td>
                    <td><strong>Address: <%=address%></strong></td>
                    <td><strong>Phone: <%=phone%></strong></td>
                </tr>
            </table>
        </div>
        <br>
        <div class="rows">
            <div><a  href= "userUpdate.jsp"><button>Update Details</button></a></div>
            <div><a href= "userDelete.jsp"><button>Delete Account</button></a></div>
        </div>
    </body>
</html>
