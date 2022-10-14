/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nhom01.hoda.model;

/**
 *
 * @author vinhr
 */
public class CommentModel extends AbstractModel{
    
    private long id;
    private String content;
    private long interactId;
    private InteractModel interactModel= new InteractModel();
    public InteractModel getInteractModel() {
        return interactModel;
    }

    public void setInteractModel(InteractModel interactModel) {
        this.interactModel = interactModel;
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

    public long getInteractId() {
        return interactId;
    }

    public void setInteractId(long interactId) {
        this.interactId = interactId;
    }
    
    
    
}
