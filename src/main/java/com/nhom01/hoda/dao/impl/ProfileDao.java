package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IProfileDao;
import com.nhom01.hoda.model.ProfileModel;

public class ProfileDao extends AbstractDao<ProfileModel>implements IProfileDao{

    @Override
    public long save(ProfileModel profileModel) {
        String sql = "INSERT INTO profile(firstname, lastname, fullname, email, birth, address, avatarimg, coverimg) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        return insert(sql, profileModel.getFirstName(), profileModel.getLastName(), 
                            profileModel.getFullName(), profileModel.getEmail(), profileModel.getDateOfBirth(),
                            profileModel.getAddress(), profileModel.getAvatar(), "/upload/images/cover_default.png");
        
    }
    
}
