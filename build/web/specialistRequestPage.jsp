<%-- 
    Document   : specialistRequestPage
    Created on : 1 Sep, 2024, 11:59:48 AM
    Author     : Asus
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specialists Requests</title>
        <link rel="stylesheet" href="styles/userOrSpecialistPage.css">

    </head>
    <body>
        <h1>Specialists Requests</h1>
        <%
            String name = "", profession = "";
            try{
                Statement st = DBConnector.getStatement();
                String query = "SELECT Name, Profession FROM specialistrequest;";
                System.out.println("Query = " + query);
                
                ResultSet rs = st.executeQuery(query);
                while(rs.next()){
                    name = rs.getString(1);
                    profession = rs.getString(2); %>
                    <table>
                        <tr>
                            <td class="rows">
                                <div class="div1"><p><strong><%=name%></strong></p></div>
                                <div class="div1"><p><strong><%=profession%></strong></p></div>
                                <button>Reject Account</button>
                                <button>Approve Account</button>
                            </td>
                        </tr>
                    </table><%
                }
            }
            catch(SQLException e){
                System.out.println(e);
            }
        %>
    </body>
</html>
