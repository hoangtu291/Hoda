package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.PostModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PostMapper implements RowMapper<PostModel> {

    @Override
    public PostModel mapRow(ResultSet resultSet) {
        try {
            PostModel post = new PostModel();

            post.setId(resultSet.getLong("pid"));
            post.setTitle(resultSet.getString("title"));
            post.setContent(resultSet.getString("content"));
            post.setUserid(resultSet.getLong("uid"));
            post.setCategoryid(resultSet.getLong("cid"));
            post.setCreatedTime(resultSet.getTimestamp("createdtime"));
            post.setModifiedTime(resultSet.getTimestamp("modifiedtime"));

            post.getCategoryModel().setCode(resultSet.getString("ccode"));
            post.getCategoryModel().setName(resultSet.getString("cname"));
            post.getCategoryModel().setNameEng(resultSet.getString("cnameEng"));

            post.getUserModel().getProfileModel().setFullName(resultSet.getString("fullname"));
            post.getUserModel().getProfileModel().setEmail(resultSet.getString("email"));
            post.getUserModel().getProfileModel().setAvatar(resultSet.getString("avatarimg"));

            return post;
        } catch (SQLException e) {
            return null;
        }
    }

}
