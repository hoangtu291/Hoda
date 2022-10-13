/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.mapper;

import com.nhom01.hoda.model.ImageModel;
import com.nhom01.hoda.model.PostModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */

public class ImageMapper implements RowMapper<ImageModel>{

    @Override
    public ImageModel mapRow(ResultSet resultSet) {
        try {
            ImageModel image = new ImageModel();

            image.setId(resultSet.getLong("id"));
            image.setUrl(resultSet.getString("url"));
            
            return image;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
