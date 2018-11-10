package com.merrill.information.web.admin.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class AddDemandForm {
    private Long userId;
    private Long sortId;
    private String title;
    private String content;
    private BigDecimal money;
    private Integer top;
}
