package com.merrill.information.query;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

@Getter
@Setter
public class QueryObject {
    private int currentPage = 1;
    private int pageSize = 8;

//    //分页查询：LIMIT start, pagesize
//    public int getStart() {
//        return (currentPage - 1) * pageSize;
//    }

    //如果字符串为空串，也应该设置为null
    public String empty2null(String string) {
        return StringUtils.isNotBlank(string) ? string : null;
    }
}
