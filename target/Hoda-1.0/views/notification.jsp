<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Thông báo</title>

        <link rel="stylesheet" href="../template/css/notification.css">
    </head>

    <body>
        <main class="center">
            <div class="content-top">
                <span><span label-lang="NOTIFICATION_TITLE" class="multilang"></span></span>
            </div>

            <div class="main-noti-list">
                <div class="list-noti">
                    <c:forEach items="${requestScope.NOTIFICATIONS}" var="notification">
                        <div class="item-noti">
                            <div class="content-item">
                                <div class="noti-info">
                                    <div class="noti-content">
                                        
                                        <span>
                                            <c:if test="${sessionScope.lang == 'en-US'}">
                                                ${notification.getMessageEng()}
                                            </c:if>
                                            <c:if test="${sessionScope.lang == 'vi-VN'}">
                                                ${notification.getMessage()}
                                            </c:if>
                                        </span>
                                    </div>
                                    <div class="noti-time text-end">
                                        <span>${notification.getCreatedtime()}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

        </main>

    </body>

</html>
