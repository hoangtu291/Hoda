package com.nhom01.hoda.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/register"})
@MultipartConfig
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        RequestDispatcher rd = request.getRequestDispatcher("/views/register.jsp");
        rd.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



//CODE TEST AJAX------------------------------
//        int a = Integer.parseInt(request.getParameter("a"));
//        int b = Integer.parseInt(request.getParameter("b"));
//
//        response.setContentType("text/plain");
//
//        Part part = request.getPart("image");
//        String realPath = request.getSession().getServletContext().getRealPath("/upload/images");
//        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//        part.write(realPath + "/" + fileName);
//        response.getWriter().write("/upload/images" + "/" + fileName);
    }
}
