package com.nhom01.hoda.model;

import java.sql.Timestamp;

public class ReportModel {
    private long id;
    private Timestamp createdtime;
    private long reportTypeId;
    private long postId;
    private long userId;
    
    private ReportTypeModel reportTypeModel = new ReportTypeModel();
    private PostModel postModel = new PostModel();
    private UserModel userModel = new UserModel();

    public ReportTypeModel getReportTypeModel() {
        return reportTypeModel;
    }

    public void setReportTypeModel(ReportTypeModel reportTypeModel) {
        this.reportTypeModel = reportTypeModel;
    }

    public PostModel getPostModel() {
        return postModel;
    }

    public void setPostModel(PostModel postModel) {
        this.postModel = postModel;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }
    
    

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Timestamp getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(Timestamp createdtime) {
        this.createdtime = createdtime;
    }

    public long getReportTypeId() {
        return reportTypeId;
    }

    public void setReportTypeId(long reportTypeId) {
        this.reportTypeId = reportTypeId;
    }

    public long getPostId() {
        return postId;
    }

    public void setPostId(long postId) {
        this.postId = postId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }
}
