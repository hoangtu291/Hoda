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

        <link rel="stylesheet" href="<c:url value='/template/ADMIN/vendors/feather/feather.css' />">
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/vendors/mdi/css/materialdesignicons.min.css' />">
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/vendors/ti-icons/css/themify-icons.css' />">
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/vendors/typicons/typicons.css' />">
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/vendors/simple-line-icons/css/simple-line-icons.css' />">
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/vendors/css/vendor.bundle.base.css' />">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/vendors/datatables.net-bs4/dataTables.bootstrap4.css' />">
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/js/select.dataTables.min.css' />">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/css/vertical-layout-light/style.css' />">
        <link rel="stylesheet" href="<c:url value='/template/ADMIN/css/vertical-layout-light/post.css' />">
        <dec:head/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">

    </head>


    <body>
        <div class="container-scroller"> 
            <!-- partial:../../partials/_navbar.html -->
            <%@ include file="/common/ADMIN/navbar.jsp" %>
            <div class="container-fluid page-body-wrapper">
                <!-- partial:../../partials/_sidebar.html -->
                <%@ include file="/common/ADMIN/sidebar.jsp" %>

                <div class="main-panel">
                    <dec:body/>
                    <!-- partial:../../partials/_footer.html -->
                    <%@ include file="/common/ADMIN/footer.jsp" %>
                </div>
            </div>
        </div>



        <script src="<c:url value='/template/ADMIN/vendors/js/vendor.bundle.base.js' />"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="<c:url value='/template/ADMIN/vendors/chart.js/Chart.min.js' />"></script>
        <script src="<c:url value='/template/ADMIN/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js' />"></script>
        <script src="<c:url value='/template/ADMIN/vendors/progressbar.js/progressbar.min.js' />"></script>

        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="<c:url value='/template/ADMIN/js/off-canvas.js' />"></script>
        <script src="<c:url value='/template/ADMIN/js/hoverable-collapse.js' />"></script>
        <script src="<c:url value='/template/ADMIN/js/template.js' />"></script>
        <script src="<c:url value='/template/ADMIN/js/settings.js' />"></script>
        <script src="<c:url value='/template/ADMIN/js/todolist.js' />"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="<c:url value='/template/ADMIN/js/dashboard.js' />"></script>
        <script src="<c:url value='/template/ADMIN/js/Chart.roundedBarCharts.js' />"></script>
        <!-- End custom js for this page-->
    </body>
</html>
