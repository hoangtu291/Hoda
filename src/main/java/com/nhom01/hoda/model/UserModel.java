package com.nhom01.hoda.model;

public class UserModel extends AbstractModel {

    private long id;
    private String socialId;
    private long loginTypeId;
    private long profileId;
    private String role;

    private LoginTypeModel loginTypeModel = new LoginTypeModel();
    private ProfileModel profileModel = new ProfileModel();

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSocialId() {
        return socialId;
    }

    public void setSocialId(String socialId) {
        this.socialId = socialId;
    }

    public long getLoginTypeId() {
        return loginTypeId;
    }

    public void setLoginTypeId(long loginTypeId) {
        this.loginTypeId = loginTypeId;
    }

    public long getProfileId() {
        return profileId;
    }

    public void setProfileId(long profileId) {
        this.profileId = profileId;
    }

    public LoginTypeModel getLoginTypeModel() {
        return loginTypeModel;
    }

    public void setLoginTypeModel(LoginTypeModel loginTypeModel) {
        this.loginTypeModel = loginTypeModel;
    }

    public ProfileModel getProfileModel() {
        return profileModel;
    }

    public void setProfileModel(ProfileModel profileModel) {
        this.profileModel = profileModel;
    }

}
