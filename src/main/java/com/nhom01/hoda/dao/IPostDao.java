package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.PostModel;
import java.util.List;

public interface IPostDao {
    
    Long save(PostModel postModel);
    void update(PostModel postModel);
    void delete(long pid);
    
    List<PostModel> getAllPost();
    List<PostModel> getAllPostOfUser(long uid);
    
}
