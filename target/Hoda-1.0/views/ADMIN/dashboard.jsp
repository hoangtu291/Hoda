
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body>
    <div class="content-wrapper">
        <div class="row">
            <div class="col-sm-12">
                <div class="home-tab">

                    <div class="tab-content tab-content-basic">
                        <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview"> 
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="statistics-details d-flex align-items-center justify-content-around">
                                        <div>
                                            <p class="statistics-title"><span label-lang="ADMIN_HOME_NUM_TOTAL_POST" class="multilang"></span></p>
                                            <h3 class="rate-percentage">${requestScope.POSTS.size()} <span label-lang="ADMIN_HOME_NUM_POST" class="multilang"></span></h3>

                                        </div>
                                        <div>
                                            <p class="statistics-title"><span label-lang="ADMIN_HOME_NUM_TOTAL_USER" class="multilang"></span></p>
                                            <h3 class="rate-percentage">${requestScope.USERS.size()} <span label-lang="ADMIN_HOME_NUM_USER" class="multilang"></span></h3>
                                        </div>
                                        
                                        <div>
                                            <p class="statistics-title"><span label-lang="ADMIN_HOME_NUM_TOTAL_VISITED" class="multilang"></span></p>
                                            <h3 class="rate-percentage">${requestScope.TOTAL_VIEW} <span label-lang="ADMIN_HOME_NUM_VISITED" class="multilang"></span></h3>
                                        </div>

                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-lg-8 d-flex flex-column grid-margin stretch-card">
                                    <div class="row flex-grow">
                                        <div class="col-12 col-lg-4 col-lg-12">
                                            <div class="card card-rounded">
                                                <div class="card-body">
                                                    <div class="d-sm-flex justify-content-between align-items-start">
                                                        <div>
                                                            <h4 class="card-title card-title-dash"><span label-lang="ADMIN_HOME_CHART_CATEGORY" class="multilang"></span></h4>
                                                            <h5 class="card-subtitle card-subtitle-dash"><span label-lang="ADMIN_HOME_CHART_CATEGORY_LABEL" class="multilang"></span></h5>
                                                        </div>
                                                        <div id="performance-line-legend"></div>
                                                    </div>
                                                    <div class="chartjs-wrapper mt-5">
                                                        <canvas class="my-auto" id="doughnutChart"></canvas>
                                                        <div id="doughnut-chart-legend" class="mt-5 text-center"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 d-flex flex-column grid-margin stretch-card">
                                    <div class="row flex-grow">
                                        <div class="col-md-6 col-lg-12">
                                            <div class="card card-rounded">
                                                <div class="card-body">
                                                    <div class="table-responsive  mt-1">
                                                        <table class="table select-table">
           
                                                            <tbody>
                                                                <c:forEach items="${requestScope.USERS}" var="user" end="9">
                                                                    <tr>
                                                                        <td>
                                                                            <div class="d-flex ">
                                                                                <img class="rounded-circle" src="${user.getProfileModel().getAvatar()}" alt="">
                                                                                <div>
                                                                                    <h6>${user.getProfileModel().getFullName()}</h6>
                                                                                </div>
                                                                            </div>
                                                                        </td>

                                                                        
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</body>

