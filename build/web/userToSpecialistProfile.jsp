<%-- 
    Document   : userToSpecialistProfile
    Created on : 10 Sep, 2024, 9:38:34 PM
    Author     : Asus
--%>

<%@page import="db.DBConnector"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specialist Details</title>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="images/WellNest.png" alt="WellNest">
            </div>    
            <div class="nav-links">
                <a href="specialistHome.jsp">Home</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </header>
        <%
            int id = 0,age = 0;
            String gender = "", profession = "", address = "", phone = "", description = "";
            
            String username = (String)session.getAttribute("username");
            if(username == null){
                response.sendRedirect("login.html");
            }
            try{
                Statement st = DBConnector.getStatement();
                String query = "SELECT * FROM Specialist WHERE Name = '"+username+"';";
                System.out.println("Query = " + query);
                
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                    id = rs.getInt(1);
                    age = rs.getInt(4);
                    gender = rs.getString(5);
                    profession = rs.getString(6);
                    address = rs.getString(7);
                    phone = rs.getString(8);
                    description = rs.getString(9);
                }
                
            }
            catch(SQLException e){
                System.out.println(e);
            }
            
        %>
        <div class="rows">
            <h1>Hello <%=username%>, Login Successful..!</h1>
        </div>
        <div>
            <table class="rows">
                <tr class="div1">
                    <td><strong>Id: <%=id%></strong></td>
                    <td><strong>Username: <%=username%></strong></td>
                    <td><strong>Age: <%=age%></strong></td>
                    <td><strong>Gender: <%=gender%></strong></td>
                    <td><strong>Profession: <%=profession%></strong></td>
                    <td><strong>Address: <%=address%></strong></td>
                    <td><strong>Phone: <%=phone%></strong></td>
                </tr>
                <tr class="div1">
                    <td><p><strong>Description: <%=description%><p></strong></td>
                </tr>
            </table>
        </div>
    </body>
</html>
