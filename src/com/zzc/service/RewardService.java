package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Reward;
import com.zzc.model.User;

/**
 * Created by zyz on 2016/11/9.
 */
public interface RewardService {

    int deleteRewardById(Integer rewardid);

    int insertReward(Reward reward);

    int insertRewardSelective(Reward reward);

    int updateRewardById(Reward reward);

    int updateRewardByIdSelective(Reward reward);

    Reward selectRewardById(Integer rewardid);

    PageInfo<Reward> selectRewardByExample(Integer pageNum, Reward reward);

    PageInfo<Reward> list(Integer pageNum, Reward reward);


    PageInfo<User> listAllUser();

}
