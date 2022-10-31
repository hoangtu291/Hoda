/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.FollowUserModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */

public class FollowUserMapper implements RowMapper<FollowUserModel>{

    @Override
    public FollowUserModel mapRow(ResultSet resultSet) {
        try {
            FollowUserModel model = new FollowUserModel();

            model.setId(resultSet.getLong("id"));
            model.setFollowing(resultSet.getLong("following"));
            model.setFollower(resultSet.getLong("follower"));
            
            model.getUserModel().setId(resultSet.getLong("uid"));
            model.getUserModel().getProfileModel().setFullName(resultSet.getString("fullname"));
            model.getUserModel().getProfileModel().setAvatar(resultSet.getString("avatarimg"));
            
            return model;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
