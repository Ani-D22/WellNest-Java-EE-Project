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
public class SpecialistLoginAuthenticator {
    public boolean isLogin(SpecialistDTO specialist){
        String username = specialist.getUsername();
        String password = specialist.getPassword();
        String tablePassword = "";
        
        try{
            Statement st = DBConnector.getStatement();
            String query = "SELECT password FROM specialist WHERE name = '"+username+"';";
            System.out.println("Query = "+query);
            
            ResultSet rs = st.executeQuery(query);
            
            if(rs.next()){
                tablePassword = rs.getString(1);
            }
            else return false;
        }
        catch(SQLException e){
            System.out.println(e);
        }
        
        if(username!=null && password!=null && password.equals(tablePassword)){
            return true;
        }
        return false;
    }
}
