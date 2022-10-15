package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IImageDao;
import com.nhom01.hoda.dao.IPostDao;
import com.nhom01.hoda.dao.impl.InteractDao;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.service.IPostService;
import java.sql.Timestamp;
import java.util.List;
import javax.inject.Inject;

public class PostService implements IPostService{
    
    @Inject
    IPostDao postDao;
    
    @Inject
    IImageDao imageDao;
    
    @Inject
    InteractDao interactDao;

    @Override
    public Long save(PostModel postModel) {
        long pid;
        postModel.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        postModel.setModifiedTime(new Timestamp(System.currentTimeMillis()));
        pid = postDao.save(postModel);
        imageDao.saveList(postModel.getImageModels(), pid);
        return pid;
    }

    @Override
    public List<PostModel> getAllPost() {
        
        List<PostModel> postModels = postDao.getAllPost();
        
        for(int i = 0; i< postModels.size(); i++){
            postModels.get(i).setImageModels(imageDao.getAllImagesOfPost(postModels.get(i).getId()));
            postModels.get(i).setInteractModels(interactDao.getAllInteractOfPost(postModels.get(i).getId()));
        }
        return postModels;
    }
    
}
