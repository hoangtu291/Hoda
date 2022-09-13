package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.ILoginTypeDao;
import com.nhom01.hoda.mapper.LoginTypeMapper;
import com.nhom01.hoda.model.LoginTypeModel;

public class LoginTypeDao extends AbstractDao<LoginTypeModel>implements ILoginTypeDao{

    @Override
    public LoginTypeModel findTypeLoginByName(String name) {
        String sql = "SELECT * FROM login_type WHERE name = ?";
        return query(sql,new LoginTypeMapper(), name).get(0);
    }
}
