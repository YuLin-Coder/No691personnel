package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.RewardMapper;
import com.zzc.dao.UserMapper;
import com.zzc.model.Reward;
import com.zzc.model.RewardExample;
import com.zzc.model.User;
import com.zzc.model.UserExample;
import com.zzc.service.RewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class RewardServiceImpl implements RewardService {
    @Autowired
    private RewardMapper rewardMapper;
    @Autowired
    private UserMapper userMapper;

    public PageInfo<Reward> selectRewardByExample(Integer pageNum, Reward reward) {
        List<Reward> rewards = rewardMapper.selectByExample(new RewardExample());
        return new PageInfo<Reward>(rewards);
    }

    @Transactional(readOnly = false)
    public int insertReward(Reward reward) {
        return rewardMapper.insert(reward);
    }

    @Transactional(readOnly = false)
    public int insertRewardSelective(Reward reward) {
        return rewardMapper.insertSelective(reward);
    }

    @Transactional(readOnly = false)
    public int updateRewardById(Reward reward) {
        return rewardMapper.updateByPrimaryKey(reward);
    }

    @Transactional(readOnly = false)
    public int updateRewardByIdSelective(Reward reward) {
        return rewardMapper.updateByPrimaryKeySelective(reward);
    }

    @Transactional(readOnly = false)
    public int deleteRewardById(Integer rewardid) {
        return rewardMapper.deleteByPrimaryKey(rewardid);
    }

    @Transactional(readOnly = false)
    public Reward selectRewardById(Integer rewardid) {
        return rewardMapper.selectByPrimaryKey(rewardid);
    }

    public PageInfo<Reward> list(Integer pageNum, Reward reward) {
        PageHelper.startPage(pageNum, 10);
        List<Reward> rewards = rewardMapper.list(reward);
        PageInfo<Reward> info = new PageInfo<Reward>(rewards);
        return info;
    }

    public PageInfo<User> listAllUser() {
        List<User> users = userMapper.selectByExample(new UserExample());
        return new PageInfo<User>(users);
    }

}
