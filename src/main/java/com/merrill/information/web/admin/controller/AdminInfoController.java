package com.merrill.information.web.admin.controller;

import com.merrill.information.dao.entity.Admin;
import com.merrill.information.service.admin.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminInfoController {
    @Autowired
    private IAdminService adminService;

    @RequestMapping("/editInfo")
    public String editInfo() {
        return "admin/info/editInfo";
    }

    @RequestMapping("/editInfoCommit")
    public String editInfoCommit(Admin admin, HttpSession session) {
        System.out.println(admin);
        adminService.update(admin);
        session.setAttribute("admin_in_session", admin);
        session.setAttribute("Msg", "个人信息修改成功。");
        return "admin/success";
    }

    @RequestMapping("/resetPassword")
    public String resetPassword() {
        return "admin/info/password";
    }

    @RequestMapping("/resetPasswordCommit")
    public String resetPasswordCommit(String password, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin_in_session");
        adminService.updatePassword(admin.getAccount(), DigestUtils.md5DigestAsHex(password.getBytes()));
        session.setAttribute("Msg", "密码修改成功。");
        return "admin/success";
    }
}
