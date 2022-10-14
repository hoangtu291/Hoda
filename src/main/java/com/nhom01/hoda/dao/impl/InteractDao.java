package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IInteractDao;
import com.nhom01.hoda.model.InteractModel;

public class InteractDao extends AbstractDao<InteractModel> implements IInteractDao{
    @Override
    public long save(InteractModel interactModel) {
        String sql = "INSERT INTO interact(postid, userid) VALUES(?, ?)";
        return insert(sql, interactModel.getPostId(), interactModel.getUserId());
    }
}
