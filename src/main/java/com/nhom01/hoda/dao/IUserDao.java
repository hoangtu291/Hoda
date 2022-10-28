package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.UserModel;
import java.util.List;

public interface IUserDao {
    long save(UserModel userModel);
    void update(UserModel userModel);
    
    List<UserModel> getAll();
    UserModel findUserBySocialIdAndType(String socialid, String type);
    UserModel findUserById(Long id);
}
