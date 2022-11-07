package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.CategoryModel;
import com.nhom01.hoda.service.ICategoryService;
import com.nhom01.hoda.utils.HttpUtil;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/api-lang"})
public class LangAPI extends HttpServlet {

 
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String lang = request.getParameter("lang");
        HttpSession session = request.getSession();
        session.setAttribute("lang", lang);
        new ObjectMapper().writeValue(response.getOutputStream(), lang);
        
    }


}
