
package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.CommentModel;

public interface ICommentDao {
    Long save(CommentModel commentModel);
    void update(CommentModel commentModel);
}
