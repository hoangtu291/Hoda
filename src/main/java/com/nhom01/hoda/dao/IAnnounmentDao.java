/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.AnnounmentModel;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface IAnnounmentDao {
    List<AnnounmentModel> getAllAnnoumentOfUser(long uid);
    List<AnnounmentModel> getAllAnnoumentSeenOfUser(long uid);
    
    long insertAnnReport(AnnounmentModel announmentModel);
    void updateAllStatus(long uid);

}
