package com.merrill.information.service.user.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Notice;
import com.merrill.information.dao.mapper.NoticeMapper;
import com.merrill.information.query.NoticeQueryObject;
import com.merrill.information.service.user.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class NoticeServiceImpl implements INoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    @Transactional(readOnly = true)
    public List getAllNotice() {
        return noticeMapper.getAllNotice();
    }

    @Override
    @Transactional(readOnly = true)
    public Notice getById(Long id) {
        return noticeMapper.getById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public int getNumber() {
        return noticeMapper.getNumber();
    }

    @Override
    @Transactional(readOnly = true)
    public PageInfo getAll(NoticeQueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<?> list = noticeMapper.queryForObject(qo);
        return new PageInfo(list);
    }

    @Override
    public void delete(Long id) {
        noticeMapper.deleteById(id);
    }

    @Override
    public void addNotice(Notice notice) {
        noticeMapper.insertNotice(notice.getAdmin().getAccount(), notice.getDatetime(),
                notice.getMessage(), notice.getTitle());
    }

    @Override
    public void update(Notice notice) {
        noticeMapper.update(notice.getTitle(), notice.getMessage(), notice.getId());
    }
}
