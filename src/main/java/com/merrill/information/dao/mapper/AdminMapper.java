package com.merrill.information.dao.mapper;

import com.merrill.information.dao.entity.Admin;
import com.merrill.information.dao.entity.Login;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface AdminMapper {
    Login checkLogin(@Param("account") Long account, @Param("password") String password);

    Admin login(@Param("account") Long account, @Param("password") String password);

    void setLastLoginTime(@Param("account") Long account, @Param("date") Date date);

    void update(@Param("account")Long account, @Param("email") String email, @Param("birthday") Date birthday, @Param("name") String name,
                @Param("phone") String phone, @Param("sex") String sex, @Param("description") String description);

    void updatePassword(@Param("account") Long account, @Param("password") String password);

    Admin getByAccount(Long account);
}
