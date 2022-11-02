package com.nhom01.hoda.service;

import com.nhom01.hoda.model.InteractModel;

public interface IFeelService {
    Long save(InteractModel interactModel);
    void delete(long uid, long pid, long status);
    long findInteractId(long uid, long pid, long status);
    long findFeelId(long uid, long pid, long status);

    
}
