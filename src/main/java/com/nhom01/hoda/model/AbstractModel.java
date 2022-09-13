package com.nhom01.hoda.model;

import java.sql.Timestamp;

public class AbstractModel {
    private Timestamp createdTime;
    private Timestamp modifiedTime;

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public Timestamp getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Timestamp modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

}
