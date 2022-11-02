
package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.CategoryModel;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.model.ReportTypeModel;
import com.nhom01.hoda.service.ICategoryService;
import com.nhom01.hoda.service.IPostService;
import com.nhom01.hoda.service.IReportTypeService;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/home", "/logout"})
public class HomeController extends HttpServlet {
    
    @Inject
    IPostService postService;
    
    @Inject
    ICategoryService categoryService;
    
    @Inject
    IReportTypeService reportTypeService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        response.setContentType("text/html;charset=UTF-8");
        
        if(path.equals("/logout")){
            HttpSession session = request.getSession();
            session.removeAttribute("account");
        }
        
        List<PostModel> postModels = postService.getAllPost();
        List<CategoryModel> categoryModels = categoryService.getAll();
        List<ReportTypeModel> reportTypeModels = reportTypeService.getAll();
        
        request.setAttribute("POSTS", postModels);
        request.setAttribute("CATEGORIES", categoryModels);
        request.setAttribute("REPORT_TYPES", reportTypeModels);
        
        HttpSession session  = request.getSession();
        session.setAttribute("lang", "en-US");
//        session.setAttribute("lang", "vi-VN");
        
        RequestDispatcher rd = request.getRequestDispatcher("/views/post.jsp");
        rd.forward(request, response);
    }
}
