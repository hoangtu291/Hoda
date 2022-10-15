
package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.InteractModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InteractMapper implements RowMapper<InteractModel>{

    @Override
    public InteractModel mapRow(ResultSet resultSet) {
        try {
            InteractModel interactModel = new InteractModel();

            interactModel.setId(resultSet.getLong("interactid"));
            interactModel.setPostId(resultSet.getLong("postid"));
            interactModel.setUserId(resultSet.getLong("userid"));
            interactModel.getCommentModel().setId(resultSet.getLong("cmtid"));
            interactModel.getCommentModel().setContent(resultSet.getString("cmtcontent"));
            interactModel.getCommentModel().setCreatedTime(resultSet.getTimestamp("cmtcreatedtime"));
            interactModel.getCommentModel().setModifiedTime(resultSet.getTimestamp("cmtmodifiedtime"));
            
            return interactModel;
        } catch (SQLException e) {
            return null;
        }
    }
    
}