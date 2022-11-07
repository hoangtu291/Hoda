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
import static jdk.nashorn.internal.runtime.Debug.id;

@WebServlet(urlPatterns = {"/api-category"})
public class CategoryAPI extends HttpServlet {

    @Inject
    ICategoryService categoryService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //-- add product
        // get params
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        List<CategoryModel> categoryModels = categoryService.getAll();
        
        int[] data = new int[categoryModels.size()];
        int i = 0;
        for (CategoryModel categoryModel : categoryModels) {
            data[i] = (categoryModel.getTotal()*100)/2;
            i++;
        }


        // return object Product json
        new ObjectMapper().writeValue(response.getOutputStream(), data);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //-- add product
        // get params
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        CategoryModel categoryModel = new CategoryModel();
        categoryModel = HttpUtil.toModel(request.getReader(), CategoryModel.class);

        //save model to db
        long id = categoryService.save(categoryModel);

        // return object Product json
        objectMapper.writeValue(response.getOutputStream(), id);

    }

}
