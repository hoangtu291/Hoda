package com.nhom01.hoda.service;

import com.nhom01.hoda.model.InteractModel;

public interface ICommentService {
    Long save(InteractModel interactModel);
    void update(InteractModel interactModel);
    void delete(Long cmtid,Long interactid);
}
