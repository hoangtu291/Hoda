<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>


    <!-- partial -->

    <div class="content-wrapper">
        <div class="row">

            <div class="col-6 d-flex flex-column grid-margin stretch-card">
                <div class="col-12">
                    <div class="card">
                        <ul class="list-group list-group-flush">
                            <li class="btn list-group-item text-start" style="height: 40px;" type="button" data-bs-toggle="collapse" data-bs-target="#selectLangCollapse" aria-expanded="false" aria-controls="selectLangCollapse"><span label-lang="SETTING_BUTTON_LANGUAGES" class="multilang"></span></li>
                            <div class="collapse multi-collapse" id="selectLangCollapse">
                                <span class="mx-3" style="font-size: 14px; font-weight: 700"><span label-lang="SETTING_BUTTON_LANGUAGES" class="multilang"></span>:</span>
                                <div class="card-body" style="border:none">

                                    <select id="select_Lang" class="form-select" aria-label="Default select example">
                                        <c:if test="${sessionScope.lang == 'en-US'}">
                                            <option value="en-US" selected>Engish </option>
                                            <option value="vi-VN" >Tiếng Việt</option>
                                        </c:if>
                                        <c:if test="${sessionScope.lang == 'vi-VN'}">
                                            <option value="en-US" >Engish </option>
                                            <option value="vi-VN" selected>Tiếng Việt</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <li class="btn list-group-item text-start" style="height: 40px;" type="button" data-bs-toggle="collapse" data-bs-target="#aboutUsCollapse" aria-expanded="false" aria-controls="aboutUsCollapse"><span label-lang="SETTING_BUTTON_ABOUT_US" class="multilang"></span></li>
                            <div class="collapse multi-collapse" id="aboutUsCollapse">
                                <span class="mx-3" style="font-size: 14px; font-weight: 700"><span label-lang="SETTING_BUTTON_ABOUT_US" class="multilang"></span>:</span>
                                <div class="card-body" style="border:none">
                                    <ul>
                                        <li>Lê Hoàng Tú</li>
                                        <li>Trần Phan Hoàng Tùng</li>
                                        <li>Trương Phúc Vĩnh</li>
                                    </ul>
                                </div>
                            </div>
                            <li class="list-group-item"></li>
                        </ul>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <!-- content-wrapper ends -->
    <!-- partial:../../partials/_footer.html -->

    <!-- partial -->
</body>
