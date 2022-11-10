package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.AnnounmentModel;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IAnnounmentService;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/notification"})
public class NotificationController extends HttpServlet {
    
    @Inject
    IAnnounmentService announmentService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }
        
        if (session.getAttribute("admin") != null) {
            session.removeAttribute("account");
            String site = "/admin/home";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }
        
        if (session.getAttribute("account") == null) {
            session.removeAttribute("account");
            String site = "/home";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }
        
        UserModel userModel = (UserModel) session.getAttribute("account");
        List<AnnounmentModel> announmentModels = announmentService.getAllAnnoumentOfUser(userModel.getId());
        announmentService.updateAllStatus(userModel.getId());
        
        request.setAttribute("NOTIFICATIONS", announmentModels);
        RequestDispatcher rd = request.getRequestDispatcher("/views/notification.jsp");
        rd.forward(request, response);

    }
}
