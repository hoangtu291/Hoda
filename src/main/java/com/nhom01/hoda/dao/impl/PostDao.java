package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IPostDao;
import com.nhom01.hoda.mapper.PostMapper;
import com.nhom01.hoda.model.PostModel;
import java.util.List;

public class PostDao extends AbstractDao implements IPostDao {

    @Override
    public Long save(PostModel postModel) {
        String sql = "INSERT INTO post(title, content, userid, categoryid, createdtime, modifiedtime) VALUES(?, ?, ?, ?, ?, ?);";
        return insert(sql, postModel.getTitle(), postModel.getContent(), postModel.getUserid(), postModel.getCategoryid(), 
                postModel.getCreatedTime(), postModel.getModifiedTime());
    }

    @Override
    public List<PostModel> getAllPost() {
        String sql = "SELECT user.id as uid, profile.id as pfid, socialid, fullname, email, avatarimg," +
                " post.id as pid, post.title, post.content, post.createdtime, post.modifiedtime, category.id as cid,"
                + "category.code as ccode, category.name as cname FROM post INNER JOIN category ON post.categoryid = category.id "
                + "INNER JOIN user ON post.userid = user.id INNER JOIN profile ON user.profileid=profile.id "
                + "ORDER BY createdtime DESC;";
        return query(sql, new PostMapper());
    }

    @Override
    public void update(PostModel postModel) {
        String sql= "UPDATE post SET title=?, content=?, categoryid=?, modifiedtime=?"
                + " WHERE id=?";
        update(sql, postModel.getTitle(), postModel.getContent(), postModel.getCategoryid(),
                postModel.getModifiedTime(), postModel.getId());
    }

}
