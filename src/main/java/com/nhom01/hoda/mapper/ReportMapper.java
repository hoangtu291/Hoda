/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.ReportModel;
import com.nhom01.hoda.model.ReportTypeModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */

public class ReportMapper implements RowMapper<ReportModel>{

    @Override
    public ReportModel mapRow(ResultSet resultSet) {
        try {
            ReportModel model = new ReportModel();

            model.setId(resultSet.getLong("repid"));
            model.setCreatedtime(resultSet.getTimestamp("repcreatedtime"));
            model.setPostId(resultSet.getLong("reppid"));
            model.setReportTypeId(resultSet.getLong("report_typeid"));
            model.setUserId(resultSet.getLong("repuid"));
            
            model.getReportTypeModel().setId(resultSet.getLong("report_typeid"));
            model.getReportTypeModel().setContent(resultSet.getString("reptypecontent"));
            model.getReportTypeModel().setContentEng(resultSet.getString("reptypecontentEng"));
            
            return model;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
