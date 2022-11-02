package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.InteractModel;
import com.nhom01.hoda.service.IFeelService;
import com.nhom01.hoda.service.IUserService;
import java.io.IOException;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

@WebServlet(urlPatterns = {"/api-feel"})
public class FeelAPI extends HttpServlet {

    @Inject
    IFeelService feelService;

    @Inject
    IUserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;

        InteractModel interactModel = new InteractModel();
        interactModel.getFeelModel().setStatus((long) (Long.parseLong(jsonObject.get("status") + "")));
        interactModel.setUserId((long) (Long.parseLong(jsonObject.get("uid") + "")));
        interactModel.setPostId((long) (Long.parseLong(jsonObject.get("pid") + "")));
        long cancel = Long.parseLong(jsonObject.get("cancel") + "");
        if (cancel == 0) {
            feelService.save(interactModel);
            if (interactModel.getFeelModel().getStatus() == 1) {
                if (feelService.findFeelId(interactModel.getUserId(), interactModel.getPostId(), 0) != 0) {
                    feelService.delete(interactModel.getUserId(), interactModel.getPostId(), 0);
                }

            } else {
                /*DELETE LIKE*/
                if (feelService.findFeelId(interactModel.getUserId(), interactModel.getPostId(), 1) != 0) {
                    feelService.delete(interactModel.getUserId(), interactModel.getPostId(), 1);
                }

            }

        }
        else {
            feelService.delete(interactModel.getUserId(), interactModel.getPostId(), interactModel.getFeelModel().getStatus());
        }

        new ObjectMapper().writeValue(response.getOutputStream(), interactModel);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;

//        InteractModel interactModel = new InteractModel();
//        interactModel.getFeelModel().setStatus((long) (Long.parseLong(jsonObject.get("status") + "")));
//        interactModel.setUserId((long) (Long.parseLong(jsonObject.get("uid") + "")));
//        interactModel.setPostId((long) (Long.parseLong(jsonObject.get("pid") + "")));
//        feelService.delete();
//        new ObjectMapper().writeValue(response.getOutputStream(), cmtid);
    }
}
