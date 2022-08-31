package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IPostDao;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.service.IPostService;
import javax.inject.Inject;

public class PostService implements IPostService{
    
    @Inject
    IPostDao postDao;

    @Override
    public Long save(PostModel postModel) {
        return postDao.save(postModel);
    }
    
}
