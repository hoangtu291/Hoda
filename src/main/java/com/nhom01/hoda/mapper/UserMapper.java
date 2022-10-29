package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<UserModel>{

    @Override
    public UserModel mapRow(ResultSet resultSet) {
        try {
            UserModel model = new UserModel();
            
            model.setId(resultSet.getLong("uid"));
            model.setProfileId(resultSet.getLong("pfid"));
            model.setLoginTypeId(resultSet.getLong("lgid"));
            model.setSocialId(resultSet.getString("socialid"));
            model.setCreatedTime(resultSet.getTimestamp("createdtime"));//uid, pfid, lgid, socialid, createdtime, modifiedtime, fullname, email, avatarimg, lgname
            model.setModifiedTime(resultSet.getTimestamp("modifiedtime"));
            
            model.getProfileModel().setFullName(resultSet.getString("fullname"));
            model.getProfileModel().setEmail(resultSet.getString("email"));
            model.getProfileModel().setAvatar(resultSet.getString("avatarimg"));
            model.getProfileModel().setDateOfBirth(resultSet.getDate("birth"));
            model.getProfileModel().setAddress(resultSet.getString("address"));
            model.getProfileModel().setPhone(resultSet.getString("phone"));
            model.getProfileModel().setStudy(resultSet.getString("study"));
            model.getProfileModel().setWork(resultSet.getString("work"));
            
            model.getLoginTypeModel().setName(resultSet.getString("lgname"));
            
            return model;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
