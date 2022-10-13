package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ICommentDao;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.service.ICommentService;
import javax.inject.Inject;

public class CommentService implements ICommentService{
        
    @Inject
    ICommentDao commentDao;

    @Override
    public Long save(CommentModel commentModel) {
        return commentDao.save(commentModel);
    }
}
