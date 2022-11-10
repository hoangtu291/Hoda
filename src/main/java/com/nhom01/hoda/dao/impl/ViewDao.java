/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IViewDao;
import com.nhom01.hoda.mapper.ViewMapper;
import com.nhom01.hoda.model.ViewModel;

/**
 *
 * @author ASUS
 */
public class ViewDao extends AbstractDao<ViewModel> implements IViewDao{

    @Override
    public int getTotalView() {
        String sql = "SELECT * FROM view";
        return query(sql, new ViewMapper()).get(0).getTotal();
    }

    @Override
    public void updateView() {
        String sql = "UPDATE view SET total = total+1";
        update(sql);
    }
    
}
