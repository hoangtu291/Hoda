package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ILoginTypeDao;
import com.nhom01.hoda.dao.IProfileDao;
import com.nhom01.hoda.dao.IUserDao;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IUserService;
import java.sql.Timestamp;
import java.util.List;
import javax.inject.Inject;

public class UserService implements IUserService{
    
    @Inject
    IUserDao userDao;
    
    @Inject
    IProfileDao profileDao;
    
    @Inject
    ILoginTypeDao loginTypeDao;

    @Override
    public Long save(UserModel userModel) {
        userModel.setProfileId(profileDao.save(userModel.getProfileModel()));
        userModel.setLoginTypeId(loginTypeDao.findTypeLoginByName(userModel.getLoginTypeModel().getName()).getId());
        
        userModel.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        userModel.setModifiedTime(new Timestamp(System.currentTimeMillis()));
        return userDao.save(userModel);
    }

    @Override
    public List<UserModel> getAll() {
        return userDao.getAll();
    }

    @Override
    public UserModel findUserBySocialIdAndType(String social, String type) {
        return userDao.findUserBySocialIdAndType(social, type);
    }

    @Override
    public UserModel findUserById(Long id) {
        return userDao.findUserById(id);
    }
    
}
