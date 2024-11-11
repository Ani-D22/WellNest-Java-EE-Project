/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.SpecialistDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SpecialistLoginAuthenticator;

/**
 *
 * @author Asus
 */
public class SpecialistLoginChecker extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.html");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        SpecialistDTO specialist = new SpecialistDTO();
        specialist.setUsername(username);
        specialist.setPassword(password);
        
        SpecialistLoginAuthenticator l1 = new SpecialistLoginAuthenticator();
        boolean login = l1.isLogin(specialist);
        
        if(login){
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            response.sendRedirect("specialistProfile.jsp");
        }
        else{
            response.sendRedirect("login.html");
        }
    }

}
