package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.FeelModel;

public interface IFeelDao {
    Long save(FeelModel feelModel);
    void deleteByInteractId(Long iid);
    
    void deleteAllFeelOfPost(long pid);
}
