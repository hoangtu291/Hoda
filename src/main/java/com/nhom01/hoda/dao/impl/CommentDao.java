package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.ICommentDao;
import com.nhom01.hoda.model.CommentModel;

public class CommentDao extends AbstractDao implements ICommentDao{
    
    @Override
    public Long save(CommentModel commentModel) {
        String sql = "INSERT INTO comment(content, createdtime, modifiedtime, interactid) VALUES(?, ?, ?, ?);";
        return insert(sql, commentModel.getContent(), commentModel.getCreatedTime(), commentModel.getModifiedTime(), commentModel.getInteractId());
    }
    @Override
    public void update(CommentModel commentModel) {
        String sql = "UPDATE comment "
                    + "SET content = ?, modifiedtime = ?, interactid = ? WHERE id = ?";
        update(sql, commentModel.getContent(), commentModel.getModifiedTime(), commentModel.getInteractId(),commentModel.getId());
    }
    @Override
    public void delete(Long cmtid){
        String sql = "DELETE FROM comment WHERE id=?";
        update(sql, cmtid);
    }

    @Override
    public void deleteAllCommentOfPost(long pid) {
        String sql = "DELETE c FROM comment c INNER JOIN interact  i ON c.interactid = i.id WHERE postid=?";
        update(sql, pid);
    }
}
