package com.zzc.controller;

import com.github.pagehelper.PageInfo;
import com.zzc.model.User;
import com.zzc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录与退出
 * Created by zyz on 2016/11/14.
 */
@Controller
@RequestMapping("/system")
public class SystemController {

    @Autowired
    private UserService us;

    /**
     * @return
     */
    @RequestMapping( value = "/login", method = RequestMethod.POST)
    public String login(Model model,String username, String password, HttpServletRequest request) {
        User users = us.login(username);
        if (users == null) {//账号错误
            model.addAttribute("message","您输入的用户不存在");
            return "login";
        }
        if (!users.getPassword().equals(password)) {//密码错误
            model.addAttribute("message","您输入的密码错误");
            return "login";
        }
        //登录成功
        HttpSession session = request.getSession();
        session.setAttribute("user", users);
        model.addAttribute("message","登陆成功");
        if (users.getFkroleid() == 1){
            return "background/index";
        }else {
            return "foreground/index";
        }
    }

    @RequestMapping(value = "/customerLogin")
    public String customerLogin() {
        return "foreground/index";
    }

    @RequestMapping(value = "/myInfo", produces = {"application/json;charset=UTF-8"})
    public String myInfo(Model model, HttpServletRequest request) {
        User user = us.selectUserById(((User)request.getSession().getAttribute("user")).getUserid());
        model.addAttribute("user", user);
        model.addAttribute("role",us.listAllRole());
        return "foreground/user/myinfo";
    }

    @RequestMapping(value = "/editPwd")
    public String editPwd(User users,Model model) {
        Integer result = us.updateUserByIdSelective(users);
        if (result > 0) {
            model.addAttribute("message","操作成功！");
            model.addAttribute("user",users);
            return "foreground/user/changepwd";
        } else {
            model.addAttribute("message","操作失败！");
            return "message";
        }
    }

    @RequestMapping(value = "/editMine")
    public String editMine(User users,Model model, HttpServletRequest request) {
        Integer result = us.updateUserByIdSelective(users);
        if (result > 0) {
            model.addAttribute("message","操作成功！");
            model.addAttribute("user",users);
            return pwd(model, request);
        } else {
            model.addAttribute("message","操作失败！");
            return "message";
        }
    }

    @RequestMapping(value = "/reg")
    public String reg(User users,Model model) {
        User u = new User();
        u.setUsername(users.getUsername());
        PageInfo<User> p = us.selectUserByExample(1,u);
        if (p.getSize() != 0){
            model.addAttribute("user",users);
            model.addAttribute("message","用户名" + users.getUsername() + "已被注册!");
            return "register";
        }
        users.setFkroleid(2);
        Integer result = us.insertUser(users);
        if (result > 0) {
            model.addAttribute("message","注册成功！");
            return "login";
        } else {
            model.addAttribute("message","操作失败！");
            return "login";
        }
    }

    @RequestMapping(value = "/pwd")
    public String pwd(Model model, HttpServletRequest request) {
        User user = us.selectUserById(((User)request.getSession().getAttribute("user")).getUserid());
        model.addAttribute("user",user);
        return "foreground/user/changepwd";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "login";
    }

    @RequestMapping(value = "/toMine")
    public String toMine(HttpServletRequest request) {
        if (request.getSession().getAttribute("user") == null){
            return "login";
        }else {
            return "foreground/user/user-bottom";
        }
    }
}
