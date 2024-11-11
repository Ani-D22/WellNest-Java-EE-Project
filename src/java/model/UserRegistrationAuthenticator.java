/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Asus
 */
public class UserRegistrationAuthenticator {
    
    public boolean isRegistered(UserDTO user){
        Statement st;
        
        String password = user.getPassword();
        String confirmPassword = user.getConfirmPassword();
        
        if((!password.equals("")) && (!confirmPassword.equals("")) && password.equals(confirmPassword)){
            String username = user.getUsername();
            String age = user.getAge();
            String gender = user.getGender();
            String address = user.getAddress();
            String phone = user.getPhone();
            
            try{
                st = DBConnector.getStatement();
                String query = "INSERT INTO User (name, Password, Age, Gender, Address, Phone)"
                        + " VALUES('"+username+"','"+password+"','"+age+"','"+gender+"','"+address+"','"+phone+"');";
                System.out.println("Query = " + query);
                
                int i = st.executeUpdate(query);
                if(i>0){
                    System.out.println(i+" Record(s) Inserted");
                }
                else{
                    System.out.println("Record(s) Insertion failed...");
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
