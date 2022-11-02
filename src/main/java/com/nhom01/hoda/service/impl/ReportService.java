package com.nhom01.hoda.service.impl;

import com.nhom01.hoda.dao.IReportDao;
import com.nhom01.hoda.model.ReportModel;
import com.nhom01.hoda.service.IReportService;
import java.sql.Timestamp;
import javax.inject.Inject;

public class ReportService implements IReportService{
    
    @Inject
    IReportDao reportDao;

    @Override
    public long insert(ReportModel reportModel) {
        reportModel.setCreatedtime(new Timestamp(System.currentTimeMillis()));
        return reportDao.insert(reportModel);
    }
    
}
