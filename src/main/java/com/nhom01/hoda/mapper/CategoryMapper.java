package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.CategoryModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements RowMapper<CategoryModel>{

    @Override
    public CategoryModel mapRow(ResultSet resultSet) {
        try {
            CategoryModel category = new CategoryModel();

            category.setId(resultSet.getLong("id"));
            category.setCode(resultSet.getString("code"));
            category.setName(resultSet.getString("name"));
            category.setNameEng(resultSet.getString("nameEng"));
            category.setTotal(resultSet.getInt("total"));
            
            return category;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
