package com.merrill.information.service.user;

import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Notice;
import com.merrill.information.query.NoticeQueryObject;

import java.util.List;

public interface INoticeService {
    List getAllNotice();

    Notice getById(Long id);

    int getNumber();

    PageInfo getAll(NoticeQueryObject qo);

    void delete(Long id);

    void addNotice(Notice notice);

    void update(Notice notice);
}
