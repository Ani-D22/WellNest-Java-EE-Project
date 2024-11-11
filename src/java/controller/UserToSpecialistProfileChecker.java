package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dto.SpecialistDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserToSpecialistProfileAuthenticator;

/**
 *
 * @author Asus
 */
public class UserToSpecialistProfileChecker extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.sendRedirect("userHome.jsp");
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("name");
        String profession = request.getParameter("profession");
        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
        SpecialistDTO specialist = new SpecialistDTO();
        
        specialist.setUsername(username);
        
        UserToSpecialistProfileAuthenticator u1 = new UserToSpecialistProfileAuthenticator();
        boolean display = u1.isDisplayed(specialist);
        if(display){
            response.sendRedirect("userToSpecialistProfile.jsp");
        }
        else{
            response.sendRedirect("userHome.jsp");
        }
    }
}
