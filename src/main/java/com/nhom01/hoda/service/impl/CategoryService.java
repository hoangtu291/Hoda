/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.ICategoryDao;
import com.nhom01.hoda.dao.impl.CategoryDao;
import com.nhom01.hoda.model.CategoryModel;
import com.nhom01.hoda.service.ICategoryService;
import javax.inject.Inject;

/**
 *
 * @author ASUS
 */
public class CategoryService implements ICategoryService{

    @Inject
    ICategoryDao category;
    
    @Override
    public Long save(CategoryModel categoryModel) {
        return category.save(categoryModel);
    }
    
}
