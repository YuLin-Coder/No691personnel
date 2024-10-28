package com.zzc.controller;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Dept;
import com.zzc.model.Post;
import com.zzc.model.User;
import com.zzc.service.DeptService;
import com.zzc.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Simpson on 2017/2/20.
 */
@Controller
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;
    @Autowired
    private PostService postService;

    @RequestMapping("/list")
    public String list(Model model, Dept dept, Integer pageNum) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Dept> info = deptService.selectDeptByExample(pageNum, dept);
        model.addAttribute("info", info);
        model.addAttribute("dept", dept);
        return "background/dept/deptlist";
    }

    @RequestMapping("/{fkdeptid}/list")
    public String list(Model model, Dept dept, Integer pageNum, @PathVariable("fkdeptid") Integer fkdeptid) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Post> post = postService.list(1, new Post(fkdeptid));
        PageInfo<Dept> info = deptService.selectDeptByExample(pageNum, dept);
        model.addAttribute("post", post);
        model.addAttribute("info", info);
        model.addAttribute("dept", dept);
        model.addAttribute("fkdeptid", fkdeptid);
        return "background/dept/deptlist";
    }

    @RequestMapping("/listFore")
    public String listFore(Model model, Dept dept, Integer pageNum, HttpServletRequest request) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Dept> info = deptService.selectDeptByExample(pageNum, dept);
        model.addAttribute("info", info);
        model.addAttribute("dept", dept);
        return "foreground/dept/deptlist";
    }

    @RequestMapping("/add")
    public String add() {
        return "background/dept/deptadd";
    }

    @RequestMapping(value = "/edit")
    public String editDepts(Dept depts,Model model) {
        int result = -1;
        if (depts.getDeptid() != null && depts.getDeptid() > 0) {
            //修改
            result = deptService.updateDeptById(depts);
        } else {
            //添加
            result = deptService.insertDept(depts);
        }
        if (result > 0) {
            model.addAttribute("message","操作成功！");
            return "message";
        } else {
            model.addAttribute("message","操作失败！");
            return "message";
        }
    }

    @RequestMapping(value = "/{deptid}/detail", produces = {"application/json;charset=UTF-8"})
    public String detail(Model model, @PathVariable("deptid") Integer deptid) {
        Dept dept = null;
        try {
            if (deptid != null) {
                dept = deptService.selectDeptById(deptid);
                model.addAttribute("dept", dept);
                return "background/dept/deptupdate";
            }
        } catch (Exception e) {
            model.addAttribute("message", "查找失败");
            return "message";
        }
        return null;
    }

    @RequestMapping(value = "/{deptid}/delete", produces = {"application/json;charset=UTF-8"})
    public String delete(Model model,@PathVariable("deptid") Integer deptid) {
        int result = -1;
        if (deptid != null) {
            if (postService.selectPostByExample(1,new Post(deptid)).getSize() != 0){
                model.addAttribute("message", "该部门下有岗位信息，不能删除！");
                return list(model,new Dept(),1);
            }
            result = deptService.deleteDeptById(deptid);
        }
        if (result > 0) {
            return list(model,new Dept(),1);
        }
        return null;
    }
}
