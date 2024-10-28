package com.zzc.dao;

import com.zzc.model.Family;
import com.zzc.model.FamilyExample;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FamilyMapper {
    int countByExample(FamilyExample example);

    int deleteByExample(FamilyExample example);

    int deleteByPrimaryKey(Integer familyid);

    int insert(Family record);

    int insertSelective(Family record);

    List<Family> selectByExample(FamilyExample example);

    Family selectByPrimaryKey(Integer familyid);

    int updateByExampleSelective(@Param("record") Family record, @Param("example") FamilyExample example);

    int updateByExample(@Param("record") Family record, @Param("example") FamilyExample example);

    int updateByPrimaryKeySelective(Family record);

    int updateByPrimaryKey(Family record);

    List<Family> list(Family family);
}