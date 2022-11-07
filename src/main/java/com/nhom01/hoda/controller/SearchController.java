package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.PostModel;
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
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/search"})
public class SearchController extends HttpServlet{
    @Inject
    IPostService postService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        response.setContentType("text/html;charset=UTF-8");

        if (path.equals("/logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("account");
        }

        List<PostModel> postModels = postService.getAllPost();
        request.setAttribute("POSTS", postModels);
        
        HttpSession session = request.getSession();
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/search.jsp");
        rd.forward(request, response);

    } 
}
