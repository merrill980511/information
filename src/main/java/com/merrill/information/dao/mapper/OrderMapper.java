package com.merrill.information.dao.mapper;

import com.merrill.information.dao.entity.Order;
import com.merrill.information.query.OrderQueryObject;
import com.merrill.information.query.QueryObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface OrderMapper {
    int undertake(@Param("demandId") Long demandId, @Param("userId") Long userId, @Param("date")Date date);

    List<?> queryMyPublishOrder(QueryObject qo);

    List<?> queryMyUndertakeOrder(QueryObject qo);

    Order getById(Long id);

    void finishOrder(@Param("date") Date date, @Param("id") Long id);

    List listByUserId(Long id);

    List listAll(OrderQueryObject qo);
}
