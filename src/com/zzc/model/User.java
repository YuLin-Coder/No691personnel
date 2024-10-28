package com.zzc.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    private Integer userid;

    private String username;

    private String password;

    private String realname;

    private String sex;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    private String email;

    private String phone;

    private Integer fkroleid;



    private Integer fkstateid;

    private Integer fkpostid;
    private Integer fdeptid;

    public Integer getFdeptid() {
        return fdeptid;
    }

    public void setFdeptid(Integer fdeptid) {
        this.fdeptid = fdeptid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getFkroleid() {
        return fkroleid;
    }

    public void setFkroleid(Integer fkroleid) {
        this.fkroleid = fkroleid;
    }

    public Integer getFkstateid() {
        return fkstateid;
    }

    public void setFkstateid(Integer fkstateid) {
        this.fkstateid = fkstateid;
    }

    public Integer getFkpostid() {
        return fkpostid;
    }

    public void setFkpostid(Integer fkpostid) {
        this.fkpostid = fkpostid;
    }



    private Role role;
    private State state;
    private Post post;
    private Dept dept;


    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }


    public User() {
    }
    public User(Integer fkpostid) {
        this.fkpostid = fkpostid;
    }
}