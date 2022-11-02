package com.nhom01.hoda.model;

public class CommentModel extends AbstractModel{
    
    private long id;
    private String content;
    private long interactId;

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

    public long getInteractId() {
        return interactId;
    }

    public void setInteractId(long interactId) {
        this.interactId = interactId;
    }
    
    
    
}
