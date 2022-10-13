package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.ImageModel;
import java.util.List;

public interface IImageDao {
    public long save(ImageModel imageModel, long pid);
    public void saveList(List<ImageModel> images, long pid);
    
    public List<ImageModel> getAllImagesOfPost(long pid);
}
