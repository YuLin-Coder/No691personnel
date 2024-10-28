package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.RoleMapper;
import com.zzc.model.Role;
import com.zzc.model.RoleExample;
import com.zzc.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Transactional(readOnly = false)
    public int deleteRoleById(Integer roleid) {
        return roleMapper.deleteByPrimaryKey(roleid);
    }

    @Transactional(readOnly = false)
    public int insertRole(Role role) {
        return roleMapper.insert(role);
    }

    @Transactional(readOnly = false)
    public int updateRoleById(Role role) {
        return roleMapper.updateByPrimaryKey(role);
    }

    @Transactional(readOnly = false)
    public Role selectRoleById(Integer roleid) {
        return roleMapper.selectByPrimaryKey(roleid);
    }

    public PageInfo<Role> selectRoleByExample(Integer pageNum, Role role) {
        //设定查询条件
        RoleExample example = new RoleExample();
        example.setOrderByClause("roleid");
        RoleExample.Criteria criteria = example.createCriteria();
        if (role.getRolename() != null && !"".equals(role.getRolename().trim()))
            criteria.andRolenameLike("%" + role.getRolename() + "%");
        //设置分页条件
        PageHelper.startPage(pageNum, 10);
        List<Role> roles = roleMapper.selectByExample(example);
        //返回分页结果
        return new PageInfo<Role>(roles);
    }

}
