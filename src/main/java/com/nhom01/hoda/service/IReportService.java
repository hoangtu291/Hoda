package com.nhom01.hoda.service;

import com.nhom01.hoda.model.ReportModel;

public interface IReportService {
    ReportModel getReportOfPostByUserAndType(long pid, long uid, long typeid);
    
    long insert(ReportModel reportModel);
    
    void deleteAllReportOfPost(long pid);
}
