package com.baoch.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "user_roles", uniqueConstraints={@UniqueConstraint(columnNames = {"role", "username"})})
public class Role implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id")
    private int user_role_id;

    @Column(name = "ROLE", length = 45)
    @NotNull
    private String ROLE;

    @ManyToOne
    @JoinColumn(name = "username")
    private User user;


    public Role() {
    }

    public Role(String ROLE, User user) {
        this.ROLE = ROLE;
        this.user = user;
    }

    public int getUser_role_id() {
        return user_role_id;
    }

    public void setUser_role_id(int user_role_id) {
        this.user_role_id = user_role_id;
    }

    public String getROLE() {
        return ROLE;
    }

    public void setROLE(String ROLE) {
        this.ROLE = ROLE;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
