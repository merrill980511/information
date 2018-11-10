package com.merrill.information.web.admin.controller;

import com.merrill.information.dao.entity.Admin;
import com.merrill.information.dao.entity.Login;
import com.merrill.information.service.admin.IAdminService;
import com.merrill.information.web.admin.vo.AdminLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {

    @Autowired
    private IAdminService adminService;

    @RequestMapping("/login")
    public String login(HttpSession session) {
        session.invalidate();
        return "admin/login/login";
    }

    @RequestMapping("/loginCommit")
    public String loginCommit(AdminLogin login, HttpSession session, Model model) {
        String code_in_session = (String) session.getAttribute("RANDOMCODE_IN_SESSION");
        if (!code_in_session.equalsIgnoreCase(login.getCode())){
            model.addAttribute("errorMsg", "验证码不正确！");
            session.setAttribute("login", login);
            return "admin/login/login";
        }
        Admin admin = adminService.login(login);
        if (admin != null) {
            session.setAttribute("admin_in_session", admin);
            return "redirect:/admin/admin";
        } else {
            model.addAttribute("errorMsg", "账号或密码不正确！");
            return "admin/login/login";
        }
    }

    @RequestMapping("/admin")
    public String admin() {
        return "admin/frameset/admin";
    }
}
