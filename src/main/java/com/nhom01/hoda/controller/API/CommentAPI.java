/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.model.InteractModel;
import com.nhom01.hoda.service.ICommentService;
import com.nhom01.hoda.service.IUserService;
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

@WebServlet(urlPatterns = {"/api-comment"})
public class CommentAPI extends HttpServlet {
    
    @Inject
    ICommentService commentService;
    
    @Inject
    IUserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //-- add product
        // get param
        response.setContentType("application/json");

        CommentModel commentModel = new CommentModel();
        
        InteractModel interactModel = new InteractModel();
        
        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;
//        commentModel.getInteractModel().setPostId((Long.parseLong((String) jsonObject.get("pid"))));
//        commentModel.getInteractModel().setUserId((Long.parseLong((String) jsonObject.get("uid"))));
//        commentModel.setContent((String) jsonObject.get("content"));

        interactModel.setPostId((Long.parseLong((String) jsonObject.get("pid"))));
        interactModel.setUserId((Long.parseLong((String) jsonObject.get("uid"))));
        interactModel.getCommentModel().setContent((String) jsonObject.get("content"));
        
        
        commentService.save(interactModel);
        
        interactModel.setUserModel(userService.findUserById(interactModel.getUserId()));
        
        new ObjectMapper().writeValue(response.getOutputStream(), interactModel);
    }

}