package com.merrill.information.service.user.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Order;
import com.merrill.information.dao.mapper.DemandMapper;
import com.merrill.information.dao.mapper.OrderMapper;
import com.merrill.information.dao.mapper.UserMapper;
import com.merrill.information.query.MyDemandQueryObject;
import com.merrill.information.query.OrderQueryObject;
import com.merrill.information.query.QueryObject;
import com.merrill.information.service.user.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private DemandMapper demandMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public int undertake(Long demandId, Long userId) {
        demandMapper.setStatus(1L, demandId);
        return orderMapper.undertake(demandId, userId, new Date());
    }

    @Override
    @Transactional(readOnly = true)
    public PageInfo listMyUndertakeOrder(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<?> list = orderMapper.queryMyUndertakeOrder(qo);
        return new PageInfo(list);
    }

    @Override
    @Transactional(readOnly = true)
    public PageInfo listMyPublishOrder(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<?> list = orderMapper.queryMyPublishOrder(qo);
        return new PageInfo(list);
    }

    @Override
    @Transactional(readOnly = true)
    public Order getById(Long id) {
        Order order = orderMapper.getById(id);
        order.setDemand(demandMapper.getById(order.getDemand().getId()));
        order.setMeetUser(userMapper.selectByPrimaryKey(order.getMeetUser().getId()));
        order.setPublishUser(userMapper.selectByPrimaryKey(order.getPublishUser().getId()));
        order.getMeetUser().setPassword(null);
        order.getPublishUser().setPassword(null);
        return order;
    }

    @Override
    public Order finishOrder(Long id) {
//        Demand d = order.getDemand();
//        d.setStatus(2);
        Order order = orderMapper.getById(id);
        orderMapper.finishOrder(new Date(), id);
        demandMapper.setStatus(2L, order.getDemand().getId());
        order = orderMapper.getById(id);
        return order;
    }

    @Override
    @Transactional(readOnly = true)
    public List listByUserId(Long id) {
        return orderMapper.listByUserId(id);
    }

    @Override
    @Transactional(readOnly = true)
    public int getNumByPublisherId(Long id) {
        MyDemandQueryObject qo = new MyDemandQueryObject();
        qo.setId(id);
        return orderMapper.queryMyPublishOrder(qo).size();
    }

    @Override
    @Transactional(readOnly = true)
    public int getNumByUndertakerId(Long id) {
        MyDemandQueryObject qo = new MyDemandQueryObject();
        qo.setId(id);
        return orderMapper.queryMyUndertakeOrder(qo).size();
    }

    @Override
    @Transactional(readOnly = true)
    public PageInfo listAll(OrderQueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<?> list = orderMapper.listAll(qo);
        return new PageInfo(list);
    }
}
