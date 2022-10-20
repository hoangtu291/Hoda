package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IUserService;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/update/info"})
public class InfoController extends HttpServlet{
    
    @Inject
    IUserService userService; 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        Long id = Long.parseLong(request.getParameter("id"));
        
        UserModel userModel = userService.findUserById(id);
        request.setAttribute("USER", userModel);

        RequestDispatcher rd = request.getRequestDispatcher("/views/update_info.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
