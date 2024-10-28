package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Dept;

/**
 * Created by zyz on 2016/11/9.
 */
public interface DeptService {

    int deleteDeptById(Integer deptid);

    int insertDept(Dept dept);

    int updateDeptById(Dept dept);

    Dept selectDeptById(Integer deptid);

    PageInfo<Dept> selectDeptByExample(Integer pageNum, Dept dept);

}
