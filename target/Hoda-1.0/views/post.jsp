<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<c:url value='/template/css/post.css' />">
    <link rel="stylesheet" href="<c:url value='/template/css/home.css' />">

    <script src="https://use.fontawesome.com/fe459689b4.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <title>HODA | Trang chủ</title>
</head>

<body>
<main id="home">


    <div class="left"></div>
    <div class="center">
        <div id="modal-container">
            <div class="modal-background">
                <div class="modal">
                    <form id="form-addPost" enctype="multipart/form-data">
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel"
                             data-bs-interval="false" data-bs-touch="false">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="dialog-add-post">
                                        <div class="head-dialog">
                                            <div class="person-info d-flex">
                                                <!-- <div class="avatar-person radius-100"></div> -->
                                                <div class="add-post--prev carousel-control-prev d-none" type="button"
                                                     data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                                    <i class="fa-solid fa-arrow-left"></i>
                                                </div>

                                                <div class="person-name w-100 text-center">Thêm bài viết</div>
                                                <div class="add-post--prev carousel-control-next" type="button"
                                                     data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                                    <i class="fa-solid fa-arrow-right"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="main-dialog">
                                            <div class="suggest-title">
                                                <ul>
                                                    <li>Gợi ý 1: Trong câu nên có dấu '?'</li>
                                                    <li>Gợi ý 2: Nên có các từ để hỏi</li>
                                                    <li>Gợi ý 3: Nên trình bày cụ thể về chủ đề bài viết</li>
                                                </ul>
                                            </div>
                                            <div class="text-title emoji-picker-container">
                                                <textarea form="form-addPost" placeholder="Viết tiêu đề... ?" name="title" id="input-title"
                                                          data-emojiable="true" data-emoji-input="unicode"></textarea>
                                                <div class="footer-input-post"></div>
                                            </div>

                                            <!-- <div class="list-topic"> -->
                                            <div class="row list-topic">
                                                <c:forEach items="${requestScope.CATEGORIES}" var="category">
    <!--                        <li class="nav-item"><button class="d-block">${category.getName()}</button></li>-->
                                                    <div class="col box-topic">
                                                        <input type="radio" id="control_${category.getId()}" name="categoryid" value="${category.getId()}">
                                                        <label class="text-nowrap" for="control_${category.getId()}">
                                                            ${category.getName()}
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <!-- </div> -->
                                        </div>
                                        <div class="foot-dialog">
                                            Xem trước
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="dialog-add-post carousel-content-post">
                                        <div class="head-dialog">
                                            <div class="person-info d-flex">
                                                <!-- <div class="avatar-person radius-100" style="background-color: red;"></div> -->
                                                <div class="add-post--prev carousel-control-prev" type="button"
                                                     data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                                    <i class="fa-solid fa-arrow-left"></i>
                                                </div>
                                                <div class="person-name w-100 text-center">Thêm bài viết</div>
                                                <div id="btn-submit-addPost" class="add-post--prev carousel-control-next" type="button">
                                                    Đăng
                                                </div>
                                            </div>
                                        </div>
                                        <div class="main-dialog">
                                            <div class="txt-title" id="title-show">
                                                Title ?
                                            </div>
                                            <div class="text-content emoji-picker-container">
                                                <textarea form="form-addPost" placeholder="Viết nội dung..." style="height: 150px;"
                                                          name="content" id="input-content" data-emojiable="true"
                                                          data-emoji-input="unicode"></textarea>
                                                <div class="footer-input-post d-flex">
                                                    <div class="footer-bottom footer-bottom--left" id="select">
                                                        <select class="js-example-basic-multiple list-acc-tag d-none"
                                                                style="width: 100%" name="states[]" multiple="multiple">
                                                            <option value="AL">Alabama</option>
                                                            <option value="WY">Wyoming</option>

                                                            <option value="AL1">Alabama</option>
                                                            <option value="WY1">Wyoming</option>

                                                            <option value="AL2">Alabama</option>
                                                            <option value="WY3">Wyoming</option>

                                                            <option value="AL4">Alabama</option>
                                                            <option value="WY4">Wyoming</option>
                                                        </select>
                                                    </div>
                                                    <div class="footer-bottom footer-bottom--right">
                                                        <i class="fa-solid fa-at"></i>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="add-image">
                                                <div class="list-image d-flex">

                                                </div>
                                                <div class="btn-add-image">
                                                    <div class="file-upload">
                                                        <input type="file" name="images" id="images" onchange="showPictures(this)" multiple>
                                                        <i class="fa-regular fa-images"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="foot-dialog">
                                            Xem trước
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <input type="hidden" name="userid" value="${sessionScope.account.getId()}">
                    </form>
                </div>
                <div class="btn-close"></div>
            </div>
        </div>



        <div class="container-fluid p-0 ps-2" id="category">
            <h5 class="p-0 pt-2">Thể loại </h5>
            <nav class="navbar navbar-expand p-0">
                <ul class="navbar-nav gap-1 me-auto list-topic d-flex" id="list-category">
                    <c:forEach items="${requestScope.CATEGORIES}" var="category">
    <!--                        <li class="nav-item"><button class="d-block">${category.getName()}</button></li>-->
                        <div class="col box-topic">
                            <input type="radio" id="head_topic_${category.getId()}" name="categoryid" value="${category.getId()}">
                            <label class="text-nowrap" for="head_topic_${category.getId()}">
                                ${category.getName()}
                            </label>
                        </div>
                    </c:forEach>

                </ul>
            </nav>
        </div>
        <div class="list-post">
            <c:forEach items="${requestScope.POSTS}" var="post">
                <div class="post" id="post_${post.getId()}">
                    <div class="header-post">
                        <nav class="navbar navbar-expand ps-2 pe-2 gap-2">
                            <img src="<c:url value='${post.getUserModel().getProfileModel().getAvatar()}' />" class="d-block rounded-circle" alt=""
                                 style="height: 35px; width: 35px;">
                            <div>
                                <h5>${post.getUserModel().getProfileModel().getFullName()}</h5>
                                <p>${post.getCreatedTime()}</p>
                            </div>
                            <div>
                                <h6>Theo dõi</h6>
                                <p></p>
                            </div>
                            <ul class="navbar-nav ms-auto gap-3" id="list-header">
                                <li class="nav-item">
                                    <button class="d-block">
                                        <svg>
                                            <use xlink:href="#icon-star" />
                                        </svg>
                                        <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                            <symbol id="icon-star" viewBox="0 0 576 512"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M287.9 0C297.1 0 305.5 5.25 309.5 13.52L378.1 154.8L531.4 177.5C540.4 178.8 547.8 185.1 550.7 193.7C553.5 202.4 551.2 211.9 544.8 218.2L433.6 328.4L459.9 483.9C461.4 492.9 457.7 502.1 450.2 507.4C442.8 512.7 432.1 513.4 424.9 509.1L287.9 435.9L150.1 509.1C142.9 513.4 133.1 512.7 125.6 507.4C118.2 502.1 114.5 492.9 115.1 483.9L142.2 328.4L31.11 218.2C24.65 211.9 22.36 202.4 25.2 193.7C28.03 185.1 35.5 178.8 44.49 177.5L197.7 154.8L266.3 13.52C270.4 5.249 278.7 0 287.9 0L287.9 0zM287.9 78.95L235.4 187.2C231.9 194.3 225.1 199.3 217.3 200.5L98.98 217.9L184.9 303C190.4 308.5 192.9 316.4 191.6 324.1L171.4 443.7L276.6 387.5C283.7 383.7 292.2 383.7 299.2 387.5L404.4 443.7L384.2 324.1C382.9 316.4 385.5 308.5 391 303L476.9 217.9L358.6 200.5C350.7 199.3 343.9 194.3 340.5 187.2L287.9 78.95z" />
                                            </symbol>
                                        </svg>
                                    </button>
                                </li>

                                <li class="nav-item">
                                    <button class="d-block menu-post" id="menu-list_${post.getId()}">
                                        <svg>
                                            <use xlink:href="#icon-ellipsis" />
                                        </svg>
                                        <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                            <symbol id="icon-ellipsis" viewBox="0 0 448 512"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M120 256c0 30.9-25.1 56-56 56s-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56zm160 0c0 30.9-25.1 56-56 56s-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56zm104 56c-30.9 0-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56s-25.1 56-56 56z" />
                                            </symbol>

                                        </svg>
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- BOOTOM SHEET MODAL -->
                    <div id="menu-post_${post.getId()}" tabindex="-1" class="overlay">
                        <aside class="social" role="dialog" aria-labelledby="modal-label" aria-hidden="true">
                            <a href="#" class="btn-close" aria-hidden="true"><span class="mdi mdi-close"></span><span
                                    class="sr-only">Close</span></a>
                            <ul class="list-group list-group-flush">
                                <c:if test="${sessionScope.account.getId() == post.getUserid()}">
                                    <div class="list-group-item btn btn-updatePost" id="btn-updatePost_${post.getId()}">Chỉnh sửa bài viết</div>
                                    <div class="list-group-item btn text-danger">Xóa bài viết</div>
                                </c:if>
                                <c:if test="${sessionScope.account.getId() != post.getUserid()}">
                                    <div class="list-group-item btn">Ẩn bài viết này</div>
                                    <div class="list-group-item btn">Chặn bài viết từ người dùng này</div>
                                    <div class="list-group-item btn text-danger">Báo cáo</div>
                                </c:if>


                            </ul>

                        </aside>

                    </div>
                    <div class="content-post p-2">
                        <div class="post-category post-category_${post.getId()}" id="post-category_${post.getCategoryid()}">
                            ${post.getCategoryModel().getName()}
                        </div>
                        <h6>${post.getTitle()}</h6>
                        <p>
                            <a data-bs-toggle="collapse" href="#collapseContent_${post.getId()}" aria-expanded="false"
                               aria-controls="collapseContent_${post.getId()}">
                                Xem thêm
                            </a>
                        </p>
                        <div class="collapse" id="collapseContent_${post.getId()}">
                            <div class="card card-body" style="width:100%; margin: 0; padding: 0; border: 0;">
                                ${post.getContent()}
                            </div>
                        </div>
                    </div>
                    <div class="image-post">
                        <c:if test="${not empty post.getImageModels()}">
                            <div id="carouselImagePost_${post.getId()}" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                <c:if test="${post.getImageModels().size() > 1}">
                                    <div class="carousel-indicators">
                                        <c:forEach items="${post.getImageModels()}" var="imgPost" varStatus="loop">
                                            <button type="button" data-bs-target="#carouselImagePost_${post.getId()}" data-bs-slide-to="${loop.index}" class="<c:if test="${loop.index == 1}">active</c:if>" aria-current="true" aria-label="Slide 1"></button>
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <div class="carousel-inner">
                                    <c:forEach items="${post.getImageModels()}" var="imgPost" varStatus="loop">
                                        <div class="carousel-item <c:if test="${loop.index == 0}">active</c:if>" data-bs-interval="10000">
                                            <img src="${imgPost.getUrl()}" class="d-block w-100" alt="...">
                                        </div>
                                    </c:forEach>
                                </div>
                                <c:if test="${post.getImageModels().size() > 1}">
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselImagePost_${post.getId()}"" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselImagePost_${post.getId()}"" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                    <div class="interact-post d-flex flex-row p-2">
                        <div class="d-flex justify-content-start">
                            <button class="btn-like d-block pe-2" id="btn-like_id_${post.getId()}" onclick="like(${post.getId()})">
                                <span class="material-symbols-outlined">
                                    thumb_up_off
                                </span>
                            </button>
                            <p class="pe-3">95</p>
                            <button class="btn-dislike d-block pe-2" id="btn-dislike_id_${post.getId()}" onclick="dislike(${post.getId()})">
                                <span class="material-symbols-outlined">
                                    thumb_down
                                </span>
                            </button>
                            <p class="pe-3">28</p>
                            <button class="btn-comment d-block pe-2" id="btn-comment_id_${post.getId()}" onclick="openComment(${post.getId()})" data-bs-toggle="modal" data-bs-target="#modalComment_pid_${post.getId()}">
                                <span class="material-symbols-outlined">
                                    chat_bubble
                                </span>
                            </button>
                            <p class="pe-3">8</p>
                        </div>

                    </div>

                    <div class="footer-post d-flex flex-row p-2">
                        <div class="d-flex justify-content-start">
                            <img src="<c:url value='${sessionScope.account.getProfileModel().getAvatar()}' />" class="d-block rounded-circle" alt="" style="height: 28px; width: 28px;">
                            <input class="add-comment ps-2" type="text" placeholder="Thêm bình luận..." data-bs-toggle="modal" data-bs-target="#modalComment_pid_${post.getId()}">
                        </div>
                        <div class="d-flex ms-auto gap-4">
                            <button class="d-block">
                                <svg><use xlink:href="#icon-emoji"/></svg>
                                <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                    <symbol id="icon-emoji" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M256 352C293.2 352 319.2 334.5 334.4 318.1C343.3 308.4 358.5 307.7 368.3 316.7C378 325.7 378.6 340.9 369.6 350.6C347.7 374.5 309.7 400 256 400C202.3 400 164.3 374.5 142.4 350.6C133.4 340.9 133.1 325.7 143.7 316.7C153.5 307.7 168.7 308.4 177.6 318.1C192.8 334.5 218.8 352 256 352zM208.4 208C208.4 225.7 194 240 176.4 240C158.7 240 144.4 225.7 144.4 208C144.4 190.3 158.7 176 176.4 176C194 176 208.4 190.3 208.4 208zM281.9 230.6C273.9 223 273.5 210.4 281 202.3C295.6 186.8 316.3 180 335.6 180C354.1 180 375.7 186.8 390.2 202.3C397.8 210.4 397.4 223 389.3 230.6C381.2 238.1 368.6 237.7 361 229.7C355.6 223.8 346.3 220 335.6 220C324.1 220 315.7 223.8 310.2 229.7C302.7 237.7 290 238.1 281.9 230.6zM512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256zM256 48C141.1 48 48 141.1 48 256C48 370.9 141.1 464 256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48z" />
                                    </symbol>
                                </svg>
                            </button>
                            <button class="d-block">
                                <svg><use xlink:href="#icon-send"/></svg>
                                <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                    <symbol id="icon-send" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M501.6 4.186c-7.594-5.156-17.41-5.594-25.44-1.063L12.12 267.1C4.184 271.7-.5037 280.3 .0431 289.4c.5469 9.125 6.234 17.16 14.66 20.69l153.3 64.38v113.5c0 8.781 4.797 16.84 12.5 21.06C184.1 511 188 512 191.1 512c4.516 0 9.038-1.281 12.99-3.812l111.2-71.46l98.56 41.4c2.984 1.25 6.141 1.875 9.297 1.875c4.078 0 8.141-1.031 11.78-3.094c6.453-3.625 10.88-10.06 11.95-17.38l64-432C513.1 18.44 509.1 9.373 501.6 4.186zM369.3 119.2l-187.1 208.9L78.23 284.7L369.3 119.2zM215.1 444v-49.36l46.45 19.51L215.1 444zM404.8 421.9l-176.6-74.19l224.6-249.5L404.8 421.9z" />
                                    </symbol>

                                </svg>
                            </button>
                        </div>
                        <div id="modalComment_pid_${post.getId()}" class="modal fade" role="dialog" tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered mx-auto p-0">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5>Bình luận</h5>
                                        <button type="button" class="btn-close d-block" id="btn-close_id_${post.getId()}" data-bs-dismiss="modal" onclick="closeComment(${post.getId()})"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="comment-post">
                                            <ul class="list-comment p-0 m-0">
                                                <c:forEach items="${post.getInteractModels()}" var="interact" varStatus="loop">
                                                    <li class="d-flex flex-row comment-1">
                                                        <div class="pe-2">
                                                            <img src="<c:url value='${interact.getUserModel().getProfileModel().getAvatar()}' />"
                                                                 class="d-block rounded-circle" alt=""
                                                                 style="height: 30px; width: 30px;">
                                                        </div>
                                                        <div class="d-flex flex-column" id="comment_${interact.getId()}_${post.getId()}_${interact.getUserId()}">
                                                            <!--${sessionScope.account.getProfileModel().getFullName()}-->
                                                            <div class="user-comment"><b>${interact.getUserModel().getProfileModel().getFullName()}</b></div>
                                                            <div class="time-comment">${interact.getCommentModel().getCreatedTime()}</div>
                                                            <div class="content-comment" onclick="sendCommentToInput(${interact.getId()},${post.getId()},${interact.getUserId()},${sessionScope.account.getId()})">${interact.getCommentModel().getContent()}</div>
                                                            
                                                            
                                                            
                                                        </div>


                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <nav class="navbar navbar-expand p-2">
                                            <img src="<c:url value='/template/images/Ellipse 20.png' />" class="d-block rounded-circle" alt=""
                                                 style="height: 28px; width: 28px;">
                                            <form id="form-comment_${post.getId()}">
                                                <input class="add-comment" id="content-comment_id_${post.getId()}" name="content" type="text" value=""
                                                       placeholder="Thêm bình luận...">
                                                <input type="hidden" name="pid" value="${post.getId()}">
                                                <input type="hidden" name="uid" value="${sessionScope.account.getId()}">
                                            </form>
                                            <ul class="navbar-nav ms-auto gap-4">
                                                <li class="nav-item">
                                                    <button class="d-block">
                                                        <svg>
                                                            <use xlink:href="#icon-emoji" />
                                                        </svg>
                                                        <svg style="display: none;" xmlns="http://www.w3.org/2000/svg"
                                                             version="1.1">
                                                            <symbol id="icon-emoji" viewBox="0 0 512 512"
                                                                    xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M256 352C293.2 352 319.2 334.5 334.4 318.1C343.3 308.4 358.5 307.7 368.3 316.7C378 325.7 378.6 340.9 369.6 350.6C347.7 374.5 309.7 400 256 400C202.3 400 164.3 374.5 142.4 350.6C133.4 340.9 133.1 325.7 143.7 316.7C153.5 307.7 168.7 308.4 177.6 318.1C192.8 334.5 218.8 352 256 352zM208.4 208C208.4 225.7 194 240 176.4 240C158.7 240 144.4 225.7 144.4 208C144.4 190.3 158.7 176 176.4 176C194 176 208.4 190.3 208.4 208zM281.9 230.6C273.9 223 273.5 210.4 281 202.3C295.6 186.8 316.3 180 335.6 180C354.1 180 375.7 186.8 390.2 202.3C397.8 210.4 397.4 223 389.3 230.6C381.2 238.1 368.6 237.7 361 229.7C355.6 223.8 346.3 220 335.6 220C324.1 220 315.7 223.8 310.2 229.7C302.7 237.7 290 238.1 281.9 230.6zM512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256zM256 48C141.1 48 48 141.1 48 256C48 370.9 141.1 464 256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48z" />
                                                            </symbol>
                                                        </svg>
                                                    </button>
                                                </li>

                                                <li class="nav-item pe-2">
                                                    <button class="d-block btn-send" id="btn-send_${post.getId()}">
                                                        <svg>
                                                            <use xlink:href="#icon-send" />
                                                        </svg>
                                                        <svg style="display: none;" xmlns="http://www.w3.org/2000/svg"
                                                             version="1.1">
                                                            <symbol id="icon-send" viewBox="0 0 512 512"
                                                                    xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M501.6 4.186c-7.594-5.156-17.41-5.594-25.44-1.063L12.12 267.1C4.184 271.7-.5037 280.3 .0431 289.4c.5469 9.125 6.234 17.16 14.66 20.69l153.3 64.38v113.5c0 8.781 4.797 16.84 12.5 21.06C184.1 511 188 512 191.1 512c4.516 0 9.038-1.281 12.99-3.812l111.2-71.46l98.56 41.4c2.984 1.25 6.141 1.875 9.297 1.875c4.078 0 8.141-1.031 11.78-3.094c6.453-3.625 10.88-10.06 11.95-17.38l64-432C513.1 18.44 509.1 9.373 501.6 4.186zM369.3 119.2l-187.1 208.9L78.23 284.7L369.3 119.2zM215.1 444v-49.36l46.45 19.51L215.1 444zM404.8 421.9l-176.6-74.19l224.6-249.5L404.8 421.9z" />
                                                            </symbol>

                                                        </svg>
                                                    </button>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

    <div class="right"></div>
</main>


</body>

</html>
