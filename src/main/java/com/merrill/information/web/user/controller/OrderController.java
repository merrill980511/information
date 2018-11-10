package com.merrill.information.web.user.controller;

import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Order;
import com.merrill.information.dao.entity.User;
import com.merrill.information.query.MyDemandQueryObject;
import com.merrill.information.service.user.IDemandService;
import com.merrill.information.service.user.IOrderService;
import com.merrill.information.service.user.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class OrderController {
    @Autowired
    private IOrderService orderService;

    @RequestMapping("/myUndertakeOrder")
    public String myUndertakeOrder(MyDemandQueryObject qo, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user_in_session");
        if (user == null) {
            model.addAttribute("errorMsg", "您还没登录，请先登录！");
            return "user/login/login";
        }
        qo.setId(user.getId());
        PageInfo p = orderService.listMyUndertakeOrder(qo);
        session.setAttribute("orders_in_session", p);
        return "user/order/myUndertakeOrder";
    }

    @RequestMapping("/myPublishOrder")
    public String myPublishOrder(MyDemandQueryObject qo, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user_in_session");
        if (user == null) {
            model.addAttribute("errorMsg", "您还没登录，请先登录！");
            return "user/login/login";
        }
        qo.setId(user.getId());
        PageInfo p = orderService.listMyPublishOrder(qo);
        session.setAttribute("orders_in_session", p);
        return "user/order/myPublishOrder";
    }

    @RequestMapping("/orderInfo")
    public String orderInfo(Long id, HttpSession session) {
        Order order = orderService.getById(id);
        session.setAttribute("order_in_session", order);
        return "user/order/orderInfo";
    }
}
