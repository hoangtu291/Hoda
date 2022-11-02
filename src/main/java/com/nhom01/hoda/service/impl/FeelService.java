package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IFeelDao;
import com.nhom01.hoda.dao.IInteractDao;
import com.nhom01.hoda.model.InteractModel;
import com.nhom01.hoda.service.IFeelService;
import java.util.List;
import javax.inject.Inject;

public class FeelService implements IFeelService {
    
    @Inject
    IFeelDao feelDao;
    
    @Inject
    IInteractDao interactDao;
    
    @Override
    public Long save(InteractModel interactModel) {
        Long fid;
        interactModel.setId(interactDao.save(interactModel));
        interactModel.getFeelModel().setInteractId(interactModel.getId());
        fid = feelDao.save(interactModel.getFeelModel());
        return fid;
    }
    @Override
    public void delete(long uid, long pid, long status) {
        long iid=findInteractId(uid, pid, status);
        feelDao.deleteByInteractId(iid);
        interactDao.delete(iid);
    }
    @Override
    public long findInteractId(long uid, long pid, long status) {
        long iid = 0;
        List<InteractModel> interactModels = interactDao.getAllInteractOfPost(pid);
        for (int i = 0; i < interactModels.size(); i++) {

            if (interactModels.get(i).getPostId() == pid && interactModels.get(i).getUserId() == uid && interactModels.get(i).getFeelModel().getStatus() == status) {
                iid = interactModels.get(i).getId();
            }
        }
        return iid;
    }
    @Override
    public long findFeelId(long uid, long pid, long status) {
        long fid = 0;
        List<InteractModel> interactModels = interactDao.getAllInteractOfPost(pid);
        for (int i = 0; i < interactModels.size(); i++) {

            if (interactModels.get(i).getPostId() == pid && interactModels.get(i).getUserId() == uid && interactModels.get(i).getFeelModel().getStatus() == status) {
                fid = interactModels.get(i).getFeelModel().getId();
            }
        }
        return fid;
    }
}
