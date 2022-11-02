/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.ReportTypeModel;
import java.util.List;

public interface IReportTypeDao {
    List<ReportTypeModel> getAll();
}
