package controller;

import dto.SpecialistDTO;
import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SpecialistRegistrationAuthenticator;

/**
 *
 * @author Asus
 */
public class SpecialistRegistrationChecker extends HttpServlet {
    
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
        String profession = request.getParameter("profession");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        SpecialistDTO specialist = new SpecialistDTO();
        
        specialist.setUsername(username);
        specialist.setPassword(password);
        specialist.setConfirmPassword(confirmPassword);
        specialist.setAge(age);
        specialist.setGender(gender);
        specialist.setProfession(profession);
        specialist.setAddress(address);
        specialist.setPhone(phone);
        
        SpecialistRegistrationAuthenticator r1 = new SpecialistRegistrationAuthenticator();
        
        boolean register = r1.isRegistered(specialist);
        
        if(register){
            response.sendRedirect("specialistRegistrationRequested.html");
        }
        else{
            response.sendRedirect("index.jsp");
        }
    }
}
