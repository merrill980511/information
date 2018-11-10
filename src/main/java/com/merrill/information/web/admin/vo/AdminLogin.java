package com.merrill.information.web.admin.vo;

import lombok.Data;

@Data
public class AdminLogin {

    private Long account;

    private String password;

    private String code;
}
