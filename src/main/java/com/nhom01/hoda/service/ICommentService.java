package com.nhom01.hoda.service;

import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.model.InteractModel;

public interface ICommentService {
    Long save(InteractModel interactModel);
//    CommentModel findUserById(Long id);
    void update(InteractModel interactModel);
}
