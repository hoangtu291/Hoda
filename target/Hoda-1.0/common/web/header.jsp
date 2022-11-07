<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <nav class="navbar navbar-expand fixed-top p-0" id="header-nav">
        <div class="container-fluid">
            <a class="navbar-brand" id="header-name" href="#">hoda</a>
            <form class="d-block" id="header-search">
                <input class="form-control" id="header-input" type="search" placeholder="Tìm kiếm..." aria-label="Search" >
            </form>
            <c:if test="${not empty sessionScope.account}">
                <ul class="navbar-nav ms-auto" id="header-icon">
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-bs-toggle="dropdown" id="nav-user">
                            <img class="d-block radius-100" src="${sessionScope.account.getProfileModel().getAvatar()}" width="30px" height="30px" alt="">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/personal?id=${sessionScope.account.getId()}">Thông tin cá nhân</a></li>
                            <li><a class="dropdown-item text-danger" href="/logout?action=logout">Đăng xuất</a></li>
                        </ul>
                    </li>

                </ul>

            </c:if>
            <c:if test="${empty sessionScope.account}">
                <a href="/register">
                    <div class="btn-login">
                        Đăng nhập
                    </div>
                </a>
            </c:if>
        </div>
    </nav>
</header>
