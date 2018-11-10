package com.merrill.information.service.user.impl;

import com.merrill.information.service.user.IBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.common.Mapper;

import java.io.Serializable;
import java.util.List;

@Transactional
public abstract class BaseServiceImpl<T> implements IBaseService<T> {
    @Autowired
    private Mapper<T> mapper;

    @Override
    public int save(T t) {
        return this.mapper.insert(t);
    }

    @Override
    public void delete(T t) {
        this.mapper.delete(t);
    }

    @Override
    public void deleteByPrimaryKey(Serializable id) {
        this.mapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(T t) {
        this.mapper.updateByPrimaryKey(t);
    }

    @Transactional(readOnly = true)
    @Override
    public List<T> listAll() {
        return this.mapper.selectAll();
    }

    @Transactional(readOnly = true)
    @Override
    public T getByPrimaryKey(Serializable id) {
        return this.mapper.selectByPrimaryKey(id);
    }
}
