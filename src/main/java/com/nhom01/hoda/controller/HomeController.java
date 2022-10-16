
package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.CategoryModel;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.service.ICategoryService;
import com.nhom01.hoda.service.IPostService;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    
    @Inject
    IPostService postService;
    
    @Inject
    ICategoryService categoryService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        List<PostModel> postModels = postService.getAllPost();
        List<CategoryModel> categoryModels = categoryService.getAll();
        
        request.setAttribute("POSTS", postModels);
        request.setAttribute("CATEGORIES", categoryModels);
        
        RequestDispatcher rd = request.getRequestDispatcher("/views/post.jsp");
        rd.forward(request, response);
    }
}
