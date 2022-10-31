/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IFollowUserDao;
import com.nhom01.hoda.mapper.FollowUserMapper;
import com.nhom01.hoda.model.FollowUserModel;
import java.util.List;

public class FollowUserDao extends AbstractDao implements IFollowUserDao {

    @Override
    public long insert(long following, long follower) {
        String sql = "INSERT INTO follow_user(following, follower) VALUES(?, ?)";
        return insert(sql, following, follower);
    }

    @Override
    public FollowUserModel getFollowUser(long following, long follower) {
        String sql = "SELECT follow_user.id, following, follower, user.id as uid, profile.fullname,"
                + " profile.avatarimg FROM follow_user "
                + "INNER JOIN user ON following = user.id "
                + "INNER JOIN profile ON user.profileid=profile.id WHERE following=? AND follower=?";
        List<FollowUserModel> followUserModels = query(sql, new FollowUserMapper(), following, follower);
        return followUserModels.size() > 0 ? followUserModels.get(0) : null;
    }

    @Override
    public void delete(long followUserId) {
        String sql = "DELETE FROM follow_user WHERE id=?";
        update(sql, followUserId);
    }

    @Override
    public List<FollowUserModel> getAllFollowerOfUser(long id) {
        String sql="SELECT follow_user.id, following, follower, user.id as uid, profile.fullname,"
                + " profile.avatarimg FROM follow_user "
                + "INNER JOIN user ON following = user.id "
                + "INNER JOIN profile ON user.profileid=profile.id WHERE follower=? ORDER BY fullname DESC";
        return query(sql, new FollowUserMapper(), id);
        
    }

    @Override
    public List<FollowUserModel> getAllFollowUser() {
        String sql ="SELECT follow_user.id, following, follower, user.id as uid, profile.fullname,"
                + " profile.avatarimg FROM follow_user "
                + "INNER JOIN user ON following = user.id "
                + "INNER JOIN profile ON user.profileid=profile.id ORDER BY fullname DESC";
        
        return query(sql, new FollowUserMapper());
    }

    @Override
    public List<FollowUserModel> getAllFollowingOfUser(long id) {
        String sql="SELECT follow_user.id, following, follower, user.id as uid, profile.fullname,"
                + " profile.avatarimg FROM follow_user "
                + "INNER JOIN user ON follower = user.id "
                + "INNER JOIN profile ON user.profileid=profile.id WHERE following=? ORDER BY fullname DESC";
        return query(sql, new FollowUserMapper(), id);
    }

}
