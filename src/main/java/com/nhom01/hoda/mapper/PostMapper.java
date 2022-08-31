package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.PostModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PostMapper implements RowMapper<PostModel>{

    @Override
    public PostModel mapRow(ResultSet resultSet) {
        try {
            PostModel post = new PostModel();

            post.setId(resultSet.getLong("id"));
            post.setContent(resultSet.getString("content"));
            post.setImage(resultSet.getString("image"));
            post.setUserid(resultSet.getLong("userid"));
            post.setCategoryid(resultSet.getLong("categoryid"));
            
            return post;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
