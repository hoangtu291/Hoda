package com.nhom01.hoda.controller.ADMIN;

import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.service.IPostService;
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

@WebServlet(urlPatterns = {"/admin/report"})
public class ReportController extends HttpServlet {

    @Inject
    IPostService postService;

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

            List<PostModel> postModels = postService.getAllPostReport();

            request.setAttribute("POST_REPORTS", postModels);

            RequestDispatcher rd = request.getRequestDispatcher("/views/ADMIN/report-list.jsp");
            rd.forward(request, response);
        }
    }
}
