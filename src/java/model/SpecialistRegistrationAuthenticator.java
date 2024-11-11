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
public class SpecialistRegistrationAuthenticator {
    
    public boolean isRegistered(SpecialistDTO specialist){
        Statement st;
        
        String password = specialist.getPassword();
        String confirmPassword = specialist.getConfirmPassword();
        
        if((!password.equals("")) && (!confirmPassword.equals("")) && password.equals(confirmPassword)){
            String username = specialist.getUsername();
            String age = specialist.getAge();
            String gender = specialist.getGender();
            String profession = specialist.getProfession();
            String address = specialist.getAddress();
            String phone = specialist.getPhone();
            
            try{
                st = DBConnector.getStatement();
                String query = "INSERT INTO specialistrequest (name, Password, Age, Gender, Profession, Address, Phone)"
                        + " VALUES('"+username+"','"+password+"','"+age+"','"+gender+"','"+profession+"','"+address+"','"+phone+"');";
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
