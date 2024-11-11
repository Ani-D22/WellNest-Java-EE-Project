package model;

import db.DBConnector;
import dto.AdminDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Asus
 */
public class AdminLoginAuthenticator {
    public boolean isLogin(AdminDTO admin){
        String username = admin.getUsername();
        String password = admin.getPassword();
        String tablePassword = "";
        
        try{
            Statement st = DBConnector.getStatement();
            String query = "SELECT adminPassword FROM admin WHERE adminName = '"+username+"';";
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
