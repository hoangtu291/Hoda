package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.service.IPostService;
import com.nhom01.hoda.utils.HttpUtil;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/api-post"})
public class PostAPI  extends HttpServlet{
    
    @Inject
    IPostService postService;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //-- add product
        // get params
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        PostModel postModel = new PostModel();
        postModel = HttpUtil.toModel(request.getReader(), PostModel.class);

        //save model to db
        long id = postService.save(postModel);

        // return object Product json
        objectMapper.writeValue(response.getOutputStream(), id);

    }
    
}
