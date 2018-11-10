package com.merrill.information.dao.mapper;

import com.merrill.information.dao.entity.Demand;
import com.merrill.information.query.QueryObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Repository
public interface DemandMapper {
    int save(@Param("title") String title, @Param("content") String content, @Param("money") BigDecimal money, @Param("status") int status,
                    @Param("top") int top, @Param("publishTime") Date publishTime, @Param("editTime") Date editTime, @Param("u_id") Long u_id, @Param("s_id") Long s_id);

    int update(@Param("id") Long id, @Param("title") String title, @Param("content") String content, @Param("money") BigDecimal money, @Param("status") int status,
                      @Param("top") int top, @Param("publishTime") Date publishTime, @Param("editTime") Date editTime, @Param("u_id") Long u_id, @Param("s_id") Long s_id);

    List<Demand> listByUserAndStatus(@Param("userId") Long userId, @Param("status") Integer status);

    Demand getById(Long id);

    List<Demand> listAll();

    List<Demand> listByUserId(Long id);

    List<?> queryForObject(QueryObject qo);

    int delete(Long demandId);

    int setStatus(@Param("status") long status, @Param("demandId") Long demandId);

    int getNumber();
}