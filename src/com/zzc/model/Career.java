package com.zzc.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Career {
    private Integer careerid;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startdate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date enddate;

    private String position;

    private String company;

    private Integer fkuserid;

    public Integer getCareerid() {
        return careerid;
    }

    public void setCareerid(Integer careerid) {
        this.careerid = careerid;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
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

    public Career() {
    }
    public Career(Integer fkuserid) {
        this.fkuserid = fkuserid;
    }
}