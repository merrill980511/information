package com.merrill.information.service.user.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Login;
import com.merrill.information.dao.entity.User;
import com.merrill.information.dao.mapper.UserMapper;
import com.merrill.information.query.UserQueryObject;
import com.merrill.information.service.user.IUserService;
import com.merrill.information.util.EmailUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {
    @Autowired
    private UserMapper mapper;

    @Override
    public User login(Login login) {
        String email = login.getEmail();
        String password = login.getPassword();
        if (StringUtils.isNotBlank(email) && StringUtils.isNotBlank(password)) {
            login = mapper.checkLogin(email, DigestUtils.md5DigestAsHex(password.getBytes()));
            if (login != null) {
                return mapper.login(email);
            }
        }
        return null;
    }

    @Override
    public User saveUser(User user) {
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        Long id = Long.valueOf(this.save(user));
        mapper.saveLogin(user.getEmail(), user.getPassword());
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public String sendEmail(String email, int num) {
        String code = EmailUtil.randCode(num);
        EmailUtil.sendEmail(email, code);
        return code;
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existEmail(String email) {
        return mapper.queryEmail(email) == 1 ? true : false;
    }

    @Override
    public int updatePassword(String email, String password) {
        return mapper.updateUserPassword(email, password);
    }

    @Override
    public Login getLogin(String email) {
        Login login = mapper.getLogin(email);
        mapper.setLastLogin(email, new Date());
        return login;
    }

    @Override
    public int getNumber() {
        return mapper.getNumber();
    }

    @Override
    @Transactional(readOnly = true)
    public PageInfo listAllUsers(UserQueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<?> list = mapper.queryForObject(qo);
        return new PageInfo(list);
    }

    public void deleteUser(String email){
        mapper.deleteLogin(email);
        mapper.deleteUser(email);
    }

//    @Override
//    public int updateUser(User user) {
//        return mapper.updateUser(user.getId(), user.getName(), user.getNickname(),
//                user.getSex(), user.getPhone(), user.getQq(), user.get)
//    }
}
