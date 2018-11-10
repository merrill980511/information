package com.merrill.information.service.user.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Demand;
import com.merrill.information.dao.mapper.DemandMapper;
import com.merrill.information.dao.mapper.SortMapper;
import com.merrill.information.query.QueryObject;
import com.merrill.information.service.user.IDemandService;
import com.merrill.information.web.user.vo.DemandForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class DemandServiceImpl implements IDemandService {

    @Autowired
    private DemandMapper mapper;
    @Autowired
    private SortMapper sortMapper;

    @Override
    @Transactional(readOnly = true)
    public List<Demand> listByUserAndStatus(Long userId, Integer status) {
        return mapper.listByUserAndStatus(userId, status);
    }

    @Override
    public int save(Demand demand){
        return mapper.save(demand.getTitle(), demand.getContent(), demand.getMoney(), demand.getStatus(),
                demand.getTop(), demand.getPublishtime(), demand.getEdittime(), demand.getUser().getId(), demand.getSort().getId());
    }

    @Override
    public int update(Demand demand){
        return mapper.update(demand.getId(), demand.getTitle(), demand.getContent(), demand.getMoney(), demand.getStatus(),
                demand.getTop(), demand.getPublishtime(), demand.getEdittime(), demand.getUser().getId(), demand.getSort().getId());
    }

    @Override
    @Transactional(readOnly = true)
    public PageInfo listAll(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<?> list = mapper.queryForObject(qo);
        return new PageInfo(list);
    }

    @Override
    public List<Demand> listByUserId(Long id) {
        return mapper.listByUserId(id);
    }

    @Override
    public int delete(Long demandId) {
        return mapper.delete(demandId);
    }

    @Override
    public Demand getById(Long demandId) {
        return mapper.getById(demandId);
    }

    @Override
    public void demandForm2Demand(DemandForm demandForm, Demand d) {
        Demand demand = demandForm2Demand(demandForm);
        d.setTitle(demand.getTitle());
        d.setContent(demand.getContent());
        d.setTop(demand.getTop());
        d.setMoney(demand.getMoney());
        d.setSort(demand.getSort());
    }

    @Override
    public int getNumber() {
        return mapper.getNumber();
    }

    public Demand demandForm2Demand(DemandForm demandForm) {
        Demand demand = new Demand();
        demand.setId(demandForm.getId());
        demand.setTitle(demandForm.getTitle());
        demand.setContent(demandForm.getContent());
        demand.setMoney(demandForm.getMoney());
        demand.setSort(sortMapper.selectByPrimaryKey(demandForm.getSort()));
        demand.setTop(demandForm.getTop());
        demand.setEdittime(new Date(new Date().getTime()));
        return demand;
    }

//    @Override
//    public List<Demand> queryByKeyWord(String keyword) {
//        return mapper.queryByKeyWord(keyword);
//    }
}
