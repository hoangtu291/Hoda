package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ICommentDao;
import com.nhom01.hoda.dao.IInteractDao;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.service.ICommentService;
import java.sql.Timestamp;
import javax.inject.Inject;

public class CommentService implements ICommentService{
        
    @Inject
    ICommentDao commentDao;

    @Inject
    IInteractDao interactDao;
    
    
    @Override
    public Long save(CommentModel commentModel) {
        
        Long cid;
        commentModel.setInteractId(interactDao.save(commentModel.getInteractModel()));
        
        commentModel.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        commentModel.setModifiedTime(new Timestamp(System.currentTimeMillis()));
        cid = commentDao.save(commentModel);
      
        return cid;
    }
}
