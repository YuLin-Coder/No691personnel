package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Dept;
import com.zzc.model.Post;

/**
 * Created by zyz on 2016/11/9.
 */
public interface PostService {

    int insertPost(Post post);
    int insertPostSelective(Post post);
    int updatePostById(Post post);
    int updatePostByIdSelective(Post post);
    int deletePostById(Integer postid);
    Post selectPostById(Integer postid);
    PageInfo<Post> selectPostByExample(Integer pageNum, Post post);
    PageInfo<Post> list(Integer pageNum, Post post);

    PageInfo<Dept> listAllDept();

}
