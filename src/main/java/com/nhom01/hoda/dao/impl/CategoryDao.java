/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.ICategoryDao;
import com.nhom01.hoda.model.CategoryModel;

/**
 *
 * @author ASUS
 */
public class CategoryDao extends AbstractDao implements ICategoryDao{
    
    @Override
    public Long save(CategoryModel categoryModel) {
        String sql = "INSERT INTO category(code,name) VALUES(?, ?);";
        return insert(sql, categoryModel.getCode(),categoryModel.getName());
    }
    
}
