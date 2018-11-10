package com.merrill.information.web.user.controller;

import com.merrill.information.dao.entity.User;
import com.merrill.information.service.user.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class InfoController {
    @Autowired
    private IUserService userService;

    @RequestMapping("/info")
    public String info() {
        return "user/info/editInfo";
    }

    @RequestMapping("/infoCommit")
    public String infoCommit(User user, HttpSession session) {
        userService.update(user);
        session.setAttribute("user_in_session", user);
        return "/user/welcome";
    }

    @RequestMapping("/resetPassword")
    public String resetPassword() {
        return "/user/info/password";
    }

    @RequestMapping("/showUserInfo")
    public String showUserInfo(Long id, Model model) {
        User user = userService.getByPrimaryKey(id);
        model.addAttribute("user", user);
        return "user/info/userInfo";
    }

    @RequestMapping("/resetPasswordCommit")
    public String resetPasswordCommit(String email, String password, String code, Model model, HttpSession session) {
        model.addAttribute("email", email);
        if (!userService.existEmail(email)){
            model.addAttribute("errorMsg", "该邮箱不存在！");
            return "user/info/password";
        }
        if (StringUtils.isNotBlank(code)){
            String code_in_session = (String) session.getAttribute("code_in_session");
            if (code.equals(code_in_session)){
                userService.updatePassword(email, DigestUtils.md5DigestAsHex(password.getBytes()));
                return "redirect:/user/login";
            } else {
                model.addAttribute("errorMsg", "验证码不正确！");
                return "user/info/password";
            }
        }
        code = userService.sendEmail(email, 6);
        session.setAttribute("code_in_session", code);
        return "user/info/password";
    }
}
