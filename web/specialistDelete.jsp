<%-- 
    Document   : specialist.jsp
    Created on : 8 Sep, 2024, 7:36:55 PM
    Author     : Asus
--%>

<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specialist Account Delete</title>
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/profile.css">
    </head>
    <body>
        <%
            String username = (String)session.getAttribute("username");
            if(username == null){
                response.sendRedirect("logout.jsp");
            }
            
            try{
                Statement st = DBConnector.getStatement();
                String query = "DELETE FROM Specialist WHERE name = '"+username+"';";
                System.out.println("Query = " + query);
                
                int i = st.executeUpdate(query);
                
                if(i>0){
                    System.out.println(i + " Account Deleted...");
                }
                else {
                    System.out.println("Account Deletion failed...");
                }
            }
            catch(SQLException e){
                System.out.println(e);
            }
        %>
        
        <header>
            <div class="logo">
                <img src="images/WellNest.png" alt="WellNest">
            </div>    
            <div class="nav-links">
                <a href="index.jsp">Index</a>
            </div>
        </header>
        
        <div class="rows">
            <h1>Deletion Successful..!</h1>
        </div>
    </body>
</html>
