package com.zzc.dao;

import com.zzc.model.Career;
import com.zzc.model.CareerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CareerMapper {
    int countByExample(CareerExample example);

    int deleteByExample(CareerExample example);

    int deleteByPrimaryKey(Integer careerid);

    int insert(Career record);

    int insertSelective(Career record);

    List<Career> selectByExample(CareerExample example);

    Career selectByPrimaryKey(Integer careerid);

    int updateByExampleSelective(@Param("record") Career record, @Param("example") CareerExample example);

    int updateByExample(@Param("record") Career record, @Param("example") CareerExample example);

    int updateByPrimaryKeySelective(Career record);

    int updateByPrimaryKey(Career record);

    List<Career> list(Career career);
}