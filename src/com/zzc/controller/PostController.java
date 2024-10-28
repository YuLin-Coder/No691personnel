package com.zzc.controller;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Dept;
import com.zzc.model.Post;
import com.zzc.model.User;
import com.zzc.service.DeptService;
import com.zzc.service.PostService;
import com.zzc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Simpson on 2017/2/20.
 */
@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;

    @RequestMapping("/list")
    public String list(Model model, Post post, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Post> info = postService.list(pageNum, post);
        model.addAttribute("info", info);
        model.addAttribute("post", post);
        return "background/post/postlist";
    }

    @RequestMapping("/{fkpostid}/list")
    public String list(Model model, Post post, Integer pageNum, @PathVariable("fkpostid") Integer fkpostid) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<User> user = userService.list(1, new User(fkpostid));
        PageInfo<Post> info = postService.list(pageNum, post);
        model.addAttribute("users", user);
        model.addAttribute("info", info);
        model.addAttribute("post", post);
        model.addAttribute("fkpostid", fkpostid);
        return "background/post/postlist";
    }

    @RequestMapping("/listFore")
    public String listFore(Model model, Post post, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Post> info = postService.list(pageNum, post);
        model.addAttribute("info", info);
        model.addAttribute("post", post);
        return "foreground/post/postlist";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("dept",userService.listAllDept());
        return "background/post/postadd";
    }

    @RequestMapping(value = "/edit")
    public String editPosts(Post posts,Model model) {
        int result = -1;
        if (posts.getPostid() != null && posts.getPostid() > 0) {
            //修改
            result = postService.updatePostById(posts);
        } else {
            //添加
            result = postService.insertPost(posts);
        }
        if (result > 0) {
            model.addAttribute("message","操作成功！");
            return "message";
        } else {
            model.addAttribute("message","操作失败！");
            return "message";
        }
    }

    @RequestMapping(value = "/{postid}/detail", produces = {"application/json;charset=UTF-8"})
    public String detail(Model model, @PathVariable("postid") Integer postid) {
        Post post = null;
        try {
            if (postid != null) {
                post = postService.selectPostById(postid);
                model.addAttribute("post", post);
                model.addAttribute("dept",userService.listAllDept());
                return "background/post/postupdate";
            }
        } catch (Exception e) {
            model.addAttribute("message", "查找失败");
            return "message";
        }
        return null;
    }

    @RequestMapping(value = "/{postid}/delete", produces = {"application/json;charset=UTF-8"})
    public String delete(Model model,@PathVariable("postid") Integer postid) {
        int result = -1;
        if (postid != null) {
            if (userService.selectUserByExample(1,new User(postid)).getSize() != 0){
                model.addAttribute("message", "该岗位下有员工信息，不能删除！");
                return list(model,new Post(),1);
            }
            result = postService.deletePostById(postid);
        }
        if (result > 0) {
            return list(model,new Post(),1);
        }
        return null;
    }
}
