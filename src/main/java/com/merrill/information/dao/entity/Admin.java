package com.merrill.information.dao.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Table(name = "admin")
public class Admin implements Serializable {
    @Id
    private Long account;
    @Column
    private String password;
    @Column
    private String name;
    @Column
    private String sex;
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    @Column
    private String email;
    @Column
    private String phone;
    @Column
    private String description;
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lastlogin;
}