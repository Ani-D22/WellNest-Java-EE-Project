
package controller;

import dto.SpecialistDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SpecialistUpdationAuthenticator;

/**
 *
 * @author Asus
 */
public class SpecialistUpdationChecker extends HttpServlet {

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
        String profession = request.getParameter("profession");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        SpecialistDTO user = new SpecialistDTO();
        
        user.setUsername(username);
        user.setUUsername(uUsername);
        user.setPassword(password);
        user.setConfirmPassword(confirmPassword);
        user.setAge(age);
        user.setGender(gender);
        user.setProfession(profession);
        user.setAddress(address);
        user.setPhone(phone);
        
        SpecialistUpdationAuthenticator u1 = new SpecialistUpdationAuthenticator();
        boolean update = u1.isUpdated(user);
        
        if(update){
            response.sendRedirect("specialistUpdateSuccess.jsp");
        }
        else{
            response.sendRedirect("specialistUpdate.jsp");
        }
    }
    
}
