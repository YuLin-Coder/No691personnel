package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.StateMapper;
import com.zzc.model.State;
import com.zzc.model.StateExample;
import com.zzc.service.StateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class StateServiceImpl implements StateService {
    @Autowired
    private StateMapper salaryMapper;

    @Transactional(readOnly = false)
    public int deleteStateById(Integer stateid) {
        return salaryMapper.deleteByPrimaryKey(stateid);
    }

    @Transactional(readOnly = false)
    public int insertState(State state) {
        return salaryMapper.insert(state);
    }

    @Transactional(readOnly = false)
    public int updateStateById(State state) {
        return salaryMapper.updateByPrimaryKey(state);
    }

    @Transactional(readOnly = false)
    public State selectStateById(Integer stateid) {
        return salaryMapper.selectByPrimaryKey(stateid);
    }

    public PageInfo<State> selectStateByExample(Integer pageNum, State state) {
        //设定查询条件
        StateExample example = new StateExample();
        example.setOrderByClause("stateid");
        StateExample.Criteria criteria = example.createCriteria();
        if (state.getStatename() != null && !"".equals(state.getStatename().trim()))
            criteria.andStatenameLike("%" + state.getStatename() + "%");
        //设置分页条件
        PageHelper.startPage(pageNum, 10);
        List<State> states = salaryMapper.selectByExample(example);
        //返回分页结果
        return new PageInfo<State>(states);
    }

}
