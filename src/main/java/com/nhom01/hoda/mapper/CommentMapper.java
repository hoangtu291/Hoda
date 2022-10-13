package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.CommentModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentMapper implements RowMapper<CommentModel>{
    @Override
    public CommentModel mapRow(ResultSet resultSet) {
        try {
            CommentModel comment = new CommentModel();

            comment.setId(resultSet.getLong("id"));
            comment.setContent(resultSet.getString("content"));
            comment.setCreatedTime(resultSet.getTimestamp("createdtime"));
            comment.setModifiedTime(resultSet.getTimestamp("modifiedtime"));
            comment.setInteractId(resultSet.getLong("interactid"));
            
            return comment;
        } catch (SQLException e) {
            return null;
        }
    }
}
