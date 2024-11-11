<%-- 
    Document   : adminDeleteUser
    Created on : 9 Sep, 2024, 4:55:39 PM
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
        <title>Admin Delete User</title>
    </head>
    <body>
        <%
            String username = (String)session.getAttribute("username");
            if(username == null){
                response.sendRedirect("logout.jsp");
            }
            
            try{
                Statement st = DBConnector.getStatement();
                String query = "DELETE FROM User WHERE name = '"+username+"';";
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
    </body>
</html>
