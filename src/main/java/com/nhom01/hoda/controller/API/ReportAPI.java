package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.ReportModel;
import com.nhom01.hoda.service.IReportService;
import java.io.IOException;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

@WebServlet(urlPatterns = {"/api-report"})
public class ReportAPI extends HttpServlet{
    
    @Inject
    IReportService reportService;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ReportModel reportModel = new ReportModel();
        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;
        
        reportModel.setPostId(Long.parseLong((String) jsonObject.get("pid")));
        reportModel.setUserId(Long.parseLong((String) jsonObject.get("uid")));
        reportModel.setReportTypeId(Long.parseLong((String) jsonObject.get("reportTypeid")));
        
        
        long reportId = reportService.insert(reportModel);
        
        new ObjectMapper().writeValue(response.getOutputStream(), reportId);
    }
}
