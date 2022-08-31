package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IPostDao;
import com.nhom01.hoda.model.PostModel;

public class PostDao extends AbstractDao implements IPostDao {

    @Override
    public Long save(PostModel postModel) {
        String sql = "INSERT INTO post(content, image, userid, categoryid) VALUES(?, ?, ?, ?);";
        return insert(sql, postModel.getContent(), postModel.getImage(), postModel.getUserid(), postModel.getCategoryid());
    }

}
