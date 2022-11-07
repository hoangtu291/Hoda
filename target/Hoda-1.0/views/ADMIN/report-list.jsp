<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>


    <!-- partial -->

    <div class="content-wrapper">
        <div class="row">

           <c:forEach items="${requestScope.POST_REPORTS}" var="postReport">
               <div class="col-6 d-flex flex-column grid-margin stretch-card" id="item-Post_${postReport.getId()}">
                    <div class="col-12">
                        <div class="card">
                            <div class="post">
                                <div class="header-post">
                                    <nav class="navbar navbar-expand ps-2 pe-2 gap-2">
                                        <img src="${postReport.getUserModel().getProfileModel().getAvatar()}" class="d-block rounded-circle" alt=""
                                             style="height: 35px; width: 35px;">
                                        <div>
                                            <h5>${postReport.getUserModel().getProfileModel().getFullName()}</h5>
                                            <p>${postReport.getCreatedTime()}</p>
                                        </div>
                                    </nav>
                                </div>

                                <div class="content-post p-2">
                                    <h6>${postReport.getTitle()}</h6>
                                    <p>
                                        <a data-bs-toggle="collapse" href="#collapseContent_${postReport.getId()}" aria-expanded="false"
                                           aria-controls="collapseContent_${postReport.getId()}">
                                            Xem thêm
                                        </a>
                                    </p>
                                    <div class="collapse" id="collapseContent_${postReport.getId()}">
                                        <div class="card card-body" style="width:100%; margin: 0; padding: 0; border: 0;">
                                            ${postReport.getContent()}
                                        </div>
                                    </div>
                                </div>
                                <div class="image-post">
                                    <c:if test="${not empty postReport.getImageModels()}">
                                        <div id="carouselImagePost_${postReport.getId()}" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                            <c:if test="${postReport.getImageModels().size() > 1}">
                                                <div class="carousel-indicators">
                                                    <c:forEach items="${postReport.getImageModels()}" var="imgPost" varStatus="loop">
                                                        <button type="button" data-bs-target="#carouselImagePost_${postReport.getId()}" data-bs-slide-to="${loop.index}" class="<c:if test="${loop.index == 1}">active</c:if>" aria-current="true" aria-label="Slide 1"></button>
                                                    </c:forEach>
                                                </div>
                                            </c:if>
                                            <div class="carousel-inner">
                                                <c:forEach items="${postReport.getImageModels()}" var="imgPost" varStatus="loop">
                                                    <div class="carousel-item <c:if test="${loop.index == 0}">active</c:if>" data-bs-interval="10000">
                                                        <img src="${imgPost.getUrl()}" class="d-block" alt="...">
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${postReport.getImageModels().size() > 1}">
                                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselImagePost_${postReport.getId()}"" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button" data-bs-target="#carouselImagePost_${postReport.getId()}"" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="report-status mx-3 my-2">
                                    <div class="d-flex align-items-center justify-content-between mb-3">
                                        <h4 class="card-title card-title-dash">Report content</h4>
                                        <p class="mb-0">${postReport.getReportModels().size()} reports for this post</p>
                                    </div>

                                    <ul class="bullet-line-list">

                                        <c:forEach items="${postReport.getReportModels()}" var="report">
                                            <li>
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <c:if test="${sessionScope.lang == 'en-US'}">${report.getReportTypeModel().getContentEng()}</c:if>
                                                        <c:if test="${sessionScope.lang == 'vi-VN'}">${report.getReportTypeModel().getContent()}</c:if>
                                                        </div>
                                                        <p>${report.getCreatedtime()}</p>
                                                </div>
                                            </li>
                                        </c:forEach>

                                    </ul>

                                </div>

                                <div class="footer-post mx-3">
                                    <button type="button" class="btn btn-inverse-danger btn-fw btn-rounded me-3 btn-deletePost" id="btn-deletePost_${postReport.getId()}">Remove post</button>
                                    <button type="button" class="btn btn-inverse-success btn-fw btn-rounded btn-deleteReport" id="btn-deleteReport_${postReport.getId()}">Remove report</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>
    <!-- content-wrapper ends -->
    <!-- partial:../../partials/_footer.html -->

    <!-- partial -->
</body>
