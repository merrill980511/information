package com.merrill.information.web.admin.controller;

import com.merrill.information.service.user.IDemandService;
import com.merrill.information.service.user.INoticeService;
import com.merrill.information.service.user.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminFramesetController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IDemandService demandService;
    @Autowired
    private INoticeService noticeService;

    @RequestMapping("/top")
    public String top() {
        return "admin/frameset/top";
    }

    @RequestMapping("/left")
    public String left() {
        return "admin/frameset/left";
    }

    @RequestMapping("/right")
    public String right(HttpSession session) {
        int userNumber = userService.getNumber();
        session.setAttribute("userNumber", userNumber);
        int demandNumber = demandService.getNumber();
        session.setAttribute("demandNumber", demandNumber);
        int noticeNumber = noticeService.getNumber();
        session.setAttribute("noticeNumber", noticeNumber);
        return "admin/frameset/welcome";
    }

}
