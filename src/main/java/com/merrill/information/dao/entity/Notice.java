package com.merrill.information.dao.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Table(name = "notice")
public class Notice implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Admin admin;
    @Column
    private Date datetime;
    @Column
    private String message;
    @Column
    private String title;
}