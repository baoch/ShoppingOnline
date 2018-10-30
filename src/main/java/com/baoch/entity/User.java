package com.baoch.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "users")
public class User implements Serializable {
    @Id
    @NotNull
    @Column(name = "username", length = 45)
    private String username;

    @NotNull
    @Column(name = "password", length = 45)
    private String password;

    @NotNull
    @Column(name = "enabled")
    private int enabled = 1;

    @NotNull
    @Column(name = "fullName", length = 45)
    private String fullName;


    public User() {
    }

    public User(String username, String password, int enabled, String fullName) {
        this.username = username;
        this.password = password;
        this.enabled = enabled;
        this.fullName = fullName;
    }

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

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
