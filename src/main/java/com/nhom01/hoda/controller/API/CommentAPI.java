/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.model.InteractModel;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.ICommentService;
import com.nhom01.hoda.service.IUserService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;
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
        response.setContentType("application/json");
        CommentModel commentModel = new CommentModel();
        InteractModel interactModel = new InteractModel();
        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;
        interactModel.setPostId((Long.parseLong((String) jsonObject.get("pid"))));
        interactModel.setUserId((Long.parseLong((String) jsonObject.get("uid"))));
        interactModel.getCommentModel().setContent((String) jsonObject.get("content"));
        commentService.save(interactModel);
        interactModel.setUserModel(userService.findUserById(interactModel.getUserId()));
        new ObjectMapper().writeValue(response.getOutputStream(), interactModel);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        CommentModel commentModel = new CommentModel();
        InteractModel interactModel = new InteractModel();
        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;
        interactModel.setPostId((Long.parseLong((String) jsonObject.get("pid"))));
        interactModel.setUserId((Long.parseLong((String) jsonObject.get("uid"))));
        interactModel.getCommentModel().setId((long) jsonObject.get("cmtid"));
        interactModel.getCommentModel().setContent((String) jsonObject.get("content"));
        commentService.update(interactModel);
        interactModel.setUserModel(userService.findUserById(interactModel.getUserId()));
        new ObjectMapper().writeValue(response.getOutputStream(), interactModel);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;
        Long cmtid = (Long) jsonObject.get("cmtid");
        long interactid = Long.parseLong(jsonObject.get("id")+"");
        commentService.delete(cmtid, interactid);
        new ObjectMapper().writeValue(response.getOutputStream(), cmtid);
    }
}
