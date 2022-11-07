/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IAnnounmentDao;
import com.nhom01.hoda.model.AnnounmentModel;

/**
 *
 * @author ASUS
 */
public class AnnounmentDao extends AbstractDao implements IAnnounmentDao {

    @Override
    public long insertAnnReport(AnnounmentModel announmentModel) {
        String sql = "INSERT INTO announment(message, status, createdtime, userid) VALUES(?, ?, ?, ?)";
        return insert(sql, announmentModel.getMessage(), announmentModel.getStatus(), announmentModel.getCreatedtime()
                            , announmentModel.getUserid());
    }

    

}
