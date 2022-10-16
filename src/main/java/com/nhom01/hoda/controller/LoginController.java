package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IUserService;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/register"})
@MultipartConfig
public class LoginController extends HttpServlet {

    @Inject
    IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

//        List<UserModel> userModels  = userService.getAll();
//        
//        request.setAttribute("USERS", userModels);

        RequestDispatcher rd = request.getRequestDispatcher("/views/register.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//CODE TEST AJAX------------------------------
//        int a = Integer.parseInt(request.getParameter("a"));
//        int b = Integer.parseInt(request.getParameter("b"));
//
//        response.setContentType("text/plain");
//
//        String fileName = "";
//
//        Collection<Part> parts = request.getParts();
//
//        for (Part part : parts) {
//            String realPath = request.getSession().getServletContext().getRealPath("/upload/images");
//            fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//
//            part.write(realPath + "/" + fileName);
//            String source = realPath + "/" + fileName;
//
//            realPath = realPath.substring(0, realPath.indexOf("Hoda") + 5);
//            realPath += "src\\main\\webapp\\upload\\images";
//            realPath = realPath.replace("\\", "/");
//            FileUtils.copyFile(new File(source), new File(realPath + "/" + fileName));
//
//        }
//        response.getWriter().write("/upload/images" + "/" + fileName);
    }
}
