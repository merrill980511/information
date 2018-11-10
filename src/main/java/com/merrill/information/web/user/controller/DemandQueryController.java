package com.merrill.information.web.user.controller;

import com.merrill.information.query.DemandQueryObject;
import com.merrill.information.service.user.IDemandService;
import com.merrill.information.web.user.vo.DemandQueryContent;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class DemandQueryController {
    @Autowired
    private IDemandService service;

    @RequestMapping("/demandQuery")
    public String demandQuery(DemandQueryObject qo, HttpSession session) {
        DemandQueryContent demandQueryContent = (DemandQueryContent) session.getAttribute("demandQueryContent");
        if (StringUtils.isNotBlank(qo.getKeyWord())) {
            if (demandQueryContent != null) {
                session.setAttribute("demandQueryContent", new DemandQueryContent(qo.getKeyWord(), demandQueryContent.getSortId()));
            } else {
                session.setAttribute("demandQueryContent", new DemandQueryContent(qo.getKeyWord(), -1L));
            }
        } else {
            if (demandQueryContent != null) {
                if (StringUtils.isNotBlank(demandQueryContent.getKeyWord())){
                    qo.setKeyWord(demandQueryContent.getKeyWord());
                }
                qo.setSortId(demandQueryContent.getSortId());
                qo.setStatus(demandQueryContent.getStatus());
            }
        }
        System.out.println(qo.getSortId());
        System.out.println(qo.getKeyWord());
        System.out.println(qo.getStatus());
        session.setAttribute("demands_in_session", service.listAll(qo));
        return "user/demand/demandList";
    }

    @RequestMapping("/unfinished")
    public String unfinished(DemandQueryObject qo, HttpSession session) {
//        DemandQueryContent demandQueryContent = (DemandQueryContent) session.getAttribute("demandQueryContent");
//        if (demandQueryContent != null){
//            demandQueryContent.setKeyWord(null);
//            demandQueryContent.setStatus(0);
//        } else {
            DemandQueryContent demandQueryContent = new DemandQueryContent(null, -1L);
            demandQueryContent.setStatus(0);
//        }
        session.setAttribute("demandQueryContent", demandQueryContent);
        qo.setStatus(0);
        session.setAttribute("demands_in_session", service.listAll(qo));
        return "user/demand/demandList";
    }

    @RequestMapping("/sortQuery")
    public String sortQuery(DemandQueryObject qo, HttpSession session) {
        DemandQueryContent demandQueryContent = new DemandQueryContent(null, qo.getSortId());
        session.setAttribute("demandQueryContent", demandQueryContent);
        session.setAttribute("demands_in_session", service.listAll(qo));
        return "user/demand/demandList";
    }
}
