package com.merrill.information.dao.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class Demand implements Serializable {

    private Long id;

    private String title;

    private String content;

    private Date publishtime;

    private Date edittime;

    private BigDecimal money;

    private Integer status;

    private Integer top;

    private Integer reportno;

    private User user;

    private Sort sort;
}