/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IAnnounmentDao;
import com.nhom01.hoda.dao.impl.*;
import com.nhom01.hoda.model.AnnounmentModel;
import com.nhom01.hoda.service.IAnnounmentService;
import java.sql.Timestamp;
import java.util.List;
import javax.inject.Inject;



public class AnnounmentService extends AbstractDao implements IAnnounmentService {
    
    @Inject 
    IAnnounmentDao announmentDao;

    @Override
    public long insertAnnReport(AnnounmentModel announmentModel) {
        
        announmentModel.setCreatedtime(new Timestamp(System.currentTimeMillis()));
        
        return announmentDao.insertAnnReport(announmentModel);
    }

    @Override
    public List<AnnounmentModel> getAllAnnoumentOfUser(long uid) {
        return announmentDao.getAllAnnoumentOfUser(uid);
    }

    @Override
    public List<AnnounmentModel> getAllAnnoumentSeenOfUser(long uid) {
        return announmentDao.getAllAnnoumentSeenOfUser(uid);
    }

    @Override
    public void updateAllStatus(long uid) {
        announmentDao.updateAllStatus(uid);
    }

    

}
