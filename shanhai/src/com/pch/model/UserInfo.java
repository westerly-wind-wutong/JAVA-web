/*
    Created by IntelliJ IDEA.
    User: Ding
    Date: 2022/5/20
    Time: 0:51
    To change this template use File | Settings | File Templates.
*/
package com.pch.model;

public class UserInfo {
    private String username="";
    private String password="";
    private String email="";
    private int id;

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
}
