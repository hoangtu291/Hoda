/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao.impl;

import com.nhom01.hoda.dao.IReportDao;
import com.nhom01.hoda.mapper.ReportMapper;
import com.nhom01.hoda.model.ReportModel;
import java.util.List;

public class ReportDao extends AbstractDao implements IReportDao{

    @Override
    public long insert(ReportModel reportModel) {
        String sql = "INSERT INTO report(createdtime, report_typeid, postid, userid) VALUES(?, ?, ?, ?)";
        return insert(sql, reportModel.getCreatedtime(), reportModel.getReportTypeId(), reportModel.getPostId(), reportModel.getUserId());
    }

    @Override
    public List<ReportModel> getReportOfPost(long pid) {
        String sql = " SELECT report.id as repid, report.createdtime as repcreatedtime, report_typeid, report.postid as reppid,"
                + " report.userid as repuid, report_type.id as reptypeid, report_type.content as reptypecontent,"
                + " report_type.contentEng as reptypecontentEng FROM report"
                + " INNER JOIN report_type ON report.report_typeid = report_type.id WHERE report.postid=?;";
        return query(sql, new ReportMapper(), pid);
    }

    @Override
    public void deleteAllReportOfPost(long pid) {
        String sql = "DELETE FROM report WHERE postid=?";
        update(sql, pid);
    }

    @Override
    public ReportModel getReportOfPostByUserAndType(long pid, long uid, long typeid) {
        String sql = "SELECT report.id as repid, report.createdtime as repcreatedtime, report_typeid, report.postid as reppid,"
                + " report.userid as repuid, report_type.id as reptypeid, report_type.content as reptypecontent,"
                + " report_type.contentEng as reptypecontentEng FROM report"
                + " INNER JOIN report_type ON report.report_typeid = report_type.id"
                + " WHERE report.postid=? AND report.userid=? AND report.report_typeid=?;";
        List<ReportModel> reportModels = query(sql, new ReportMapper(), pid, uid, typeid);
        return reportModels.size() > 0 ? reportModels.get(0) : null;
    }
    

}
