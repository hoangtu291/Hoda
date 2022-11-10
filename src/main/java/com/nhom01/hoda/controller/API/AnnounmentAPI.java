package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.AnnounmentModel;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IAnnounmentService;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/api-announment"})
public class AnnounmentAPI extends HttpServlet {

    @Inject
    IAnnounmentService announmentService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //-- add product
        // get params
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        HttpSession session = request.getSession();
        UserModel userModel = (UserModel) session.getAttribute("account");
        List<AnnounmentModel> announmentModels = announmentService.getAllAnnoumentSeenOfUser(userModel.getId());


        // return object Product json
        new ObjectMapper().writeValue(response.getOutputStream(), announmentModels.size());

    }

}
