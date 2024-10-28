package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.State;
import com.zzc.model.StateExample;

/**
 * Created by zyz on 2016/11/9.
 */
public interface StateService {

    int deleteStateById(Integer stateid);

    int insertState(State state);

    int updateStateById(State state);

    State selectStateById(Integer stateid);

    PageInfo<State> selectStateByExample(Integer pageNum, State state);

}
