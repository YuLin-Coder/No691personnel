package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.CareerMapper;
import com.zzc.dao.UserMapper;
import com.zzc.model.Career;
import com.zzc.model.CareerExample;
import com.zzc.model.User;
import com.zzc.model.UserExample;
import com.zzc.service.CareerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class CareerServiceImpl implements CareerService {
    @Autowired
    private CareerMapper careerMapper;
    @Autowired
    private UserMapper userMapper;

    public PageInfo<Career> selectCareerByExample(Integer pageNum, Career career) {
        List<Career> careers = careerMapper.selectByExample(new CareerExample());
        return new PageInfo<Career>(careers);
    }

    @Transactional(readOnly = false)
    public int insertCareer(Career career) {
        return careerMapper.insert(career);
    }

    @Transactional(readOnly = false)
    public int insertCareerSelective(Career career) {
        return careerMapper.insertSelective(career);
    }

    @Transactional(readOnly = false)
    public int updateCareerById(Career career) {
        return careerMapper.updateByPrimaryKey(career);
    }

    @Transactional(readOnly = false)
    public int updateCareerByIdSelective(Career career) {
        return careerMapper.updateByPrimaryKeySelective(career);
    }

    @Transactional(readOnly = false)
    public int deleteCareerById(Integer careerid) {
        return careerMapper.deleteByPrimaryKey(careerid);
    }

    @Transactional(readOnly = false)
    public Career selectCareerById(Integer careerid) {
        return careerMapper.selectByPrimaryKey(careerid);
    }

    public PageInfo<Career> list(Integer pageNum, Career career) {
        PageHelper.startPage(pageNum, 10);
        List<Career> careers = careerMapper.list(career);
        PageInfo<Career> info = new PageInfo<Career>(careers);
        return info;
    }

    public PageInfo<User> listAllUser() {
        List<User> users = userMapper.selectByExample(new UserExample());
        return new PageInfo<User>(users);
    }

}
