package com.merrill.information.web.admin.controller;

import com.merrill.information.dao.entity.Admin;
import com.merrill.information.dao.entity.Notice;
import com.merrill.information.query.NoticeQueryObject;
import com.merrill.information.service.user.INoticeService;
import com.merrill.information.web.admin.vo.NoticeForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/admin")
public class AdminNoticeController {
    @Autowired
    private INoticeService noticeService;

    @RequestMapping("/noticeList")
    public String noticeList(HttpSession session, NoticeQueryObject qo){
        session.setAttribute("notices_in_session", noticeService.getAll(qo));
        return "admin/notice/noticeList";
    }

    @RequestMapping("/deleteNoticeCommit")
    public String deleteNoticeCommit(Model model, Long[] ids){
        for (int i = 0; i < ids.length; i++) {
            noticeService.delete(ids[i]);
        }
        model.addAttribute("Msg", "删除成功。");
        return "admin/success";
    }


    @RequestMapping("/addNotice")
    public String addNotice(){
        return "admin/notice/addNotice";
    }

    @RequestMapping("/addNoticeCommit")
    public String addNoticeCommit(Model model, HttpSession session, NoticeForm form){
        Notice notice = new Notice();
        Admin admin = (Admin) session.getAttribute("admin_in_session");
        notice.setAdmin(admin);
        notice.setDatetime(new Date());
        notice.setMessage(form.getContent());
        notice.setTitle(form.getTitle());
        noticeService.addNotice(notice);
        model.addAttribute("Msg", notice.getTitle() + "发布成功。");
        return "admin/success";
    }

    @RequestMapping("/editNotice")
    public String editNotice(HttpSession session, Long id){
        session.setAttribute("notice_in_session", noticeService.getById(id));
        return "admin/notice/editNotice";
    }

    @RequestMapping("/editNoticeCommit")
    public String editNoticeCommit(HttpSession session, Model model, NoticeForm form){
        Notice notice = (Notice) session.getAttribute("notice_in_session");
        notice.setTitle(form.getTitle());
        notice.setMessage(form.getContent());
        noticeService.update(notice);
        model.addAttribute("Msg", notice.getTitle() + "修改成功。");
        return "admin/success";
    }
}
