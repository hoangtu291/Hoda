/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IAnnounmentDao;
import com.nhom01.hoda.mapper.AnnounmentMapper;
import com.nhom01.hoda.model.AnnounmentModel;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class AnnounmentDao extends AbstractDao implements IAnnounmentDao {

    @Override
    public long insertAnnReport(AnnounmentModel announmentModel) {
        String sql = "INSERT INTO announment(message, messageEng, status, createdtime, userid) VALUES(?, ?,  ?, ?, ?)";
        return insert(sql, announmentModel.getMessage(), announmentModel.getMessageEng(), announmentModel.getStatus(), announmentModel.getCreatedtime()
                            , announmentModel.getUserid());
    }

    @Override
    public List<AnnounmentModel> getAllAnnoumentOfUser(long uid) {
        String sql = "SELECT * FROM announment WHERE userid = ?";
        return query(sql, new AnnounmentMapper(), uid);
    }
    
    @Override
    public void updateAllStatus(long uid) {
        String sql = "UPDATE announment SET status = ? WHERE userid = ?";
        update(sql, 1, uid);
    }
    
    @Override
    public List<AnnounmentModel> getAllAnnoumentSeenOfUser(long uid) {
        String sql = "SELECT * FROM announment WHERE userid = ? AND status = ?";
        return query(sql, new AnnounmentMapper(), uid, 0);
    }

    

}
