package com.zzc.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.zzc.model.*;
import com.zzc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Simpson on 2017/2/20.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;
    @Autowired
    private CareerService careerService;
    @Autowired
    private LanguageService languageService;
    @Autowired
    private FamilyService familyService;

    @RequestMapping("/list")
    public String list(Model model, User user, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        user.setFkstateid(1);
        PageInfo<User> info = userService.list(pageNum, user);
        model.addAttribute("info", info);
        model.addAttribute("user", user);
        model.addAttribute("post",userService.listAllPost());
        model.addAttribute("dept",userService.listAllDept());
        return "background/user/userlist";
    }

    @RequestMapping("/listFore")
    public String listFore(Model model, User user, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<User> info = userService.list(pageNum, user);
        model.addAttribute("info", info);
        model.addAttribute("user", user);
        model.addAttribute("post",userService.listAllPost());
        model.addAttribute("dept",userService.listAllDept());
        return "foreground/user/userlist";
    }

    @RequestMapping("/listMarket")
    public String listMarket(Model model, User user, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        user.setFkstateid(3);
        PageInfo<User> info = userService.list(pageNum, user);
        model.addAttribute("info", info);
        model.addAttribute("user", user);
        return "background/user/userlistMarket";
    }

    @RequestMapping("/listRetire")
    public String listRetire(Model model, User user, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        user.setFkstateid(2);
        PageInfo<User> info = userService.list(pageNum, user);
        model.addAttribute("info", info);
        model.addAttribute("user", user);
        return "background/user/userlistRetire";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("role",userService.listAllRole());
        model.addAttribute("state",userService.listAllState());
        //model.addAttribute("post",userService.listAllPost());
        model.addAttribute("dept",userService.listAllDept());
        return "background/user/useradd";
    }

    @RequestMapping(value = "/edit")
    public String editUsers(User users,Model model) {
        int result = -1;
        if (users.getUserid() != null && users.getUserid() > 0) {
            //修改
            result = userService.updateUserByIdSelective(users);
        } else {
            //添加
            result = userService.insertUserSelective(users);
        }
        if (result > 0) {
            model.addAttribute("message","操作成功！");
            return "message";
        } else {
            model.addAttribute("message","操作失败！");
            return "message";
        }
    }

    @RequestMapping(value = "/{userid}/detail", produces = {"application/json;charset=UTF-8"})
    public String detail(Model model, @PathVariable("userid") Integer userid) {
        User user = null;
        try {
            if (userid != null) {
                user = userService.selectUserById(userid);
                model.addAttribute("user", user);
                model.addAttribute("role",userService.listAllRole());
                model.addAttribute("state",userService.listAllState());
                model.addAttribute("post",userService.listAllPost());
                model.addAttribute("dept",userService.listAllDept());
                return "background/user/userupdate";
            }
        } catch (Exception e) {
            model.addAttribute("message", "查找失败");
            return "message";
        }
        return null;
    }

    @RequestMapping(value = "/{userid}/toDetail", produces = {"application/json;charset=UTF-8"})
    public String toDetail(Model model, @PathVariable("userid") Integer userid) {
        User user = null;

        try {
            if (userid != null) {
                user = userService.selectUserById(userid);
                model.addAttribute("user", user);
                model.addAttribute("families",familyService.list(1,new Family(userid)));
                model.addAttribute("languages",languageService.list(1,new Language(userid)));
                model.addAttribute("careers",careerService.list(1,new Career(userid)));
                return "background/user/userdetail";
            }
        } catch (Exception e) {
            model.addAttribute("message", "查找失败");
            return "message";
        }
        return null;
    }


    @RequestMapping(value = "/{userid}/entry", produces = {"application/json;charset=UTF-8"})
    public String entry(Model model, @PathVariable("userid") Integer userid) {
        User user = null;
        try {
            if (userid != null) {
                user = userService.selectUserById(userid);
                model.addAttribute("user", user);
                model.addAttribute("role",userService.listAllRole());
                model.addAttribute("post",userService.listAllPost());
                model.addAttribute("dept",userService.listAllDept());
                return "background/user/userentry";
            }
        } catch (Exception e) {
            model.addAttribute("message", "查找失败");
            return "message";
        }
        return null;
    }

    @RequestMapping(value = "/{userid}/delete", produces = {"application/json;charset=UTF-8"})
    public String delete(Model model,@PathVariable("userid") Integer userid) {
        int result = -1;
        if (userid != null) {
            result = userService.deleteUserById(userid);
        }
        if (result > 0) {
            return list(model,new User(),1);
        }
        return null;
    }

    @RequestMapping("/{fkdeptid}/add_post")
    public void add_post(Model model, @PathVariable("fkdeptid") Integer fkdeptid, HttpServletResponse response) {
        //response.setContentType("application/json;charset=UTF-8");
        model.addAttribute("post",postService.list(1,new Post(fkdeptid)).getList());
        String message = JSONObject.toJSONString(postService.list(1,new Post(fkdeptid)).getList());
        response.setContentType("application/json;charset=utf-8");
        try {
            PrintWriter out = response.getWriter();
            out.println(message);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //return "background/user/useradd";
    }

}
