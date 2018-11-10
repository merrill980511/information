package com.merrill.information.web.admin.controller;

import com.merrill.information.dao.entity.Order;
import com.merrill.information.query.OrderQueryObject;
import com.merrill.information.service.user.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
    @Autowired
    private IOrderService orderService;

    @RequestMapping("/orderList")
    public String orderList(OrderQueryObject qo, HttpSession session) {
        session.setAttribute("orders_in_session", orderService.listAll(qo));
        return "admin/order/orderList";
    }

    @RequestMapping("/orderInfo")
    public String orderInfo(Long id, HttpSession session) {
        Order order = orderService.getById(id);
        session.setAttribute("order_in_session", order);
        return "admin/order/orderInfo";
    }
}
