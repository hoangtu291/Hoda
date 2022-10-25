package com.nhom01.hoda.model;

public class InteractModel {
    private long id;
    private long postId;
    private long userId;
    
    private CommentModel commentModel = new CommentModel();
    private UserModel userModel = new UserModel();

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    
    public CommentModel getCommentModel() {
        return commentModel;
    }

    public void setCommentModel(CommentModel commentModel) {
        this.commentModel = commentModel;
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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



//    private UserModel userModel = new UserModel();
//    private PostModel postModel = new PostModel();
 