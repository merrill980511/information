package com.merrill.information.web.user.controller;

import com.merrill.information.service.user.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class NoticeController {
    @Autowired
    private INoticeService noticeService;

    @RequestMapping("/noticeInfo")
    public String noticeInfo(Long id, HttpSession session) {
        session.setAttribute("notice_in_session", noticeService.getById(id));
        return "/user/notice/noticeInfo";
    }
}
