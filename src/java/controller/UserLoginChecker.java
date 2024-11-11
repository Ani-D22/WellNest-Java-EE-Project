package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserLoginAuthenticator;

/**
 *
 * @author Asus
 */
public class UserLoginChecker extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.html");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserDTO user = new UserDTO();
        user.setUsername(username);
        user.setPassword(password);
        
        UserLoginAuthenticator l1 = new UserLoginAuthenticator();
        boolean login = l1.isLogin(user);
        
        if(login){
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            response.sendRedirect("userProfile.jsp");
        }
        else{
            response.sendRedirect("login.html");
        }
    }

}
