<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>

        <title><dec:title default="Home" /></title>
        <!--<meta name="color-scheme" content="dark"/>-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" /> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="<c:url value="/template/images/hoda-logo_bggreen.png"/>" type="image/png">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.19.1/dist/bootstrap-table.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="../template/lib/css/emoji.css" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value='/template/css/style.css' />">
        <link rel="stylesheet" href="<c:url value='/template/css/header.css' />">
        <link rel="stylesheet" href="<c:url value='/template/css/footer.css' />">
        <dec:head/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">

        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>
        <!-- header -->
        <%@ include file="/common/web/header.jsp" %>
        <!-- header -->

        <dec:body/>



        <!-- footer -->
        <%@ include file="/common/web/footer.jsp" %>
        <!-- footer -->


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://unpkg.com/bootstrap-table@1.19.1/dist/bootstrap-table.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.17.1/extensions/mobile/bootstrap-table-mobile.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
        <script src="https://assets.codepen.io/16327/MorphSVGPlugin3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.0/gsap.min.js"></script>
        <script src="<c:url value='/template/js/home.js' />"></script>

        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="../template/js/script.js"></script>
        <script src="../template/js/language.js"></script>

        <script src="../template/lib/js/config.min.js"></script>
        <script src="../template/lib/js/util.min.js"></script>
        <script src="../template/lib/js/jquery.emojiarea.min.js"></script>
        <script src="../template/lib/js/emoji-picker.min.js"></script>


        <script>
            $(function () {

                window.emojiPicker = new EmojiPicker({
                    emojiable_selector: '[data-emojiable=true]',
                    assetsPath: '/template/lib/img',
                    popupButtonClasses: 'fa-regular fa-face-smile-wink'
                });
                window.emojiPicker.discover();
            });
            var pathname = window.location.pathname;
            if (pathname.indexOf("home") !== -1) {
                $('.btn-home').children().removeClass('bi-house-door');
                $('.btn-home').children().addClass('bi-house-door-fill');             
            } else if (pathname.indexOf("suggestion") !== -1) {
                $('.btn-people').children().removeClass('bi-people');
                $('.btn-people').children().addClass('bi-people-fill');   
            }else if (pathname.indexOf("notification") !== -1) {
                $('.btn-notification').children().removeClass('bi-bell');
                $('.btn-notification').children().addClass('bi-bell-fill');   
            }else if (pathname.indexOf("setting") !== -1) {
                $('.btn-setting').children().removeClass('bi-gear');
                $('.btn-setting').children().addClass('bi-gear-fill');   
            }
        </script>
    </body>
</html>