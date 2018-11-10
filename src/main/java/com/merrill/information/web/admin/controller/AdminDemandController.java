package com.merrill.information.web.admin.controller;

import com.merrill.information.dao.entity.Demand;
import com.merrill.information.dao.entity.User;
import com.merrill.information.query.DemandQueryObject;
import com.merrill.information.service.user.IDemandService;
import com.merrill.information.service.user.IOrderService;
import com.merrill.information.service.user.ISortService;
import com.merrill.information.service.user.IUserService;
import com.merrill.information.web.admin.vo.AddDemandForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/admin")
public class AdminDemandController {
    @Autowired
    private IDemandService demandService;
    @Autowired
    private ISortService sortService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IOrderService orderService;

    @RequestMapping("/demandList")
    public String demandList(DemandQueryObject qo, HttpSession session){
        session.setAttribute("demands_in_session", demandService.listAll(qo));
        return "admin/demand/demandList";
    }

    @RequestMapping("/editDemandInfo")
    public String editDemandInfo(Long id, HttpSession session){
        session.setAttribute("sorts_in_session", sortService.listAll());
        Demand demand = demandService.getById(id);
        session.setAttribute("demand_in_session", demand);
        return "admin/demand/editDemandInfo";
    }

    @RequestMapping("/editDemandCommit")
    public String editDemandCommit(Demand demand, HttpSession session){
        Demand d = (Demand) session.getAttribute("demand_in_session");
        d.setSort(demand.getSort());
        d.setMoney(demand.getMoney());
        d.setTop(demand.getTop());
        d.setTitle(demand.getTitle());
        d.setContent(demand.getContent());
        demandService.update(demand);
        return "admin/success";
    }

    @RequestMapping("/addDemand")
    public String addDemand(HttpSession session){
        session.setAttribute("sorts_in_session", sortService.listAll());
        return "admin/demand/addDemand";
    }

    @RequestMapping("/addDemandCommit")
    public String addDemandCommit(AddDemandForm demandForm, Model model){
        User user = userService.getByPrimaryKey(demandForm.getUserId());
        if (user == null){
            model.addAttribute("Msg", "不存在该用户。");
            return "admin/success";
        }
        Demand demand = new Demand();
        demand.setUser(user);
        demand.setStatus(1);
        demand.setSort(sortService.getByPrimaryKey(demandForm.getSortId()));
        demand.setPublishtime(new Date());
        demand.setTop(demandForm.getTop());
        demand.setTitle(demandForm.getTitle());
        demand.setContent(demandForm.getContent());
        demand.setMoney(demandForm.getMoney());
        demandService.save(demand);
        model.addAttribute("Msg", "添加成功。");
        return "admin/success";
    }

    @RequestMapping("/deleteDemand")
    public String deleteDemand(Model model, Long[] ids){
        for (int i = 0; i < ids.length; i++) {
            Demand demand = demandService.getById(ids[i]);
            if (demand.getStatus() != 0){
                model.addAttribute("Msg", demand.getId() + "已经有人承接，无法删除。");
                return "admin/success";
            }
            demandService.delete(ids[i]);
        }
        model.addAttribute("Msg", "删除成功。");
        return "admin/success";
    }
}
