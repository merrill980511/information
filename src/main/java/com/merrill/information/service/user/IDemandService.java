package com.merrill.information.service.user;

import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Demand;
import com.merrill.information.query.QueryObject;
import com.merrill.information.web.user.vo.DemandForm;

import java.util.List;

public interface IDemandService{
    List<Demand> listByUserAndStatus(Long userId, Integer status);

    int save(Demand demand);

    int update(Demand demand);

    PageInfo listAll(QueryObject qo);

    List<Demand> listByUserId(Long id);

    int delete(Long demandId);

    Demand getById(Long demandId);

    void demandForm2Demand(DemandForm demandForm, Demand d);

    int getNumber();

//    public List<Demand> queryByKeyWord(String keyword);
}
