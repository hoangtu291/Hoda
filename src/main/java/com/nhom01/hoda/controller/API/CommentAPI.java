package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.service.ICommentService;
import com.nhom01.hoda.utils.HttpUtil;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/api-comment"})
public class CommentAPI extends HttpServlet {

    @Inject
    ICommentService commentService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        CommentModel commentModel = new CommentModel();
        commentModel.setContent(request.getParameter("content"));
        commentModel.setInteractId(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //-- add product
        // get params
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        CommentModel commentModel = new CommentModel();
        commentModel.setContent(request.getParameter("content"));
        commentModel.setInteractId(1);
//        System.out.println(request.getContextPath());
//        System.out.println(commentModel.getId()); 
//        System.out.println(commentModel.getContent());
//        System.out.println(commentModel.getCreatedTime());
//        System.out.println(commentModel.getModifiedTime());
//        System.out.println(commentModel.getInteractId());

        //save model to db
        long id = commentService.save(commentModel);

        // return object Product json
        new ObjectMapper().writeValue(response.getOutputStream(), commentModel);

    }
}
