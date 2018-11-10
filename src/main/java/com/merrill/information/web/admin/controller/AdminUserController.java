package com.merrill.information.web.admin.controller;

import com.merrill.information.dao.entity.User;
import com.merrill.information.query.UserQueryObject;
import com.merrill.information.service.user.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
    @Autowired
    private IUserService userService;

    @RequestMapping("/addUser")
    public String addUser(){
        return "admin/user/addUser";
    }

    @RequestMapping("/addUserCommit")
    public String addUserCommit(User user, Model model){
        if(userService.existEmail(user.getEmail())){
            model.addAttribute("Msg", user.getEmail() + "已经存在了。");
        } else {
            userService.saveUser(user);
            model.addAttribute("Msg", "添加成功。");
        }
        return "admin/success";
    }

    @RequestMapping("/userList")
    public String userList(HttpSession session, UserQueryObject qo){
        session.setAttribute("users_in_session", userService.listAllUsers(qo));
        return "admin/user/userList";
    }

    @RequestMapping("/editUserInfo")
    public String editUserInfo(HttpSession session, Long id){
        session.setAttribute("user", userService.getByPrimaryKey(id));
        return "admin/user/editUserInfo";
    }

    @RequestMapping("/editUserInfoCommit")
    public String editUserInfoCommit(User user, Model model, HttpSession session){
        userService.update(user);
        User u = (User) session.getAttribute("user");
        userService.updatePassword(u.getEmail(), u.getPassword());
        model.addAttribute("Msg", "信息修改成功");
        return "admin/success";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(Model model, HttpSession session, UserQueryObject qo, String[] emails){
        session.setAttribute("users_in_session", userService.listAllUsers(qo));
        for (int i = 0; i < emails.length; i++) {
            userService.deleteUser(emails[i]);
        }
        model.addAttribute("Msg", "删除成功");
        return "admin/success";
    }

    @RequestMapping("/editUserPassword")
    public String editUserPassword(Long id, HttpSession session){
        User user = userService.getByPrimaryKey(id);
        session.setAttribute("user_in_session", user);
        return "admin/user/editPassword";
    }

    @RequestMapping("/editUserPasswordCommit")
    public String editUserPasswordCommit(String password, Model model, HttpSession session){
        User user = (User) session.getAttribute("user_in_session");
        if (userService.updatePassword(user.getEmail(), password) == 1){
            model.addAttribute("Msg", user.getName() + "的密码已重置");
        } else {
            model.addAttribute("Msg", "请重新设置“" + user.getName() + "”的密码");
        }
        return "admin/success";
    }
}
