/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IReportTypeDao;
import com.nhom01.hoda.model.ReportTypeModel;
import com.nhom01.hoda.service.IReportTypeService;
import java.util.List;
import javax.inject.Inject;

public class ReportTypeService implements IReportTypeService{

    @Inject
    IReportTypeDao reportTypeDao;
    
    @Override
    public List<ReportTypeModel> getAll() {
        return reportTypeDao.getAll();
    }
    
    
    
}
