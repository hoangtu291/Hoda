package com.nhom01.hoda.service;

import com.nhom01.hoda.model.FollowUserModel;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IFollowUserService {
    List<FollowUserModel> getAllFollowUser();
    FollowUserModel getFollowUser(long following, long follower);
    List<FollowUserModel> getAllFollowerOfUser(long id);
    List<FollowUserModel> getAllFollowingOfUser(long id);
    
    long insert(long following, long follower);
    void delete(long followUserId);
    
}
