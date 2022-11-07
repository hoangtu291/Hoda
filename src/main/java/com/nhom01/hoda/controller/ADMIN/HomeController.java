package com.nhom01.hoda.controller.ADMIN;

import com.nhom01.hoda.model.CategoryModel;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.ICategoryService;
import com.nhom01.hoda.service.IPostService;
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

@WebServlet(urlPatterns = {"/admin/home"})
public class HomeController extends HttpServlet {
    
    @Inject
    IPostService postService;
    
    @Inject
    IUserService userService;
    
    @Inject
    ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }
        if (session.getAttribute("admin") == null) {
            session.removeAttribute("account");
            String site = "/register";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        } else {
            List<PostModel> postModels = postService.getAllPost();
            List<CategoryModel> categoryModels = categoryService.getAll();
            List<UserModel> userModels = userService.getAll();
            
            request.setAttribute("POSTS", postModels);
            request.setAttribute("USERS", userModels);
            request.setAttribute("CATEGORIES", categoryModels);
            RequestDispatcher rd = request.getRequestDispatcher("/views/ADMIN/dashboard.jsp");
            rd.forward(request, response);
        }
    }
}
