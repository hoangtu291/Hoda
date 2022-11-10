package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.CategoryModel;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.model.ReportTypeModel;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.ICategoryService;
import com.nhom01.hoda.service.IPostService;
import com.nhom01.hoda.service.IReportTypeService;
import com.nhom01.hoda.service.IUserService;
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

@WebServlet(urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    @Inject
    IPostService postService;

    @Inject
    IUserService userService;
    
    @Inject
    ICategoryService categoryService;

    @Inject
    IReportTypeService reportTypeService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<PostModel> postModels = postService.getAllPost();
        List<UserModel> userModels = userService.getAll();
        List<ReportTypeModel> reportTypeModels = reportTypeService.getAll();
        List<CategoryModel> categoryModels = categoryService.getAll();
        request.setAttribute("CATEGORIES", categoryModels);

        request.setAttribute("USERS", userModels);
        request.setAttribute("POSTS", postModels);
        request.setAttribute("REPORT_TYPES", reportTypeModels);
        HttpSession session = request.getSession();
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }

        if (session.getAttribute("admin") != null) {
            session.removeAttribute("account");
            String site = "/admin/home";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/search.jsp");
        rd.forward(request, response);

    }
}
