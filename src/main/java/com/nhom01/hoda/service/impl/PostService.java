package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ICategoryDao;
import com.nhom01.hoda.dao.ICommentDao;
import com.nhom01.hoda.dao.IFeelDao;
import com.nhom01.hoda.dao.IImageDao;
import com.nhom01.hoda.dao.IPostDao;
import com.nhom01.hoda.dao.IReportDao;
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
    
    @Inject
    IReportDao reportDao;
    
    @Inject
    ICommentDao commentDao;
    
    @Inject
    IFeelDao feelDao;
    
    @Inject
    ICategoryDao categoryDao;

    @Override
    public Long save(PostModel postModel) {
        long pid;
        postModel.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        postModel.setModifiedTime(new Timestamp(System.currentTimeMillis()));
        pid = postDao.save(postModel);
        categoryDao.updateTotalOfCategory(postModel.getCategoryid(), categoryDao.getCategoryById(postModel.getCategoryid()).getTotal(), true);
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

    @Override
    public void update(PostModel postModel) {
        postModel.setModifiedTime(new Timestamp(System.currentTimeMillis()));
        postDao.update(postModel);
        categoryDao.updateTotalOfCategory(postModel.getCategoryid(), categoryDao.getCategoryById(postModel.getCategoryid()).getTotal(), true);
        imageDao.deleteAllImageOfPost(postModel.getId());
        imageDao.saveList(postModel.getImageModels(), postModel.getId());
    }

    @Override
    public void delete(long pid) {
        imageDao.deleteAllImageOfPost(pid);
        commentDao.deleteAllCommentOfPost(pid);
        feelDao.deleteAllFeelOfPost(pid);
        interactDao.deleteAllInteractOfPost(pid);
        reportDao.deleteAllReportOfPost(pid);
        postDao.delete(pid);
    }

    @Override
    public List<PostModel> getAllPostOfUser(long uid) {
        List<PostModel> postModels = postDao.getAllPostOfUser(uid);
        
        for(int i = 0; i< postModels.size(); i++){
            postModels.get(i).setImageModels(imageDao.getAllImagesOfPost(postModels.get(i).getId()));
            postModels.get(i).setInteractModels(interactDao.getAllInteractOfPost(postModels.get(i).getId()));
        }
        return postModels;
    }

    @Override
    public List<PostModel> getAllPostReport() {
        List<PostModel> postModels = postDao.getAllPostReport();
        
        for(int i = 0; i< postModels.size(); i++){
            postModels.get(i).setImageModels(imageDao.getAllImagesOfPost(postModels.get(i).getId()));
            postModels.get(i).setReportModels(reportDao.getReportOfPost(postModels.get(i).getId()));
        }
        return postModels;
    }

    @Override
    public PostModel getPostById(long id) {
        return postDao.getPostById(id);
    }

    @Override
    public List<PostModel> getPostByCateld(long categoryId) {
         List<PostModel> postModels = postDao.getPostByCateld(categoryId);
        
        for(int i = 0; i< postModels.size(); i++){
            postModels.get(i).setImageModels(imageDao.getAllImagesOfPost(postModels.get(i).getId()));
            postModels.get(i).setInteractModels(interactDao.getAllInteractOfPost(postModels.get(i).getId()));
        }
        return postModels;
    }
    
}
