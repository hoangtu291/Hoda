package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.model.UserModel;
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

@WebServlet(urlPatterns = {"/personal"})
public class PersonalController extends HttpServlet{
    
    @Inject
    IUserService userService;
    
    @Inject
    IPostService postService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        Long id = Long.parseLong(request.getParameter("id"));

        UserModel userModel = userService.findUserById(id);
        List<PostModel> postModels = postService.getAllPost();
        
        request.setAttribute("USER", userModel);
        request.setAttribute("POSTS", postModels);
        
        RequestDispatcher rd = request.getRequestDispatcher("/views/personal.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
