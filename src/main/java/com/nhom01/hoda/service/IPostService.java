package com.nhom01.hoda.service;

import com.nhom01.hoda.model.PostModel;
import java.util.List;

public interface IPostService {
    Long save(PostModel postModel);
    List<PostModel> getAllPost();
}
