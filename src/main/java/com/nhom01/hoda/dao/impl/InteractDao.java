package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IInteractDao;
import com.nhom01.hoda.mapper.InteractMapper;
import com.nhom01.hoda.model.InteractModel;
import java.util.List;

public class InteractDao extends AbstractDao<InteractModel> implements IInteractDao{
    @Override
    public long save(InteractModel interactModel) {
        String sql = "INSERT INTO interact(postid, userid) VALUES(?, ?)";
        return insert(sql, interactModel.getPostId(), interactModel.getUserId());
    }

    @Override
    public List<InteractModel> getAllInteractOfPost(long pid) {
        String sql ="SELECT interact.id as interactid, postid, userid, fullname, "
                + "email, avatarimg , comment.id as cmtid, comment.content as cmtcontent, "
                + "comment.createdtime as cmtcreatedtime, comment.modifiedtime as cmtmodifiedtime "
                + "FROM interact INNER JOIN comment ON interact.id = comment.interactid "
                + "INNER JOIN user ON user.id=interact.userid INNER JOIN profile ON user.profileid=profile.id "
                + "WHERE postid = ? ORDER BY cmtcreatedtime DESC";
        return query(sql, new InteractMapper(), pid);
    }
}
