package com.zzc.controller;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Salary;
import com.zzc.model.User;
import com.zzc.service.SalaryService;
import com.zzc.service.UserService;
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
@RequestMapping("/salary")
public class SalaryController {
    @Autowired
    private SalaryService salaryService;

    @RequestMapping("/list")
    public String list(Model model, Salary salary, Integer pageNum ) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Salary> info = salaryService.list(pageNum, salary);
        model.addAttribute("info", info);
        model.addAttribute("user", salaryService.listAllUser());
        model.addAttribute("salary", salary);
        return "background/salary/salarylist";
    }

    @RequestMapping("/listExcel")
    public String listExcel(Model model, Salary salary, Integer pageNum ) {
        if (pageNum == null){
            pageNum = 1;
        }
        PageInfo<Salary> info = salaryService.list(pageNum, salary);
        model.addAttribute("info", info);
        model.addAttribute("user", salaryService.listAllUser());
        model.addAttribute("salary", salary);
        return "background/salary/salaryprint";
    }

    @RequestMapping("/listFore")
    public String listFore(Model model, Salary salary, Integer pageNum, HttpServletRequest request) {
        if (pageNum == null){
            pageNum = 1;
        }
        Integer userid = ((User)request.getSession().getAttribute("user")).getUserid();
        salary.setFkuserid(userid);
        PageInfo<Salary> info = salaryService.list(pageNum, salary);
        model.addAttribute("info", info);
        model.addAttribute("user", salaryService.listAllUser());
        model.addAttribute("salary", salary);
        return "foreground/salary/salarylist";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("user",salaryService.listAllUser());
        return "background/salary/salaryadd";
    }

    @RequestMapping(value = "/edit")
    public String editSalarys(Salary salarys,Model model) {
        int result = -1;
        if (salarys.getSalaryid() != null && salarys.getSalaryid() > 0) {
            //修改
            result = salaryService.updateSalaryByIdSelective(salarys);
        } else {
            //添加
            salarys.setSalarydate(new Date());
            result = salaryService.insertSalarySelective(salarys);
        }
        if (result > 0) {
            model.addAttribute("message","操作成功！");
            return "message";
        } else {
            model.addAttribute("message","操作失败！");
            return "message";
        }
    }

    @RequestMapping(value = "/{salaryid}/detail", produces = {"application/json;charset=UTF-8"})
    public String detail(Model model, @PathVariable("salaryid") Integer salaryid) {
        Salary salary = null;
        try {
            if (salaryid != null) {
                salary = salaryService.selectSalaryById(salaryid);
                model.addAttribute("salary", salary);
                model.addAttribute("user",salaryService.listAllUser());
                return "background/salary/salaryupdate";
            }
        } catch (Exception e) {
            model.addAttribute("message", "查找失败");
            return "message";
        }
        return null;
    }

    @RequestMapping(value = "/{salaryid}/delete", produces = {"application/json;charset=UTF-8"})
    public String delete(Model model,@PathVariable("salaryid") Integer salaryid) {
        int result = -1;
        if (salaryid != null) {
            result = salaryService.deleteSalaryById(salaryid);
        }
        if (result > 0) {
            return list(model,new Salary(),1);
        }
        return null;
    }


}
