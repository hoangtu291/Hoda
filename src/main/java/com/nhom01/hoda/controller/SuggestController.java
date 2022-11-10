package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.FollowUserModel;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IFollowUserService;
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

@WebServlet(urlPatterns = {"/suggest"})
public class SuggestController extends HttpServlet {

    @Inject
    IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<UserModel> userModels = userService.getAll();

        request.setAttribute("USERS", userModels);

        HttpSession session = request.getSession();
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }


        RequestDispatcher rd = request.getRequestDispatcher("/views/suggest.jsp");
        rd.forward(request, response);

    }
}
