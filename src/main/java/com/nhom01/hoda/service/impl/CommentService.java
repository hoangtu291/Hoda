package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ICommentDao;
import com.nhom01.hoda.dao.IInteractDao;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.model.InteractModel;
import com.nhom01.hoda.service.ICommentService;
import java.sql.Timestamp;
import javax.inject.Inject;

public class CommentService implements ICommentService{
        
    @Inject
    ICommentDao commentDao;

    @Inject
    IInteractDao interactDao;
    
    
    @Override
    public Long save(InteractModel interactModel) {
        
        Long cid;
//        commentModel.setInteractId(interactDao.save(commentModel.getInteractModel()));   
//        
//        
        interactModel.getCommentModel().setCreatedTime(new Timestamp(System.currentTimeMillis()));
        interactModel.getCommentModel().setModifiedTime(new Timestamp(System.currentTimeMillis()));
        interactModel.setId(interactDao.save(interactModel));
        interactModel.getCommentModel().setInteractId(interactModel.getId());
        cid = commentDao.save(interactModel.getCommentModel());
        return cid;
    }
//    @Override
//    public CommentModel findUserById(Long id) {
//        return commentDao.findUserById(id);
//    }
    @Override
    public void update(InteractModel interactModel) {
        interactModel.getCommentModel().setModifiedTime(new Timestamp(System.currentTimeMillis()));
        interactModel.setId(interactDao.save(interactModel));
        interactModel.getCommentModel().setInteractId(interactModel.getId());
        commentDao.update(interactModel.getCommentModel());
    }
}
