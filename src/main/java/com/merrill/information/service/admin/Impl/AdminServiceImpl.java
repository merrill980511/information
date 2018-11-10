package com.merrill.information.service.admin.Impl;

import com.merrill.information.dao.entity.Admin;
import com.merrill.information.dao.mapper.AdminMapper;
import com.merrill.information.service.admin.IAdminService;
import com.merrill.information.web.admin.vo.AdminLogin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.Date;

@Service
@Transactional
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(AdminLogin login) {
        Long account = login.getAccount();
        String password = login.getPassword();
        if (account != null && StringUtils.isNotBlank(password)) {
            Admin admin = adminMapper.login(account, DigestUtils.md5DigestAsHex(password.getBytes()));
            if (admin != null){
                adminMapper.setLastLoginTime(admin.getAccount(), new Date());
            }
            return admin;
        }
        return null;
    }

    @Override
    public void update(Admin admin) {
        adminMapper.update(admin.getAccount(), admin.getEmail(), admin.getBirthday(), admin.getName(),
                admin.getPhone(), admin.getSex(), admin.getDescription());
    }

    @Override
    public void updatePassword(Long account, String password) {
        adminMapper.updatePassword(account, password);
    }

    @Override
    public Admin getByAccount(Long account) {
        return adminMapper.getByAccount(account);
    }
}
