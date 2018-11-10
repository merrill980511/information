package com.merrill.information.web.user.controller;

import com.merrill.information.dao.entity.Demand;
import com.merrill.information.dao.entity.Order;
import com.merrill.information.dao.entity.Sort;
import com.merrill.information.dao.entity.User;
import com.merrill.information.query.DemandQueryObject;
import com.merrill.information.service.user.IDemandService;
import com.merrill.information.service.user.IOrderService;
import com.merrill.information.service.user.ISortService;
import com.merrill.information.web.user.vo.DemandForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class DemandController {

    @Autowired
    private IDemandService demandService;
    @Autowired
    private ISortService sortService;
    @Autowired
    private IOrderService orderService;

    @RequestMapping("/demandList")
    public String demandList(DemandQueryObject qo, HttpSession session) {
        session.setAttribute("demands_in_session", demandService.listAll(qo));
        session.setAttribute("demandQueryContent", null);
        return "user/demand/demandList";
    }

    @RequestMapping("/publishDemand")
    public String publishDemand(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user_in_session");
        if (user == null) {
            model.addAttribute("errorMsg", "您还没登录，请先登录！");
            return "user/login/login";
        }
        if (demandService.listByUserAndStatus(user.getId(), -1).size() == 1) {
            model.addAttribute("demand_in_session", demandService.listByUserAndStatus(user.getId(), -1).get(0));
        }
        List<Sort> sorts = sortService.listAll();
        session.setAttribute("sorts_in_session", sorts);
        return "user/demand/publishDemand";
    }

    @RequestMapping("/publishDemandCommit")
    public String publishDemandCommit(DemandForm demandForm, HttpSession session) {
        Demand demand = demandForm2Demand(demandForm);
        demand.setUser((User) session.getAttribute("user_in_session"));
        demand.setPublishtime(new Date(new Date().getTime()));
        demand.setStatus(0);
        if (demand.getId() == null) {
            demandService.save(demand);
        } else {
            demandService.update(demand);
        }
        return "redirect:/user/demandList";
    }

    @RequestMapping("/saveDemandCommit")
    public String saveDemandCommit(DemandForm demandForm, HttpSession session) {
        Demand demand = demandForm2Demand(demandForm);
        demand.setUser((User) session.getAttribute("user_in_session"));
        demand.setStatus(-1);
        if (demand.getId() == null) {
            demandService.save(demand);
        } else {
            demandService.update(demand);
        }
        return "redirect:/user/demandList";
    }

    @RequestMapping("/deleteDemandCommit")
    public String deleteDemandCommit(DemandForm demandForm) {
        Demand demand = demandForm2Demand(demandForm);
        demandService.delete(demand.getId());
        return "redirect:/user/demandList";
    }

    public Demand demandForm2Demand(DemandForm demandForm) {
        Demand demand = new Demand();
        demand.setId(demandForm.getId());
        demand.setTitle(demandForm.getTitle());
        demand.setContent(demandForm.getContent());
        demand.setMoney(demandForm.getMoney());
        demand.setSort(sortService.getByPrimaryKey(demandForm.getSort()));
        demand.setTop(demandForm.getTop());
        demand.setEdittime(new Date(new Date().getTime()));
        return demand;
    }

    @RequestMapping("/undertakeDemand")
    public String undertakeDemand(Long demandId, Model model, HttpSession session) {
        Demand demand = demandService.getById(demandId);
        System.out.println(demand);
        User user = (User) session.getAttribute("user_in_session");
        if (user == null) {
            model.addAttribute("errorMsg", "您还没登录，请先登录！");
            return "user/login/login";
        }
        if (demand.getUser().getId() == user.getId()){
            model.addAttribute("errorMsg", "您不能承接自己的需求！");
            return "/user/demand/undertakeDemand";
        }
        orderService.undertake(demandId, user.getId());
        return "/user/demand/undertakeDemand";
    }

    @RequestMapping("/finishDemand")
    public String finishDemand(Long id, HttpSession session, Model model) {
        orderService.finishOrder(id);
        System.out.println("123123132132121");
        Order order = orderService.getById(id);
        session.setAttribute("order_in_session", order);
        model.addAttribute("isFinish", "finish");
        return "/user/order/orderInfo";
    }

    @RequestMapping("/demandInfo")
    public String demandInfo(Long id, Model model) {
        Demand demand = demandService.getById(id);
        model.addAttribute("demand", demand);
        return "user/demand/demandInfo";
    }
}
