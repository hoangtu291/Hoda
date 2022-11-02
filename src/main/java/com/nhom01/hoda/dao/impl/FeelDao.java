package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IFeelDao;
import com.nhom01.hoda.model.FeelModel;

public class FeelDao extends AbstractDao implements IFeelDao{
     @Override
    public Long save(FeelModel feelModel) {
        String sql = "INSERT INTO feel(status, interactid) VALUES(?, ?);";
        return insert(sql, feelModel.getStatus(), feelModel.getInteractId());
    }
    @Override
    public void deleteByInteractId(Long iid){
        String sql = "DELETE FROM feel WHERE interactid=?";
        update(sql, iid);
    }
}
