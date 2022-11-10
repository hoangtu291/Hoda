package com.nhom01.hoda.controller.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhom01.hoda.model.AnnounmentModel;
import com.nhom01.hoda.model.ImageModel;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.service.IAnnounmentService;
import com.nhom01.hoda.service.ICategoryService;
import com.nhom01.hoda.service.IPostService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

@MultipartConfig
@WebServlet(urlPatterns = {"/api-post"})
public class PostAPI extends HttpServlet {

    @Inject
    IPostService postService;

    @Inject
    ICategoryService categoryService;
    
    @Inject
    IAnnounmentService announmentService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //-- add product
        // get params
        PostModel postModel = new PostModel();
        List<Part> parts = (List<Part>) request.getParts();
        postModel.setUserid(Long.parseLong(request.getParameter("userid")));
//        Part part = request.getPart("image");
        int i = 0;
        for (Part part : parts) {
            if (part.getName().substring(0, 5).equals("image")) {
                String realPath = request.getSession().getServletContext().getRealPath("/upload/images");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(realPath + "/" + fileName);
                String source = realPath + "/" + fileName;

                String userDir = postModel.getUserid() + "";
                //create user folder
                Path path = Paths.get("/upload/images/" + userDir + "/post");
                try {
                    Files.createDirectories(path);
                    System.out.println("Directory is created!");
                } catch (IOException e) {
                    System.err.println("Failed to create directory!" + e.getMessage());
                }

                realPath = realPath.substring(0, realPath.indexOf("Hoda") + 5);
                realPath += "src\\main\\webapp\\upload\\images";
                realPath = realPath.replace("\\", "/");
                FileUtils.copyFile(new File(source), new File(realPath + "/" + userDir + "/post/" + fileName));
                response.getWriter().write("/upload/images" + "/" + fileName);
                postModel.getImageModels().add(new ImageModel());
                postModel.getImageModels().get(i).setUrl("/upload/images/" + userDir + "/post" + "/" + fileName);
                i++;
            }
        }

        // mapper json string to object
        postModel.setTitle(request.getParameter("title"));
        postModel.setContent(request.getParameter("content"));

//        postModel.getImageModels().get(0).setUrl("/upload/images" + "/" + fileName);//1 ảnh
        postModel.setCategoryid(Long.parseLong(request.getParameter("categoryid")));

        //save model to db
        long id = postService.save(postModel);

        // return object Product json
        new ObjectMapper().writeValue(response.getOutputStream(), postModel);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //-- add product
        // get params
        PostModel postModel = new PostModel();
        List<Part> parts = (List<Part>) request.getParts();
        postModel.setId(Long.parseLong(request.getParameter("pid")));
        postModel = postService.getPostById(postModel.getId());
        categoryService.updateTotalOfCategory(postModel.getCategoryid(), categoryService.getCategoryById(postModel.getCategoryid()).getTotal(), false);

        postModel.setUserid(Long.parseLong(request.getParameter("userid")));
//        Part part = request.getPart("image");
        int i = 0;
        for (Part part : parts) {
            if (part.getName().length() >= 5) {
                if (part.getName().substring(0, 5).equals("image")) {
                    String realPath = request.getSession().getServletContext().getRealPath("/upload/images");
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    part.write(realPath + "/" + fileName);
                    String source = realPath + "/" + fileName;

                    String userDir = postModel.getUserid() + "";
                    //create user folder
                    Path path = Paths.get("/upload/images/" + userDir + "/post");
                    try {
                        Files.createDirectories(path);
                        System.out.println("Directory is created!");
                    } catch (IOException e) {
                        System.err.println("Failed to create directory!" + e.getMessage());
                    }

                    realPath = realPath.substring(0, realPath.indexOf("Hoda") + 5);
                    realPath += "src\\main\\webapp\\upload\\images";
                    realPath = realPath.replace("\\", "/");
                    FileUtils.copyFile(new File(source), new File(realPath + "/" + userDir + "/post/" + fileName));
                    response.getWriter().write("/upload/images" + "/" + fileName);
                    postModel.getImageModels().add(new ImageModel());
                    postModel.getImageModels().get(i).setUrl("/upload/images/" + userDir + "/post" + "/" + fileName);
                    i++;
                }
            }
        }

        // mapper json string to object
        postModel.setTitle(request.getParameter("title"));
        postModel.setContent(request.getParameter("content"));

//        postModel.getImageModels().get(0).setUrl("/upload/images" + "/" + fileName);//1 ảnh
        postModel.setCategoryid(Long.parseLong(request.getParameter("categoryid")));

        //save model to db
        postService.update(postModel);

        // return object Product json
        new ObjectMapper().writeValue(response.getOutputStream(), postModel.getId());
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String strJson = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Object obj = JSONValue.parse(strJson);
        JSONObject jsonObject = (JSONObject) obj;

        long pid = (Long.parseLong((String) jsonObject.get("pid")));

        PostModel postModel = postService.getPostById(pid);
        categoryService.updateTotalOfCategory(postModel.getCategoryid(), categoryService.getCategoryById(postModel.getCategoryid()).getTotal(), false);
        postService.delete(pid);
        if (request.getParameter("type").equals("report")) {
            AnnounmentModel announmentModel = new AnnounmentModel();
            announmentModel.setMessage("Bài viết của bạn đã bị xóa do vi phạm quy tắc");
            announmentModel.setMessageEng("Your post has been removed due to rule violations");
            announmentModel.setStatus(0);
            announmentModel.setUserid(postModel.getUserid());
            
            announmentService.insertAnnReport(announmentModel);
            
        }
        // return object Product json
        new ObjectMapper().writeValue(response.getOutputStream(), pid);
    }

}
