package com.zzc.controller;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Reward;
import com.zzc.model.User;
import com.zzc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Simpson on 2017/2/20.
 */
@Controller
@RequestMapping("/reward")
public class RewardController {
    @Autowired
    private RewardService rewardService;

    @RequestMapping("/list")
    public String list(Model model, Reward reward, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Reward> info = rewardService.list(pageNum, reward);
        model.addAttribute("user",rewardService.listAllUser());
        model.addAttribute("info", info);
        model.addAttribute("reward", reward);
        return "background/reward/rewardlist";
    }

    @RequestMapping("/listFore")
    public String listFore(Model model, Reward reward, Integer pageNum, HttpServletRequest request) {
        if (pageNum == null){
            pageNum = 1;
        }
        Integer userid = ((User)request.getSession().getAttribute("user")).getUserid();
        reward.setFkuserid(userid);
        PageInfo<Reward> info = rewardService.list(pageNum, reward);
        model.addAttribute("user",rewardService.listAllUser());
        model.addAttribute("info", info);
        model.addAttribute("reward", reward);
        return "foreground/reward/rewardlist";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("user",rewardService.listAllUser());
        return "background/reward/rewardadd";
    }

    @RequestMapping(value = "/edit")
    public String editRewards(Reward rewards,Model model) {
        int result = -1;
        if (rewards.getRewardid() != null && rewards.getRewardid() > 0) {
            //修改
        	System.out.println("测试"+rewards.getReason()+"sdf"+rewards.getRewardid());
            result = rewardService.updateRewardByIdSelective(rewards);
        } else {
            //添加
            rewards.setRewarddate(new Date());
            result = rewardService.insertRewardSelective(rewards);
        }
        if (result > 0) {
            model.addAttribute("message","操作成功！");
            return "message";
        } else {
            model.addAttribute("message","操作失败！");
            return "message";
        }
    }

    @RequestMapping(value = "/{rewardid}/detail", produces = {"application/json;charset=UTF-8"})
    public String detail(Model model, @PathVariable("rewardid") Integer rewardid) {
        Reward reward = null;
        try {
            if (rewardid != null) {
                reward = rewardService.selectRewardById(rewardid);
                model.addAttribute("reward", reward);
                model.addAttribute("user",rewardService.listAllUser());
                return "background/reward/rewardupdate";
            }
        } catch (Exception e) {
            model.addAttribute("message", "查找失败");
            return "message";
        }
        return null;
    }

    @RequestMapping(value = "/{rewardid}/delete", produces = {"application/json;charset=UTF-8"})
    public String delete(Model model,@PathVariable("rewardid") Integer rewardid) {
        int result = -1;
        if (rewardid != null) {
            result = rewardService.deleteRewardById(rewardid);
        }
        if (result > 0) {
            return list(model,new Reward(),1);
        }
        return null;
    }


}
