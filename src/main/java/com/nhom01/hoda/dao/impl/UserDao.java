package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IUserDao;
import com.nhom01.hoda.model.UserModel;

public class UserDao extends AbstractDao<UserModel>implements IUserDao{

    @Override
    public long save(UserModel userModel) {
        String sql = "INSERT INTO user(socialid, type_accountid, profileid, createdtime, modifiedtime) VALUES(?, ?, ?, ?, ?)";
        return insert(sql, userModel.getSocialId(), userModel.getLoginTypeId(), userModel.getProfileId(),
                            userModel.getCreatedTime(), userModel.getModifiedTime());
        
    }
    
}
