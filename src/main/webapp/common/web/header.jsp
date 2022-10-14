<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <nav class="navbar navbar-expand bg-light fixed-top p-0" id="header-nav">
        <div class="container-fluid">
            <a class="navbar-brand" id="header-name" href="#">hoda</a>
            <form class="d-block ms-4" id="header-search">
                <input class="form-control" id="header-input" type="search" placeholder="Tìm kiếm..."
                       aria-label="Search">
            </form>
            <ul class="navbar-nav ms-auto" id="header-icon">
                <li class="nav-item">
                    <div class="nav-link" data-bs-toggle="dropdown" id="nav-user">
                        <img class="d-block" src="<c:url value='/template/images/Ellipse 20.png' />" width="24px" height="24px" alt="">
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" data-bs-toggle="dropdown" href="#">
                        <img class="d-block" src="<c:url value='/template/images/Ellipse 20.png' />" width="24px" height="24px" alt=""></a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">Link 1</a></li>
                        <li><a class="dropdown-item" href="#">Link 2</a></li>
                        <li><a class="dropdown-item" href="#">Link 3</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
