package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Asus
 */
public class UserLoginAuthenticator {
    public boolean isLogin(UserDTO user){
        String username = user.getUsername();
        String password = user.getPassword();
        String tablePassword = "";
        
        try{
            Statement st = DBConnector.getStatement();
            String query = "SELECT password FROM user WHERE name = '"+username+"';";
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
