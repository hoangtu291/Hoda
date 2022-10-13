package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.UserModel;
import java.util.List;

public interface IUserDao {
    long save(UserModel UserModel);
    List<UserModel> getAll();
    
    UserModel findUserBySocialIdAndType(String socialid, String type);
}
