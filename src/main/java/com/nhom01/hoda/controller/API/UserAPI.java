package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IUserService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;

@WebServlet(urlPatterns = {"/api-user"})
@MultipartConfig
public class UserAPI extends HttpServlet {

    @Inject
    IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
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
                if (request.getParameter("birthday") != null) {
                    utilDate = formatter.parse(request.getParameter("birthday"));
                } else {
                    utilDate = formatter.parse("01/01/2001");
                }

            } catch (ParseException ex) {
                Logger.getLogger(UserAPI.class.getName()).log(Level.SEVERE, null, ex);
            }

            userModel.setSocialId(request.getParameter("id"));

            userModel.getProfileModel().setAvatar(request.getParameter("picture[data][url]"));
            userModel.getProfileModel().setFirstName(request.getParameter("first_name"));
            userModel.getProfileModel().setLastName(request.getParameter("last_name"));
            userModel.getProfileModel().setDateOfBirth(new java.sql.Date(utilDate.getTime()));
            if (request.getParameter("hometown[name]") == null) {
                userModel.getProfileModel().setAddress("");
            } else {
                userModel.getProfileModel().setAddress(request.getParameter("hometown[name]"));
            }
        }

        userModel.getProfileModel().setFullName(request.getParameter("name"));
        userModel.getProfileModel().setEmail(request.getParameter("email"));
        userModel.getProfileModel().setPhone("");
        userModel.getProfileModel().setStudy("");
        userModel.getProfileModel().setWork("");

        //login
        if (userService.findUserBySocialIdAndType(userModel.getSocialId(), userModel.getLoginTypeModel().getName()) != null) {
            userModel = userService.findUserBySocialIdAndType(userModel.getSocialId(), userModel.getLoginTypeModel().getName());
            HttpSession session = request.getSession();
            session.setAttribute("account", userModel);
            new ObjectMapper().writeValue(response.getOutputStream(), "login_successfully");
        } else {//register
            userModel.setId(userService.save(userModel));

//            Tạm
            HttpSession session = request.getSession();
            session.setAttribute("account", userModel);
            new ObjectMapper().writeValue(response.getOutputStream(), userModel.getId());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        UserModel userModel = new UserModel();
        List<Part> parts = (List<Part>) request.getParts();
        userModel.setId(Long.parseLong(request.getParameter("uid")));

        userModel = userService.findUserById(userModel.getId());
        for (Part part : parts) {
            if (part.getName().equals("avatar") && part.getSubmittedFileName() != null) {
                String realPath = request.getSession().getServletContext().getRealPath("/upload/images");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String userDir = userModel.getId() + "";

                //create user folder
                Path path = Paths.get("/upload/images/" + userDir + "/avatar");
                try {
                    Files.createDirectories(path);
                    System.out.println("Directory is created!");
                } catch (IOException e) {
                    System.err.println("Failed to create directory!" + e.getMessage());
                }

                part.write(realPath + "/" + fileName);
                String source = realPath + "/" + fileName;

                //copy to main src
                realPath = realPath.substring(0, realPath.indexOf("Hoda") + 5);
                realPath += "src\\main\\webapp\\upload\\images";
                realPath = realPath.replace("\\", "/");
                FileUtils.copyFile(new File(source), new File(realPath + "/" + userDir + "/avatar/" + fileName));
                response.getWriter().write("/upload/images" + "/" + fileName);
                userModel.getProfileModel().setAvatar("/upload/images" + "/" + userDir + "/avatar/" + fileName);
            }
        }

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        java.util.Date utilDate = new java.util.Date();
        try {
            if (request.getParameter("birth") != null) {
                utilDate = formatter.parse(request.getParameter("birth"));
            } else {
                utilDate = formatter.parse("01/01/2001");
            }

        } catch (ParseException ex) {
            Logger.getLogger(UserAPI.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!request.getParameter("fullname").equals("")) {
            userModel.getProfileModel().setFullName(request.getParameter("fullname"));
        }
        if (!request.getParameter("address").equals("")) {
            userModel.getProfileModel().setAddress(request.getParameter("address"));
        }
        userModel.getProfileModel().setGender(request.getParameter("gender").equals("1"));
        if (!request.getParameter("phone").equals("")) {
            userModel.getProfileModel().setPhone(request.getParameter("phone"));
        }
        userModel.getProfileModel().setDateOfBirth(new java.sql.Date(utilDate.getTime()));

        if (!request.getParameter("study").equals("")) {
            userModel.getProfileModel().setStudy(request.getParameter("study"));
        }

        if (!request.getParameter("work").equals("")) {
            userModel.getProfileModel().setWork(request.getParameter("work"));
        }

        userService.update(userModel);

        HttpSession session = request.getSession();
        session.setAttribute("account", userModel);
    }

}
