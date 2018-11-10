package com.merrill.information.web.user.controller;

import com.merrill.information.service.admin.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class AdminController {
    @Autowired
    private IAdminService adminService;

    @RequestMapping("/showAdminInfo")
    public String showAdminInfo(Long account, HttpSession session){
        session.setAttribute("admin_in_session", adminService.getByAccount(account));
        return "user/admin/adminInfo";
    }
}
