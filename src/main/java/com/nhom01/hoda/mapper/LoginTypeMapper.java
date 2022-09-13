package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.LoginTypeModel;
import com.nhom01.hoda.model.PostModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginTypeMapper implements RowMapper<LoginTypeModel>{

    @Override
    public LoginTypeModel mapRow(ResultSet resultSet) {
        try {
            LoginTypeModel model = new LoginTypeModel();
            
            model.setId(resultSet.getLong("id"));
            model.setName(resultSet.getString("name"));
            
            return model;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
