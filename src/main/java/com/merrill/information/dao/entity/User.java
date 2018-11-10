package com.merrill.information.dao.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@Table(name = "user")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String password;
    @Column
    private String nickname;
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
    private String qq;
    @Column
    private BigDecimal reputation;
    @Column
    private String school;
    @Column
    private String department;
    @Column
    private String clazz;
    @Column
    private String description;
    @Column
    private String picture;

    private List<Long> friendList;

    private List<Long> blackList;
}