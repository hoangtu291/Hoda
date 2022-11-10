<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer>
    <nav class="navbar navbar-expand fixed-bottom p-0" id="footer-nav">
        <div class="container-fluid" id="tabbar" style="height: 100%">
            <ul class="navbar-nav" id="footer-icon">
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <a href="/home">
                        <button class="btn-home d-block">
                            <i class="bi bi-house-door"></i>
                        </button>
                    </a>
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <c:if test="${not empty sessionScope.account}">
                        <a href="#">
                            <button class="btn-people d-block">
                                <i class="bi bi-people"></i>
                            </button>
                        </a>
                    </c:if>
                    <c:if test="${empty sessionScope.account}">
                        <a href="/register">
                            <button class="btn-people d-block">
                                <i class="bi bi-people"></i>
                            </button>
                        </a>
                    </c:if>
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <c:if test="${not empty sessionScope.account}">
                        <button class="btn-add-post d-block" id="two">
                            <i class="bi bi-plus-circle"></i>
                        </button>        
                    </c:if>

                    <c:if test="${empty sessionScope.account}">
                        <a href="/register">
                            <button class="btn-add-post d-block" id="two">
                                <i class="bi bi-plus-circle"></i>
                            </button>        
                        </a>
                    </c:if>
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <c:if test="${not empty sessionScope.account}">
                        <a href="/notification">
                            <button id="nav-Notification" class="btn-notification d-block position-relative ">
                                
                                <i class="bi bi-bell"></i>
                            </button>
                        </a>
                    </c:if>

                    <c:if test="${empty sessionScope.account}">
                        <a href="/register">
                            <button class="btn-notification d-block position-relative">
                            
                            <i class="bi bi-bell"></i>
                            </button>
                        </a>
                    </c:if>
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <a href="/setting">
                        <button class="btn-setting d-block">
                            <i class="bi bi-gear"></i>
                        </button>
                    </a>
                </li>            
            </ul>
        </div>
    </nav>
    <script>
        function changeColorIcon() {
            console.log(document.querySelector('#footer-icon'));
//    if (document.querySelector('#' + 'btn-like_id_' + pid).classList.contains('green')) {
//        document.querySelector('#' + 'btn-like_id_' + pid).classList.remove('green');
//
//    } else {
//        if (document.querySelector('#' + 'btn-dislike_id_' + pid).classList.contains('green')) {
//            document.querySelector('#' + 'btn-dislike_id_' + pid).classList.remove('green');
//        }
//        document.querySelector('#' + 'btn-like_id_' + pid).classList.toggle('green');
//
//    }
        }
    </script>
</footer>