/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IFollowUserDao;
import com.nhom01.hoda.model.FollowUserModel;
import com.nhom01.hoda.service.IFollowUserService;
import java.util.List;
import javax.inject.Inject;


public class FollowUserService implements IFollowUserService{
    
    @Inject
    IFollowUserDao followUserDao;

    @Override
    public long insert(long following, long follower) {
        return followUserDao.insert(following, follower);
    }

    @Override
    public FollowUserModel getFollowUser(long following, long follower) {
        return followUserDao.getFollowUser(following, follower);
    }

    @Override
    public void delete(long followUserId) {
        followUserDao.delete(followUserId);
    }

    @Override
    public List<FollowUserModel> getAllFollowerOfUser(long id) {
        return followUserDao.getAllFollowerOfUser(id);
    }

    @Override
    public List<FollowUserModel> getAllFollowUser() {
        return followUserDao.getAllFollowUser();
    }

    @Override
    public List<FollowUserModel> getAllFollowingOfUser(long id) {
        return followUserDao.getAllFollowingOfUser(id);
    }
}
