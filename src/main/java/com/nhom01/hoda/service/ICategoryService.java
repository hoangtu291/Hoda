/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.service;

import com.nhom01.hoda.model.CategoryModel;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface ICategoryService {
    Long save(CategoryModel categoryModel);
    List<CategoryModel> getAll();
}
