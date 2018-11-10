package com.merrill.information.service.user;

import java.io.Serializable;
import java.util.List;

public interface IBaseService<T> {
    int save(T t);

    void delete(T t);

    void deleteByPrimaryKey(Serializable id);

    void update(T t);

    List<T> listAll();

    T getByPrimaryKey(Serializable id);
}
