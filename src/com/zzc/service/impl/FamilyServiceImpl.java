package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.FamilyMapper;
import com.zzc.dao.UserMapper;
import com.zzc.model.Family;
import com.zzc.model.FamilyExample;
import com.zzc.model.User;
import com.zzc.model.UserExample;
import com.zzc.service.FamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class FamilyServiceImpl implements FamilyService {
    @Autowired
    private FamilyMapper familyMapper;
    @Autowired
    private UserMapper userMapper;

    public PageInfo<Family> selectFamilyByExample(Integer pageNum, Family family) {
        List<Family> familys = familyMapper.selectByExample(new FamilyExample());
        return new PageInfo<Family>(familys);
    }

    @Transactional(readOnly = false)
    public int insertFamily(Family family) {
        return familyMapper.insert(family);
    }

    @Transactional(readOnly = false)
    public int insertFamilySelective(Family family) {
        return familyMapper.insertSelective(family);
    }

    @Transactional(readOnly = false)
    public int updateFamilyById(Family family) {
        return familyMapper.updateByPrimaryKey(family);
    }

    @Transactional(readOnly = false)
    public int updateFamilyByIdSelective(Family family) {
        return familyMapper.updateByPrimaryKeySelective(family);
    }

    @Transactional(readOnly = false)
    public int deleteFamilyById(Integer familyid) {
        return familyMapper.deleteByPrimaryKey(familyid);
    }

    @Transactional(readOnly = false)
    public Family selectFamilyById(Integer familyid) {
        return familyMapper.selectByPrimaryKey(familyid);
    }

    @Transactional(readOnly = false)
    public PageInfo<Family> list(Integer pageNum, Family family) {
        PageHelper.startPage(pageNum, 10);
        List<Family> familys = familyMapper.list(family);
        PageInfo<Family> info = new PageInfo<Family>(familys);
        return info;
    }

    public PageInfo<User> listAllUser() {
        List<User> users = userMapper.selectByExample(new UserExample());
        return new PageInfo<User>(users);
    }


}
