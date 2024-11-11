<!DOCTYPE html>

<%@page import="java.sql.SQLException"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/userOrSpecialistRegister.css" type="text/css">
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="images/WellNest.png" alt="WellNest">
            </div>    
            <div class="nav-links">
                <a href="specialistProfile.jsp">Home</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </header>
        <%
            String password = "",phone = "",gender = "", profession = "",address = "";
            int id = 0, age = 0;
            String username = (String)session.getAttribute("username");
            String uUsername = username;
            if(username == null){
                response.sendRedirect("logout.jsp");
            }
            
            try{
                Statement st = DBConnector.getStatement();
                String query = "SELECT * FROM Specialist WHERE name = '"+username+"';";
                System.out.println("Query = " + query);
                
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                    id = rs.getInt(1);
                    password  = rs.getString(3);
                    age = rs.getInt(4);
                    gender = rs.getString(5);
                    profession = rs.getString(6);
                    address = rs.getString(7);
                    phone = rs.getString(8);
                }
            }
            catch(SQLException e){
                System.out.println(e);
            }
        %>
        <div class="container">
            <h1>Update Your Info Here..!</h1>
            <form action = "SpecialistUpdationChecker" method = "post" class="register-box">
                <table>
                    <tr>
                        <td><input type = "hidden" name = "username" value = "<%=username%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Username: </strong></p></td>
                        <td><input type = "text" name = "uUsername" value = "<%=uUsername%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Password: </strong></p></td>
                        <td><input type = "text" name = "password" value = "<%=password%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Confirm Password: </strong></p></td>
                        <td><input type = "text" name = "confirmPassword" value = "<%=password%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Age: </strong></p></td>
                        <td><input type = "text" name = "age" value = "<%=age%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Gender: </strong></p></td>
                        <td><input type = "text" name = "gender" value = "<%=gender%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Profession: </strong></p></td>
                        <td><input type = "text" name = "profession" value = "<%=profession%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Address: </strong></p></td>
                        <td><input type = "text" name = "address" value = "<%=address%>"></td>
                    </tr>
                    <tr>
                        <td><p><strong>Phone: </strong></p></td>
                        <td><input type = "text" name = "phone" value = "<%=phone%>"></td>
                    </tr>
                </table>
                <div class="buttons">
                    <input type="reset" value="Reset" class="button">
                    <input type="submit" value="Update" class="button">
                </div>
            </form>
        </div>
    </body>
</html>
