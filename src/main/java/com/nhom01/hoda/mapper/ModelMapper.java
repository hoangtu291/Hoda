package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.CommentModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ModelMapper {
    @Override
    public CommentModel mapRow(ResultSet resultSet) {
        try {
            CommentModel comment = new CommentModel();

            comment.setId(resultSet.getLong("id"));
            comment.setContent(resultSet.getString("content"));
            comment.setCreatedtime(resultSet.getDate("createdtime"));
            comment.setModifiedtime(resultSet.getDate("modifiedtime"));
            comment.setInteractid(resultSet.getLong("interactid"));
            
            return comment;
        } catch (SQLException e) {
            return null;
        }
    }
}
