package com.zzc.model;

public class Post {
    private Integer postid;

    private String postname;

    private String postdesc;

    private Integer fkdeptid;

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public String getPostname() {
        return postname;
    }

    public void setPostname(String postname) {
        this.postname = postname == null ? null : postname.trim();
    }

    public String getPostdesc() {
        return postdesc;
    }

    public void setPostdesc(String postdesc) {
        this.postdesc = postdesc == null ? null : postdesc.trim();
    }

    public Integer getFkdeptid() {
        return fkdeptid;
    }

    public void setFkdeptid(Integer fkdeptid) {
        this.fkdeptid = fkdeptid;
    }


    private Dept dept;

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Post() {
    }
    public Post(Integer fkdeptid) {
        this.fkdeptid = fkdeptid;
    }
}