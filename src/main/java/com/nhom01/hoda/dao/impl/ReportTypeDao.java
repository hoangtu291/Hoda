/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IReportTypeDao;
import com.nhom01.hoda.mapper.ReportTypeMapper;
import com.nhom01.hoda.model.ReportTypeModel;
import java.util.List;

public class ReportTypeDao extends AbstractDao implements IReportTypeDao{
    

    @Override
    public List<ReportTypeModel> getAll() {
        String sql = "SELECT * FROM report_type";
        return query(sql, new ReportTypeMapper());
    }
    
}
