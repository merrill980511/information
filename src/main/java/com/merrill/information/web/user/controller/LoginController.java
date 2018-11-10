package com.merrill.information.web.user.controller;

import com.merrill.information.dao.entity.Login;
import com.merrill.information.dao.entity.User;
import com.merrill.information.service.user.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {

    @Autowired
    private IUserService service;

    @RequestMapping("/login")
    public String login(HttpSession session) {
        session.invalidate();
        return "user/login/login";
    }

    @RequestMapping(value = "/loginCommit", method = RequestMethod.POST)
    public String loginCommit(Login login, HttpSession session, Model model) {
        String code_in_session = (String) session.getAttribute("RANDOMCODE_IN_SESSION");
        if (!code_in_session.equalsIgnoreCase(login.getCode())){
            model.addAttribute("errorMsg", "验证码不正确！");
            session.setAttribute("login", login);
            return "user/login/login";
        }
        User user = service.login(login);
        if (user != null) {
//            System.out.println(information.getBirthday());
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            String dd =format.format(user.getBirthday());
//            System.out.println(dd);
//            information.setBirthday(new Date(dd));
            session.setAttribute("user_in_session", user);
            login = service.getLogin(login.getEmail());
            session.setAttribute("login", login);
//            return "user/demand/demandList";
            return "redirect:/user/user";
        } else {
             model.addAttribute("errorMsg", "账号或密码不正确！");
            return "user/login/login";
        }
    }

    @RequestMapping("/registerEmail")
    public String registerEmail() {
        return "user/login/email";
    }

    @RequestMapping(value = "/registerEmailCommit", method = RequestMethod.POST)
    public String registerEmailCommit(String email, String code, Model model, HttpSession session) {
        model.addAttribute("email", email);
        if (service.existEmail(email)){
            model.addAttribute("errorMsg", "该邮箱已被注册！");
            return "user/login/email";
        }
        if (StringUtils.isNotBlank(code)){
            String code_in_session = (String) session.getAttribute("code_in_session");
            if (code.equals(code_in_session)){
                session.setAttribute("code_in_session", null);
                return "user/login/register";
            } else {
                model.addAttribute("errorMsg", "验证码不正确！");
                return "user/login/email";
            }
        }
        code = service.sendEmail(email, 6);
        session.setAttribute("code_in_session", code);
        return "user/login/email";
    }

    @RequestMapping("/register")
    public String register(HttpSession session) {
        session.setAttribute("errorMsg", null);
        return "user/login/register";
    }

    @RequestMapping(value = "/registerCommit", method = RequestMethod.POST)
    public String registerCommit(User user) {
        user = service.saveUser(user);
        System.out.println(user);
        return "user/welcome";
    }

    @RequestMapping("/user")
    public String user() {
        return "user/frameset/user";
    }
}
