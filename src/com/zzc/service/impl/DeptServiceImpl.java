package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.DeptMapper;
import com.zzc.model.Dept;
import com.zzc.model.DeptExample;
import com.zzc.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;

    @Transactional(readOnly = false)
    public int deleteDeptById(Integer deptid) {
        return deptMapper.deleteByPrimaryKey(deptid);
    }

    @Transactional(readOnly = false)
    public int insertDept(Dept dept) {
        return deptMapper.insert(dept);
    }

    @Transactional(readOnly = false)
    public int updateDeptById(Dept dept) {
        return deptMapper.updateByPrimaryKey(dept);
    }

    @Transactional(readOnly = false)
    public Dept selectDeptById(Integer deptid) {
        return deptMapper.selectByPrimaryKey(deptid);
    }

    public PageInfo<Dept> selectDeptByExample(Integer pageNum, Dept dept) {
        //设定查询条件
        DeptExample example = new DeptExample();
        example.setOrderByClause("deptid");
        DeptExample.Criteria criteria = example.createCriteria();
        if (dept.getDeptname() != null && !"".equals(dept.getDeptname().trim()))
            criteria.andDeptnameLike("%" + dept.getDeptname() + "%");
        //设置分页条件
        PageHelper.startPage(pageNum, 10);
        List<Dept> depts = deptMapper.selectByExample(example);
        //返回分页结果
        return new PageInfo<Dept>(depts);
    }

}
