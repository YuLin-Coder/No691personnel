package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.*;

/**
 * Created by zyz on 2016/11/9.
 */
public interface UserService {

    int insertUser(User user);
    int insertUserSelective(User user);
    int updateUserById(User user);
    int updateUserByIdSelective(User user);
    int deleteUserById(Integer userid);
    User selectUserById(Integer userid);
    PageInfo<User> selectUserByExample(Integer pageNum, User user);
    PageInfo<User> list(Integer pageNum, User user);

    User login(String account);

    PageInfo<Role> listAllRole();
    PageInfo<State> listAllState();
    PageInfo<Dept> listAllDept();
    PageInfo<Post> listAllPost();

}
