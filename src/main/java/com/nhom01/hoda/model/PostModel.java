package com.nhom01.hoda.model;

import java.util.ArrayList;
import java.util.List;

public class PostModel extends AbstractModel{
    private long id;
    private String title;
    private String content;
    private long userid;
    private long categoryid;
    private long imageid;
    
    private UserModel userModel = new UserModel();
    private CategoryModel categoryModel = new CategoryModel();
    private List<ImageModel> imageModels = new ArrayList<>();
    
    private List<InteractModel> interactModels = new ArrayList<>();

    public List<InteractModel> getInteractModels() {
        return interactModels;
    }

    public void setInteractModels(List<InteractModel> interactModels) {
        this.interactModels = interactModels;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public long getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(long categoryid) {
        this.categoryid = categoryid;
    }

    public List<ImageModel> getImageModels() {
        return imageModels;
    }

    public void setImageModels(List<ImageModel> imageModels) {
        this.imageModels = imageModels;
    }


    public long getImageid() {
        return imageid;
    }

    public void setImageid(long imageid) {
        this.imageid = imageid;
    }

    public CategoryModel getCategoryModel() {
        return categoryModel;
    }

    public void setCategoryModel(CategoryModel categoryModel) {
        this.categoryModel = categoryModel;
    }
}
