package com.merrill.information.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserQueryObject extends QueryObject {
    private Long account;

    private String name;

    private String nickname;
}
