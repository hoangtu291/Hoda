package com.nhom01.hoda.controller.API;

import com.nhom01.hoda.model.FollowUserModel;
import com.nhom01.hoda.service.IFollowUserService;
import java.io.IOException;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

@WebServlet(urlPatterns = {"/api-follow/user"})
public class FollowUserAPI extends HttpServlet {

    @Inject
    IFollowUserService followUserService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        Long following = Long.parseLong(request.getParameter("following"));
//        Long follower = Long.parseLong(request.getParameter("follower"));
        
        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;
        
        Long following = (Long) jsonObject.get("following");
        Long follower = (Long) jsonObject.get("follower");

        FollowUserModel followUserModel = followUserService.getFollowUser(following, follower);
        if (followUserModel == null) {
            long id = followUserService.insert(following, follower);
        } else {
            followUserService.delete(followUserModel.getId());
        }

    }

}
