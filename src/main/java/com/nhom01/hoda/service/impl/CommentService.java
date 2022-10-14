package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ICommentDao;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.service.ICommentService;
import java.sql.Timestamp;
import javax.inject.Inject;

public class CommentService implements ICommentService{
        
    @Inject
    ICommentDao commentDao;

    @Override
    public Long save(CommentModel commentModel) {

        long cid;
        commentModel.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        commentModel.setModifiedTime(new Timestamp(System.currentTimeMillis()));
        cid = commentDao.save(commentModel);
      
        return cid;
    }
}
