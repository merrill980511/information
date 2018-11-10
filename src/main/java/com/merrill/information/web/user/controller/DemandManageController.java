package com.merrill.information.web.user.controller;

import com.merrill.information.dao.entity.Demand;
import com.merrill.information.dao.entity.User;
import com.merrill.information.service.user.IDemandService;
import com.merrill.information.web.user.vo.DemandForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class DemandManageController {
    @Autowired
    private IDemandService demandService;

    @RequestMapping("/myDemand")
    public String myDemand(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user_in_session");
        if (user == null) {
            model.addAttribute("errorMsg", "您还没登录，请先登录！");
            return "user/login/login";
        }
        List<Demand> list = demandService.listByUserId(((User) session.getAttribute("user_in_session")).getId());
        session.setAttribute("demands_in_session", list);
        return "user/demand/myDemand";
    }

    @RequestMapping("/editDemand")
    public String editDemand(Long id, HttpSession session) {
        Demand demand = demandService.getById(id);
        session.setAttribute("demand_in_session", demand);
        return "user/demand/editDemand";
    }

    @RequestMapping("/editDemandCommit")
    public String editDemandCommit(DemandForm demandForm, HttpSession session) {
        Demand d = (Demand) session.getAttribute("demand_in_session");
        demandService.demandForm2Demand(demandForm, d);
        demandService.update(d);
        return "redirect:/user/myDemand";
    }

    @RequestMapping("/deleteDemand")
    public String deleteDemand(Long id) {
        demandService.delete(id);
        return "redirect:/user/myDemand";
    }

}
