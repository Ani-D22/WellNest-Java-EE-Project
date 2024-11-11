<%-- 
    Document   : RegisteredUsersPage
    Created on : 1 Sep, 2024, 12:01:30 PM
    Author     : Asus
--%>

<%@page import="db.DBConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Users</title>
        <link rel="stylesheet" href="styles/userOrSpecialistPage.css">
    </head>
    <body>
        <h1>Registered Users</h1>
        <%
            String name = "";
            try{
                Statement st = DBConnector.getStatement();
                String query = "SELECT Name FROM User;";
                System.out.println("Query = " + query);
                
                ResultSet rs = st.executeQuery(query);
                %><table> <%
                while(rs.next()){
                    name = rs.getString(1); %>
                        <tr>
                            <td class="rows">
                                <div class="div1"><p><strong><%=name%></strong></p></div>
                                <div><a href="adminDeleteUser.jsp"><button>Remove Account</button></a></div>
                            </td>
                        </tr>
                <%
                } %>
                </table> <%
            }
            catch(SQLException e){
                System.out.println(e);
            }
        %>        
    </body>
</html>
