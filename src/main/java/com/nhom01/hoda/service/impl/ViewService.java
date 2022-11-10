/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IViewDao;
import com.nhom01.hoda.service.IViewService;
import javax.inject.Inject;



public class ViewService implements IViewService{
    
    @Inject
    IViewDao viewDao;

    @Override
    public int getTotalView() {
        return viewDao.getTotalView();
    }

    @Override
    public void updateView() {
        viewDao.updateView();
    }
    
    
}
