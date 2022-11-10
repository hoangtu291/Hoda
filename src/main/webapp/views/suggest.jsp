<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gợi ý</title>
        <link rel="stylesheet" href="../template/css/suggest.css">
        <link rel="stylesheet" href="../template/css/post.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <body lang="${sessionScope.lang}">
        <main class="center">
            <div class="content-top d-flex">
                <h5> <span label-lang="SUGGEST_USER_TITLE" class="multilang"></span></h5>
            </div>
            <div class="list-user" id="list-user">
                
                <c:forEach items="${requestScope.USERS}" var="user">
                    <c:if test="${user.getId() != sessionScope.account.getId()}">
                    <a href="/personal?id=${user.getId()}">
                        <div class="item-search">
                            <div class="content-item">
                                <div class="person-info">
                                    <div class="avatar-person ">
                                        <img class="rounded-circle" src="${user.getProfileModel().getAvatar()}" alt="">
                                    </div>
                                    <div class="goal-search">
                                        <span>${user.getProfileModel().getFullName()}</span>
                                    </div>
                                </div>
                                    
                            </div>
                        </div>
                    </a>
                    </c:if>
                </c:forEach>
            </div>
        </main>
    </body>
</html>
