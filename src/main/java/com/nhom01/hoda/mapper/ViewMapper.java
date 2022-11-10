/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.AnnounmentModel;
import com.nhom01.hoda.model.ViewModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */

public class ViewMapper implements RowMapper<ViewModel>{

    @Override
    public ViewModel mapRow(ResultSet resultSet) {
        try {
            ViewModel model = new ViewModel();

            model.setId(resultSet.getLong("id"));
            model.setTotal(resultSet.getInt("total"));

            
            return model;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
