package com.merrill.information.query;

import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

@Getter
public class DemandQueryObject extends QueryObject {
    private String keyWord;
    private Long sortId = -1L;
    private Integer status = -100;
    private int pageSize = 3;

    public void setKeyWord(String keyWord) {
        if (StringUtils.isNotBlank(keyWord)) {
            this.keyWord = keyWord.trim();
        } else {
            this.keyWord = "";
        }
    }

    public void setSortId(Long sortId) {
        if (sortId < 0) {
            this.sortId = -1L;
        } else {
            this.sortId = sortId;
        }
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
