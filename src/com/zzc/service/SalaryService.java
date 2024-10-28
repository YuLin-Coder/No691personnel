package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.*;

/**
 * Created by zyz on 2016/11/9.
 */
public interface SalaryService {

    int deleteSalaryById(Integer salaryid);

    int insertSalary(Salary salary);

    int insertSalarySelective(Salary salary);

    int updateSalaryById(Salary salary);

    int updateSalaryByIdSelective(Salary salary);

    Salary selectSalaryById(Integer salaryid);

    PageInfo<Salary> selectSalaryByExample(Integer pageNum, Salary salary);

    PageInfo<Salary> list(Integer pageNum, Salary salary);


    PageInfo<Salary> foreList(Integer pageNum, Salary salary);

    PageInfo<User> listAllUser();

}
