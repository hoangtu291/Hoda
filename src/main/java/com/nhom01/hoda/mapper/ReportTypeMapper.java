/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.ImageModel;
import com.nhom01.hoda.model.ReportTypeModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */

public class ReportTypeMapper implements RowMapper<ReportTypeModel>{

    @Override
    public ReportTypeModel mapRow(ResultSet resultSet) {
        try {
            ReportTypeModel model = new ReportTypeModel();

            model.setId(resultSet.getLong("id"));
            model.setContent(resultSet.getString("content"));
            model.setContentEng(resultSet.getString("contentEng"));
            
            return model;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
