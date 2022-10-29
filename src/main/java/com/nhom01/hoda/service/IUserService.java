package com.nhom01.hoda.service;

import com.nhom01.hoda.model.UserModel;
import java.util.List;

public interface IUserService {
    Long save(UserModel userModel);
    void update(UserModel userModel);
    
    List<UserModel> getAll();
    UserModel findUserBySocialIdAndType(String social, String type);
    UserModel findUserById(Long id);
}
