package com.merrill.information.service.user;

import com.github.pagehelper.PageInfo;
import com.merrill.information.dao.entity.Order;
import com.merrill.information.query.OrderQueryObject;
import com.merrill.information.query.QueryObject;

import java.util.List;

public interface IOrderService {
    int undertake(Long demandId, Long userId);

    PageInfo listMyUndertakeOrder(QueryObject qo);

    PageInfo listMyPublishOrder(QueryObject qo);

    Order getById(Long id);

    Order finishOrder(Long id);

    List listByUserId(Long id);

    int getNumByPublisherId(Long id);

    int getNumByUndertakerId(Long id);

    PageInfo listAll(OrderQueryObject qo);
}
