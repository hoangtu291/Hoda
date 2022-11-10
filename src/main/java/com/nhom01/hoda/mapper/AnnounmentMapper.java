/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.AnnounmentModel;
import com.nhom01.hoda.model.ImageModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */

public class AnnounmentMapper implements RowMapper<AnnounmentModel>{

    @Override
    public AnnounmentModel mapRow(ResultSet resultSet) {
        try {
            AnnounmentModel model = new AnnounmentModel();

            model.setId(resultSet.getLong("id"));
            model.setMessage(resultSet.getString("message"));
            model.setMessageEng(resultSet.getString("messageEng"));
            model.setStatus(resultSet.getInt("status"));
            model.setCreatedtime(resultSet.getTimestamp("createdtime"));
            model.setUserid(resultSet.getLong("userid"));
            
            return model;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
