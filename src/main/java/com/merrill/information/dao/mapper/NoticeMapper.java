package com.merrill.information.dao.mapper;

import com.merrill.information.dao.entity.Notice;
import com.merrill.information.query.NoticeQueryObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface NoticeMapper {
    List getAllNotice();

    Notice getById(Long id);

    int getNumber();

    List<?> queryForObject(NoticeQueryObject qo);

    void deleteById(Long id);

    void insertNotice(@Param("account") Long account, @Param("datetime") Date datetime,
                      @Param("message") String message, @Param("title") String title);

    void update(@Param("title") String title, @Param("message") String message, @Param("id") Long id);
}
