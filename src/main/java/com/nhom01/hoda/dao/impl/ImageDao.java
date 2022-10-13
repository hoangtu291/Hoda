
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IImageDao;
import com.nhom01.hoda.mapper.ImageMapper;
import com.nhom01.hoda.model.ImageModel;
import java.util.List;

public class ImageDao extends AbstractDao<ImageModel> implements IImageDao{

    @Override
    public long save(ImageModel imageModel, long pid) {
        String sql = "INSERT INTO image(url, postid) VALUES(?, ?)";
        return insert(sql, imageModel.getUrl(), pid);
    }

    @Override
    public void saveList(List<ImageModel> images, long pid) {
        for (ImageModel image : images) {
            save(image, pid);
        }
    }

    @Override
    public List<ImageModel> getAllImagesOfPost(long pid) {
        String sql = "SELECT * FROM image WHERE postid = ?";
        return query(sql, new ImageMapper(), pid);
    }
    
}
