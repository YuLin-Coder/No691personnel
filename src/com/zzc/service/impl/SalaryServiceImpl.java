package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.*;
import com.zzc.model.*;
import com.zzc.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class SalaryServiceImpl implements SalaryService {
    @Autowired
    private SalaryMapper salaryMapper;
    @Autowired
    private UserMapper userMapper;

    public PageInfo<Salary> selectSalaryByExample(Integer pageNum, Salary salary) {
        List<Salary> salarys = salaryMapper.selectByExample(new SalaryExample());
        return new PageInfo<Salary>(salarys);
    }

    @Transactional(readOnly = false)
    public int insertSalary(Salary salary) {
        return salaryMapper.insert(salary);
    }

    @Transactional(readOnly = false)
    public int insertSalarySelective(Salary salary) {
        return salaryMapper.insertSelective(salary);
    }

    @Transactional(readOnly = false)
    public int updateSalaryById(Salary salary) {
        return salaryMapper.updateByPrimaryKey(salary);
    }

    @Transactional(readOnly = false)
    public int updateSalaryByIdSelective(Salary salary) {
    	System.out.println("测试"+salary);
        return salaryMapper.updateByPrimaryKeySelective(salary);
    }

    @Transactional(readOnly = false)
    public int deleteSalaryById(Integer salaryid) {
        return salaryMapper.deleteByPrimaryKey(salaryid);
    }

    @Transactional(readOnly = false)
    public Salary selectSalaryById(Integer salaryid) {
        return salaryMapper.selectByPrimaryKey(salaryid);
    }

    public PageInfo<Salary> list(Integer pageNum, Salary salary) {
        PageHelper.startPage(pageNum, 10);
        List<Salary> salarys = salaryMapper.list(salary);
        PageInfo<Salary> info = new PageInfo<Salary>(salarys);
        return info;
    }

    public PageInfo<Salary> foreList(Integer pageNum, Salary salary) {
        PageHelper.startPage(pageNum, 8);
        List<Salary> salarys = salaryMapper.list(salary);
        PageInfo<Salary> info = new PageInfo<Salary>(salarys);
        return info;
    }

    public PageInfo<User> listAllUser() {
        List<User> users = userMapper.selectByExample(new UserExample());
        return new PageInfo<User>(users);
    }

}
