package com.nhom01.hoda.controller.ADMIN;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/admin/setting"})
public class SettingController extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }
        if (session.getAttribute("admin") == null) {
            session.removeAttribute("account");
            String site = "/register";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        } else {
           
            
            RequestDispatcher rd = request.getRequestDispatcher("/views/ADMIN/setting.jsp");
            rd.forward(request, response);
        }
    }
}
