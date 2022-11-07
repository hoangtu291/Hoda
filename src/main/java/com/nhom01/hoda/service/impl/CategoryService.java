/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ICategoryDao;
import com.nhom01.hoda.model.CategoryModel;
import com.nhom01.hoda.service.ICategoryService;
import java.util.List;
import javax.inject.Inject;

public class CategoryService implements ICategoryService{

    @Inject
    ICategoryDao categoryDao;
    
    @Override
    public Long save(CategoryModel categoryModel) {
        return categoryDao.save(categoryModel);
    }

    @Override
    public List<CategoryModel> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public CategoryModel getCategoryById(long id) {
        return categoryDao.getCategoryById(id);
    }

    @Override
    public void updateTotalOfCategory(long id, int currentTotal, boolean status) {
        categoryDao.updateTotalOfCategory(id, currentTotal, status);
    }
    
    
    
}
