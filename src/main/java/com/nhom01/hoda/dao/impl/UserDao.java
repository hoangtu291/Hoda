package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IUserDao;
import com.nhom01.hoda.mapper.UserMapper;
import com.nhom01.hoda.model.UserModel;
import java.util.List;

public class UserDao extends AbstractDao<UserModel> implements IUserDao {

    @Override
    public long save(UserModel userModel) {
        String sql = "INSERT INTO user(socialid, type_accountid, profileid, createdtime, modifiedtime) VALUES(?, ?, ?, ?, ?)";
        return insert(sql, userModel.getSocialId(), userModel.getLoginTypeId(), userModel.getProfileId(),
                userModel.getCreatedTime(), userModel.getModifiedTime());

    }

    @Override
    public List<UserModel> getAll() {
        StringBuilder sql = new StringBuilder("SELECT user.id as uid, profile.id as pfid, login_type.id as lgid,");
        sql.append("socialid, createdtime, modifiedtime, fullname, email, avatarimg, login_type.name as lgname");
        sql.append(" FROM user INNER JOIN profile ON user.profileid=profile.id");
        sql.append(" INNER JOIN login_type ON user.type_accountid = login_type.id");
        return query(sql.toString(), new UserMapper());
    }

}
