/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.ICategoryDao;
import com.nhom01.hoda.mapper.CategoryMapper;
import com.nhom01.hoda.model.CategoryModel;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class CategoryDao extends AbstractDao implements ICategoryDao {

    @Override
    public Long save(CategoryModel categoryModel) {
        String sql = "INSERT INTO category(code,name) VALUES(?, ?);";
        return insert(sql, categoryModel.getCode(), categoryModel.getName());
    }

    @Override
    public List<CategoryModel> getAll() {
        String sql = "SELECT * FROM category";
        return query(sql, new CategoryMapper());
    }

    @Override
    public CategoryModel getCategoryById(long id) {
        String sql = "SELECT * FROM category WHERE id = ?";
        List<CategoryModel> categoryModels = query(sql, new CategoryMapper(), id);
        return categoryModels.size() > 0 ? categoryModels.get(0) : null;
    }

    @Override
    public void updateTotalOfCategory(long id, int currentTotal, boolean status) {
        String sql = "UPDATE category SET total = ? WHERE id = ?";
        update(sql, status ? currentTotal + 1 : currentTotal - 1, id);
    }

}
