package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.DeptMapper;
import com.zzc.dao.PostMapper;
import com.zzc.model.*;
import com.zzc.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private DeptMapper deptMapper;

    @Transactional(readOnly = false)
    public int deletePostById(Integer postid) {
        return postMapper.deleteByPrimaryKey(postid);
    }

    @Transactional(readOnly = false)
    public int insertPost(Post post) {
        return postMapper.insert(post);
    }

    public int insertPostSelective(Post post) {
        return postMapper.insertSelective(post);
    }

    @Transactional(readOnly = false)
    public int updatePostById(Post post) {
        return postMapper.updateByPrimaryKey(post);
    }

    public int updatePostByIdSelective(Post post) {
        return postMapper.updateByPrimaryKeySelective(post);
    }

    @Transactional(readOnly = false)
    public Post selectPostById(Integer postid) {
        return postMapper.selectByPrimaryKey(postid);
    }

    public PageInfo<Post> selectPostByExample(Integer pageNum, Post post) {
        //设定查询条件
        PostExample example = new PostExample();
        example.setOrderByClause("postid");
        PostExample.Criteria criteria = example.createCriteria();
        if (post.getPostname() != null && !"".equals(post.getPostname().trim()))
            criteria.andPostnameLike("%" + post.getPostname() + "%");
        //设置分页条件
        PageHelper.startPage(pageNum, 10);
        List<Post> posts = postMapper.selectByExample(example);
        //返回分页结果
        return new PageInfo<Post>(posts);
    }

    public PageInfo<Post> list(Integer pageNum, Post post) {
        PageHelper.startPage(pageNum, 10);
        List<Post> posts = postMapper.list(post);
        PageInfo<Post> info = new PageInfo<Post>(posts);
        return info;
    }

    public PageInfo<Dept> listAllDept() {
        List<Dept> depts = deptMapper.selectByExample(new DeptExample());
        return new PageInfo<Dept>(depts);
    }

}
