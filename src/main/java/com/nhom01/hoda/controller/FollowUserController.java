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

@WebServlet(urlPatterns = {"/personal/follow"})
public class FollowUserController extends HttpServlet {

    @Inject
    IFollowUserService followUserService;

    @Inject
    IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long uid = Long.parseLong(request.getParameter("id"));

        UserModel userModel = userService.findUserById(uid);
//        List<FollowUserModel> allFollow = followUserService.getAllFollowUser();
        List<FollowUserModel> followers = followUserService.getAllFollowerOfUser(uid);
        List<FollowUserModel> following = followUserService.getAllFollowingOfUser(uid);

//        request.setAttribute("ALLFOLLOW", allFollow);
        request.setAttribute("USER", userModel);
        request.setAttribute("FOLLOWERS", followers);
        request.setAttribute("FOLLOWINGS", following);
        HttpSession session = request.getSession();
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/follow-list.jsp");
        rd.forward(request, response);

    }
}
