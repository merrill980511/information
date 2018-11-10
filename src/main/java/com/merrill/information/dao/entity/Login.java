package com.merrill.information.dao.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Login implements Serializable {

    private String email;

    private String password;

    private String code;

    private Date lastlogin;
}