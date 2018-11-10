package com.merrill.information.web.user.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 存储在session中，传递queryObject的值
 */
@Getter
@Setter
public class DemandQueryContent {
    private String keyWord;
    private Long sortId;
    private int status;

    public DemandQueryContent(String keyWord, Long sortId){
        this.keyWord = keyWord;
        this.sortId = sortId;
        this.status = -100;
    }
}
