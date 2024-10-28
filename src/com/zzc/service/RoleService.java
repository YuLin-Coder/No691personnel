package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Role;
import com.zzc.model.RoleExample;

/**
 * Created by zyz on 2016/11/9.
 */
public interface RoleService {

    int deleteRoleById(Integer roleid);

    int insertRole(Role role);

    int updateRoleById(Role role);

    Role selectRoleById(Integer roleid);

    PageInfo<Role> selectRoleByExample(Integer pageNum, Role role);

}
