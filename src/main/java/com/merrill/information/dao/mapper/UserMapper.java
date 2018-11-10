package com.merrill.information.dao.mapper;

import com.merrill.information.dao.entity.Login;
import com.merrill.information.dao.entity.User;
import com.merrill.information.query.QueryObject;
import com.merrill.information.query.UserQueryObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Repository
public interface UserMapper extends Mapper<User> {
    Login checkLogin(@Param("email") String email, @Param("password") String password);

    User login(String email);

    int saveLogin(@Param("email") String email, @Param("password") String password);

    int queryEmail(String email);

    int updateUserPassword(@Param("email") String email, @Param("password") String password);

    int updateLoginPassword(@Param("email") String email, @Param("password") String password);

    void setLastLogin(@Param("email") String email, @Param("date") Date date);

    Login getLogin(String email);

    int getNumber();

    List<?> queryForObject(UserQueryObject qo);

    void deleteLogin(String email);

    void deleteUser(String email);
}