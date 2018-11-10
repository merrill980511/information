package com.merrill.information.service.admin;

import com.merrill.information.dao.entity.Admin;
import com.merrill.information.web.admin.vo.AdminLogin;

public interface IAdminService{
    Admin login(AdminLogin login);

    void update(Admin admin);

    void updatePassword(Long account, String password);

    Admin getByAccount(Long account);
}
