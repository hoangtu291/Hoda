package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IUserService;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/api-user"})
public class UserAPI extends HttpServlet {

    @Inject
    IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel userModel = new UserModel();

        userModel.getLoginTypeModel().setName(request.getParameter("type"));
        if (userModel.getLoginTypeModel().getName().equals("google")) {

            userModel.setSocialId(request.getParameter("sub"));
            userModel.getProfileModel().setAvatar(request.getParameter("picture"));
            userModel.getProfileModel().setFirstName(request.getParameter("given_name"));
            userModel.getProfileModel().setLastName(request.getParameter("family_name"));
            userModel.getProfileModel().setDateOfBirth(Date.valueOf("2001-01-01"));
            userModel.getProfileModel().setAddress("");
        } else if (userModel.getLoginTypeModel().getName().equals("facebook")) {
            
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            java.util.Date utilDate = new java.util.Date();
            try {
                utilDate = formatter.parse(request.getParameter("birthday"));
            } catch (ParseException ex) {
                Logger.getLogger(UserAPI.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            userModel.setSocialId(request.getParameter("id"));
            
            userModel.getProfileModel().setAvatar(request.getParameter("picture[data][url]"));
            userModel.getProfileModel().setFirstName(request.getParameter("first_name"));
            userModel.getProfileModel().setLastName(request.getParameter("last_name"));
            userModel.getProfileModel().setDateOfBirth(new java.sql.Date(utilDate.getTime()));
            userModel.getProfileModel().setAddress(request.getParameter("hometown[name]"));

        }

        userModel.getProfileModel().setFullName(request.getParameter("name"));
        userModel.getProfileModel().setEmail(request.getParameter("email"));

        userModel.setId(userService.save(userModel));

        new ObjectMapper().writeValue(response.getOutputStream(), userModel);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
