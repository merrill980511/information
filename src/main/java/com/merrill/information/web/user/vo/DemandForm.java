package com.merrill.information.web.user.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class DemandForm {
    private Long id;
    private String title;
    private String content;
    private BigDecimal money;
    private Integer top;
    private Long sort;
}
