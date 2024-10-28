package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.*;
import com.zzc.model.*;
import com.zzc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper usermapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private StateMapper stateMapper;
    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private PostMapper postMapper;

    public PageInfo<User> selectUserByExample(Integer pageNum, User user) {
        List<User> users = usermapper.selectByExample(new UserExample());
        return new PageInfo<User>(users);
    }

    @Transactional(readOnly = false)
    public int insertUser(User user) {
        return usermapper.insert(user);
    }

    @Transactional(readOnly = false)
    public int insertUserSelective(User user) {
        return usermapper.insertSelective(user);
    }

    @Transactional(readOnly = false)
    public int updateUserById(User user) {
        return usermapper.updateByPrimaryKey(user);
    }

    public int updateUserByIdSelective(User user) {
        return usermapper.updateByPrimaryKeySelective(user);
    }

    @Transactional(readOnly = false)
    public int deleteUserById(Integer userid) {
        return usermapper.deleteByPrimaryKey(userid);
    }

    @Transactional(readOnly = false)
    public User selectUserById(Integer userid) {
        return usermapper.selectByPrimaryKey(userid);
    }

    public User login(String username) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<User> userses = usermapper.selectByExample(example);
        if (userses != null && userses.size() > 0)
            return userses.get(0);
        return null;
    }

    public PageInfo<User> list(Integer pageNum, User user) {
        PageHelper.startPage(pageNum, 10);
        List<User> users = usermapper.list(user);
        PageInfo<User> info = new PageInfo<User>(users);
        return info;
    }

    public PageInfo<Role> listAllRole() {
        List<Role> roles = roleMapper.selectByExample(new RoleExample());
        return new PageInfo<Role>(roles);
    }

    public PageInfo<State> listAllState() {
        List<State> states = stateMapper.selectByExample(new StateExample());
        return new PageInfo<State>(states);
    }

    public PageInfo<Dept> listAllDept() {
        List<Dept> depts = deptMapper.selectByExample(new DeptExample());
        return new PageInfo<Dept>(depts);
    }

    public PageInfo<Post> listAllPost() {
        List<Post> posts = postMapper.selectByExample(new PostExample());
        return new PageInfo<Post>(posts);
    }

}
