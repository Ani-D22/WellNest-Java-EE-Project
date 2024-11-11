package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserRegistrationAuthenticator;

/**
 *
 * @author Asus
 */
public class UserRegistrationChecker extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        UserDTO user = new UserDTO();
        
        user.setUsername(username);
        user.setPassword(password);
        user.setConfirmPassword(confirmPassword);
        user.setAge(age);
        user.setGender(gender);
        user.setAddress(address);
        user.setPhone(phone);
        
        UserRegistrationAuthenticator r1 = new UserRegistrationAuthenticator();
        
        boolean register = r1.isRegistered(user);
        
        if(register){
            response.sendRedirect("userRegistrationSuccessful.html");
        }
        else{
            response.sendRedirect("index.jsp");
        }
    }
}
