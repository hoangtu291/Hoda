package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.ICommentDao;
import com.nhom01.hoda.model.CommentModel;

public class CommentDao extends AbstractDao implements ICommentDao{
    
    @Override
    public Long save(CommentModel commentModel) {
        String sql = "INSERT INTO comment(content, createdtime, modifiedtime, interactid) VALUES(?, ?, ?, ?);";
        return insert(sql, commentModel.getContent(), commentModel.getCreatedTime(), commentModel.getModifiedTime(), commentModel.getInteractId());
    }
}
