/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Asus
 */
public class AdminDTO {
    String username, password, removeAcc;

    public String getUsername() {
        return username;
    }

    public void setUsername(String name) {
        this.username = name;
    }

    public String getRemoveAcc() {
        return removeAcc;
    }

    public void setRemoveAcc(String removeAcc) {
        this.removeAcc = removeAcc;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
