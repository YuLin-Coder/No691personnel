package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Career;
import com.zzc.model.User;

/**
 * Created by zyz on 2016/11/9.
 */
public interface CareerService {

    int deleteCareerById(Integer careerid);

    int insertCareer(Career career);

    int insertCareerSelective(Career career);

    int updateCareerById(Career career);

    int updateCareerByIdSelective(Career career);

    Career selectCareerById(Integer careerid);

    PageInfo<Career> selectCareerByExample(Integer pageNum, Career career);

    PageInfo<Career> list(Integer pageNum, Career career);


    PageInfo<User> listAllUser();

}
