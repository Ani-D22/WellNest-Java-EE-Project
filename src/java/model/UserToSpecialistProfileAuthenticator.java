/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.SpecialistDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Asus
 */
public class UserToSpecialistProfileAuthenticator {
    
    public boolean isDisplayed(SpecialistDTO specialist){
        String username = specialist.getUsername();
        String tableName = "";
        
        try{
            Statement st = DBConnector.getStatement();
            String query = "SELECT name FROM Specialist WHERE name = '"+username+"';";
            System.out.println("Query = "+query);
            
            ResultSet rs = st.executeQuery(query);
            
            if(rs.next()){
                tableName = rs.getString(1);
            }
            else return false;
        }
        catch(SQLException e){
            System.out.println(e);
        }
        
        if(username!=null && username.equals(tableName)){
            return true;
        }
        return false;
    }
}
