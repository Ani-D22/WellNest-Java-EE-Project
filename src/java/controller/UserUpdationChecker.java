
package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserUpdationAuthenticator;

/**
 *
 * @author Asus
 */
public class UserUpdationChecker extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.html");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String uUsername = request.getParameter("uUsername");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        UserDTO user = new UserDTO();
        
        user.setUsername(username);
        user.setUUsername(uUsername);
        user.setPassword(password);
        user.setConfirmPassword(confirmPassword);
        user.setAge(age);
        user.setGender(gender);
        user.setAddress(address);
        user.setPhone(phone);
        
        UserUpdationAuthenticator u1 = new UserUpdationAuthenticator();
        boolean update = u1.isUpdated(user);
        
        if(update){
            response.sendRedirect("userUpdateSuccess.jsp");
        }
        else{
            response.sendRedirect("userUpdate.jsp");
        }
    }
    
}
