/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.CommentModel;
import com.nhom01.hoda.utils.HttpUtil;
import java.io.IOException;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

@WebServlet(urlPatterns = {"/api-comment"})
public class CommentAPI extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //-- add product
        // get param
        response.setContentType("application/json");

        CommentModel commentModel = new CommentModel();
        
        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;
        commentModel.setContent((String) jsonObject.get("content"));
        
        
        new ObjectMapper().writeValue(response.getOutputStream(), request.getParameter("content") + " -- "+commentModel.getContent());
    }

}