package com.merrill.information.service.user.impl;

import com.merrill.information.dao.entity.Sort;
import com.merrill.information.dao.mapper.SortMapper;
import com.merrill.information.service.user.ISortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SortServiceImpl extends BaseServiceImpl<Sort> implements ISortService {
    @Autowired
    private SortMapper mapper;
}
