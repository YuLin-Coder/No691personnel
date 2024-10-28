package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Family;
import com.zzc.model.User;

/**
 * Created by zyz on 2016/11/9.
 */
public interface FamilyService {

    int deleteFamilyById(Integer familyid);

    int insertFamily(Family family);

    int insertFamilySelective(Family family);

    int updateFamilyById(Family family);

    int updateFamilyByIdSelective(Family family);

    Family selectFamilyById(Integer familyid);

    PageInfo<Family> selectFamilyByExample(Integer pageNum,  Family family);

    PageInfo<Family> list(Integer pageNum, Family family);


    PageInfo<User> listAllUser();

}
