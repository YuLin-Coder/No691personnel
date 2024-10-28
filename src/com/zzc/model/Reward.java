package com.zzc.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Reward {
    private Integer rewardid;

    private String reason;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date rewarddate;

    private Integer fkuserid;

    public Integer getRewardid() {
        return rewardid;
    }

    public void setRewardid(Integer rewardid) {
        this.rewardid = rewardid;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Date getRewarddate() {
        return rewarddate;
    }

    public void setRewarddate(Date rewarddate) {
        this.rewarddate = rewarddate;
    }

    public Integer getFkuserid() {
        return fkuserid;
    }

    public void setFkuserid(Integer fkuserid) {
        this.fkuserid = fkuserid;
    }

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}