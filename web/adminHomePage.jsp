<%-- 
    Document   : adminControlPage
    Created on : 4 Jul, 2024, 5:15:21 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home Page</title>
        <link rel="stylesheet" href="styles/adminHomePage.css">
    </head>
    <body>
        <%
            int id = 0,age = 0;
            String gender = "", profession = "", address = "", phone = "";
            
            String username = (String)session.getAttribute("username");
            if(username == null){
                response.sendRedirect("adminLogin.html");
            }
           %>
        <div class="heading">
            <h1>Welcome Admin: <%=username%></h1>
        </div>
        
        <div class="buttons">
            <div>
                <a href="specialistRequestPage.jsp"><button >Specialist Requests</button></a>
            </div>
            <div>
                <a href="registeredSpecialistPage.jsp"><button>Registered Specialist</button></a>
            </div>
            <div>
                <a href="registeredUsersPage.jsp"><button>Registered Users</button></a>
            </div>
            <div>
                <a href="logout.jsp"><button>Logout</button></a>
            </div>
        </div>
    </body>
</html>
