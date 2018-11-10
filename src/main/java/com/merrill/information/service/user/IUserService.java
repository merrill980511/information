package com.merrill.information.service.user;

import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Login;
import com.merrill.information.dao.entity.User;
import com.merrill.information.query.UserQueryObject;

public interface IUserService extends IBaseService<User> {
    User login(Login login);

    User saveUser(User user);

    String sendEmail(String email, int num);

    boolean existEmail(String email);

    int updatePassword(String email, String password);

    Login getLogin(String email);

    int getNumber();

    PageInfo listAllUsers(UserQueryObject qo);

    void deleteUser(String email);

//    int updateUser(User user);
}
