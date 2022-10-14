<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title><dec:title default="Home" /></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" /> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="shortcut icon" href="<c:url value='/template/images/Logo_Xanh.png' />" type="images/vnd.microsoft.icon">-->
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.19.1/dist/bootstrap-table.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link rel="stylesheet" href="<c:url value='/template/css/home.css' />">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
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
<script>
//    var request;
//    function sendComment() {
//
//        if (window.XMLHttpRequest) {
//            request = new XMLHttpRequest();
//        } else if (window.ActiveXObject) {
//            request = new ActiveXObject("Microsoft.XMLHTTP");
//        }
//    }
    $('#btn-send').click(function (event){
        event.preventDefault();
//        sendComment();
        var data = {};
        var formData = $('#form-comment').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        })
//                var dt = new Date();
//                var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
//                document.write(time);
//                data["createdTime"] = time;
//                data["modifiedTime"] = null;
        console.log(data);

        $.ajax({
            type: "GET",
            url: "/api-comment",
            contentType: 'application/json',
            data: data,
            dataType: 'json',
        })
        
        console.log(data);
    });

</script>

    </body>
</html>