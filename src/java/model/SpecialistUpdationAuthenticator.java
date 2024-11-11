/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.SpecialistDTO;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Asus
 */
public class SpecialistUpdationAuthenticator {
    public boolean isUpdated(SpecialistDTO user){
        Statement st;
        
        String password = user.getPassword();
        String confirmPassword = user.getConfirmPassword();
        
        if((!password.trim().equals("")) && (!confirmPassword.trim().equals("")) && password.equals(confirmPassword)){
            String username = user.getUsername();
            String uUsername = user.getUUsername();
            int age = (Integer.parseInt(user.getAge()));
            String gender = user.getGender();
            String profession = user.getProfession();
            String address = user.getAddress();
            String phone = user.getPhone();
            
            try{
                st = DBConnector.getStatement();
                String query = "UPDATE Specialist " +
                               "SET name = '"+uUsername+"', password = '"+password+"',age = '"+age+"'," +
                               "gender = '"+gender+"', profession = '"+profession+"', address = '"+address+"', phone = '"+phone+"'"+
                               " WHERE name = '"+username+"';";
                
                System.out.println("Query = " + query);

                int i = st.executeUpdate(query);

                if(i>0){
                    System.out.println(i + " Record Updated...");
                    user.setUsername(uUsername);
                }
                else {
                    System.out.println("Record Updation failed...");
                }
            }
            catch(SQLException e){
                System.out.println(e);
            }
            return true;
        }
        return false;
    }
    
}
