package com.merrill.information.web.user.controller;

import com.merrill.information.dao.entity.User;
import com.merrill.information.service.user.IDemandService;
import com.merrill.information.service.user.INoticeService;
import com.merrill.information.service.user.IOrderService;
import com.merrill.information.service.user.ISortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class FramesetController {
    @Autowired
    private ISortService sortService;
    @Autowired
    private IDemandService demandService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private INoticeService noticeService;

    @RequestMapping("/top")
    public String top() {
        return "user/frameset/top";
    }

    @RequestMapping("/left")
    public String left(HttpSession session) {
        session.setAttribute("sorts_in_session", sortService.listAll());
        return "user/frameset/left";
    }

    @RequestMapping("/center")
    public String center() {
        return "redirect:/user/demandList";
    }

    @RequestMapping("/rightUp")
    public String rightUp(HttpSession session) {
        session.setAttribute("notices_in_session", noticeService.getAllNotice());
        return "user/frameset/rightUp";
    }

    @RequestMapping("/rightDown")
    public String rightDown(HttpSession session) {
        User user = (User) session.getAttribute("user_in_session");
        if (user != null){
            session.setAttribute("myDemand_in_session", demandService.listByUserId(user.getId()));
            session.setAttribute("myOrders_in_session", orderService.listByUserId(user.getId()));
            session.setAttribute("publishNumber", orderService.getNumByPublisherId(user.getId()));
            session.setAttribute("undertakeNumber", orderService.getNumByUndertakerId(user.getId()));
        }
        return "user/frameset/rightDown";
    }

}
