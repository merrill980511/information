package com.merrill.information.dao.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Order implements Serializable {
    private Long id;

    private Demand demand;

    private User publishUser;

    private User meetUser;

    private Date meetBegin;

    private Date meetEnd;

}
