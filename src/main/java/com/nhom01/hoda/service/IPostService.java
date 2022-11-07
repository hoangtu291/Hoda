package com.nhom01.hoda.service;

import com.nhom01.hoda.model.PostModel;
import java.util.List;

public interface IPostService {
    Long save(PostModel postModel);
    void update(PostModel postModel);
    void delete(long pid);
    
    List<PostModel> getAllPost();
    List<PostModel> getAllPostOfUser(long uid);
    List<PostModel> getAllPostReport();
    PostModel getPostById(long id);
    List<PostModel> getPostByCateld(long categoryId);
}
