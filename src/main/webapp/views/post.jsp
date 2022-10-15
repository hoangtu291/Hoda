<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Homepage</title>
</head>

<body>
<main>
    <div id="modal-container">
        <div class="modal-background">
            <div class="modal">
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
                                        <textarea placeholder="Viết tiêu đề... ?" name="title" id="input-title"
                                                  data-emojiable="true" data-emoji-input="unicode"></textarea>
                                        <div class="footer-input-post"></div>
                                    </div>

                                    <!-- <div class="list-topic"> -->
                                    <form action="">
                                        <div class="row list-topic">
                                        </div>
                                    </form>
                                    <!-- </div> -->
                                </div>
                                <div class="foot-dialog">
                                    Xem trước
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="dialog-add-post">
                                <div class="head-dialog">
                                    <div class="person-info d-flex">
                                        <!-- <div class="avatar-person radius-100" style="background-color: red;"></div> -->
                                        <div class="add-post--prev carousel-control-prev" type="button"
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
                                    <div class="txt-title">
                                        Title ?
                                    </div>
                                    <div class="text-content emoji-picker-container">
                                        <textarea placeholder="Viết nội dung..." style="height: 150px;"
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

            </div>
        </div>
    </div>

    <div class="left"></div>
    <div class="center">
        <div class="container-fluid p-0 ps-2" id="category">
            <h5 class="p-0 pt-2">Thể loại</h5>
            <nav class="navbar navbar-expand p-0">
                <ul class="navbar-nav gap-1 me-auto" id="list-category">
                    <li class="nav-item"><button class="d-block">Tất cả</button></li>
                    <li class="nav-item"><button class="d-block">Chủ đề 1</button></li>
                    <li class="nav-item"><button class="d-block">Chủ đề 2</button></li>
                    <li class="nav-item"><button class="d-block">Chủ đề 3</button></li>
                    <li class="nav-item"><button class="d-block">Chủ đề 4</button></li>
                    <li class="nav-item"><button class="d-block">Chủ đề 5</button></li>
                </ul>
            </nav>
        </div>
        <div class="list-post">
            <c:forEach items="${requestScope.POSTS}" var="post">
                <div class="post">
                    <div class="header-post">
                        <nav class="navbar navbar-expand ps-2 pe-2 gap-2">
                            <img src="<c:url value='${post.getUserModel().getProfileModel().getAvatar()}' />" class="d-block rounded-circle" alt=""
                                 style="height: 44px; width: 44px;">
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
                                    <button class="d-block">
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
                    <div class="content-post p-2">
                        <h6>${post.getTitle()}</h6>
                        <p>
                            ${post.getContent()}
                            <a data-bs-toggle="collapse" href="#collapseExample" aria-expanded="false"
                               aria-controls="collapseExample">
                                Xem thêm
                            </a>
                        </p>
                        <div class="collapse" id="collapseExample">
                            <div class="card card-body" style="width:100%; margin: 0; padding: 0; border: 0;">
                                Some placeholder content for the collapse component. This panel is hidden by default but
                                revealed when the user activates the relevant trigger.
                            </div>
                        </div>
                    </div>
                    <div class="image-post">
                        <div id="carouselImagePost_${post.getId()}" class="carousel carousel-dark slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <c:forEach items="${post.getImageModels()}" var="imgPost" varStatus="loop">
                                    <button type="button" data-bs-target="#carouselImagePost_${post.getId()}" data-bs-slide-to="${loop.index}" class="<c:if test="${loop.index == 1}">active</c:if>" aria-current="true" aria-label="Slide 1"></button>
                                </c:forEach>
                            </div>
                            <div class="carousel-inner">
                                <c:forEach items="${post.getImageModels()}" var="imgPost" varStatus="loop">
                                    <div class="carousel-item <c:if test="${loop.index == 1}">active</c:if>" data-bs-interval="10000">
                                        <img src="${imgPost.getUrl()}" class="d-block w-100" alt="...">
                                    </div>
                                </c:forEach>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselImagePost_${post.getId()}"" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselImagePost_${post.getId()}"" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class="interact-post d-flex flex-row p-2">
                        <div class="d-flex justify-content-start">
                            <button class="d-block pe-2">
                                <svg>
                                    <use xlink:href="#icon-thumbs-up" />
                                </svg>
                                <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                    <symbol id="icon-thumbs-up" viewBox="0 0 512 512"
                                            xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M96 191.1H32c-17.67 0-32 14.33-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64c17.67 0 32-14.33 32-31.1V223.1C128 206.3 113.7 191.1 96 191.1zM512 227c0-36.89-30.05-66.92-66.97-66.92h-99.86C354.7 135.1 360 113.5 360 100.8c0-33.8-26.2-68.78-70.06-68.78c-46.61 0-59.36 32.44-69.61 58.5c-31.66 80.5-60.33 66.39-60.33 93.47c0 12.84 10.36 23.99 24.02 23.99c5.256 0 10.55-1.721 14.97-5.26c76.76-61.37 57.97-122.7 90.95-122.7c16.08 0 22.06 12.75 22.06 20.79c0 7.404-7.594 39.55-25.55 71.59c-2.046 3.646-3.066 7.686-3.066 11.72c0 13.92 11.43 23.1 24 23.1h137.6C455.5 208.1 464 216.6 464 227c0 9.809-7.766 18.03-17.67 18.71c-12.66 .8593-22.36 11.4-22.36 23.94c0 15.47 11.39 15.95 11.39 28.91c0 25.37-35.03 12.34-35.03 42.15c0 11.22 6.392 13.03 6.392 22.25c0 22.66-29.77 13.76-29.77 40.64c0 4.515 1.11 5.961 1.11 9.456c0 10.45-8.516 18.95-18.97 18.95h-52.53c-25.62 0-51.02-8.466-71.5-23.81l-36.66-27.51c-4.315-3.245-9.37-4.811-14.38-4.811c-13.85 0-24.03 11.38-24.03 24.04c0 7.287 3.312 14.42 9.596 19.13l36.67 27.52C235 468.1 270.6 480 306.6 480h52.53c35.33 0 64.36-27.49 66.8-62.2c17.77-12.23 28.83-32.51 28.83-54.83c0-3.046-.2187-6.107-.6406-9.122c17.84-12.15 29.28-32.58 29.28-55.28c0-5.311-.6406-10.54-1.875-15.64C499.9 270.1 512 250.2 512 227z" />
                                    </symbol>
                                </svg>
                            </button>
                            <p class="pe-3">95</p>
                            <button class="d-block pe-2">
                                <svg>
                                    <use xlink:href="#icon-thumbs-down" />
                                </svg>
                                <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                    <symbol id="icon-thumbs-down" viewBox="0 0 512 512"
                                            xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M128 288V64.03c0-17.67-14.33-31.1-32-31.1H32c-17.67 0-32 14.33-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64C113.7 320 128 305.7 128 288zM481.5 229.1c1.234-5.092 1.875-10.32 1.875-15.64c0-22.7-11.44-43.13-29.28-55.28c.4219-3.015 .6406-6.076 .6406-9.122c0-22.32-11.06-42.6-28.83-54.83c-2.438-34.71-31.47-62.2-66.8-62.2h-52.53c-35.94 0-71.55 11.87-100.3 33.41L169.6 92.93c-6.285 4.71-9.596 11.85-9.596 19.13c0 12.76 10.29 24.04 24.03 24.04c5.013 0 10.07-1.565 14.38-4.811l36.66-27.51c20.48-15.34 45.88-23.81 71.5-23.81h52.53c10.45 0 18.97 8.497 18.97 18.95c0 3.5-1.11 4.94-1.11 9.456c0 26.97 29.77 17.91 29.77 40.64c0 9.254-6.392 10.96-6.392 22.25c0 13.97 10.85 21.95 19.58 23.59c8.953 1.671 15.45 9.481 15.45 18.56c0 13.04-11.39 13.37-11.39 28.91c0 12.54 9.702 23.08 22.36 23.94C456.2 266.1 464 275.2 464 284.1c0 10.43-8.516 18.93-18.97 18.93H307.4c-12.44 0-24 10.02-24 23.1c0 4.038 1.02 8.078 3.066 11.72C304.4 371.7 312 403.8 312 411.2c0 8.044-5.984 20.79-22.06 20.79c-12.53 0-14.27-.9059-24.94-28.07c-24.75-62.91-61.74-99.9-80.98-99.9c-13.8 0-24.02 11.27-24.02 23.99c0 7.041 3.083 14.02 9.016 18.76C238.1 402 211.4 480 289.9 480C333.8 480 360 445 360 411.2c0-12.7-5.328-35.21-14.83-59.33h99.86C481.1 351.9 512 321.9 512 284.1C512 261.8 499.9 241 481.5 229.1z" />
                                    </symbol>
                                </svg>
                            </button>
                            <p class="pe-3">28</p>
                            <button class="d-block pe-2">
                                <svg>
                                    <use xlink:href="#icon-message" />
                                </svg>
                                <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                    <symbol id="icon-message" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M447.1 0h-384c-35.25 0-64 28.75-64 63.1v287.1c0 35.25 28.75 63.1 64 63.1h96v83.98c0 9.836 11.02 15.55 19.12 9.7l124.9-93.68h144c35.25 0 64-28.75 64-63.1V63.1C511.1 28.75 483.2 0 447.1 0zM464 352c0 8.75-7.25 16-16 16h-160l-80 60v-60H64c-8.75 0-16-7.25-16-16V64c0-8.75 7.25-16 16-16h384c8.75 0 16 7.25 16 16V352z" />
                                    </symbol>
                                </svg>
                            </button>
                            <p class="pe-3">8</p>
                        </div>
                        <div class="d-flex ms-auto">

                            <button class="d-block pe-2">
                                <svg>
                                    <use xlink:href="#icon-share" />
                                </svg>
                                <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                    <symbol id="icon-share" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M307 34.8c-11.5 5.1-19 16.6-19 29.2v64H176C78.8 128 0 206.8 0 304C0 417.3 81.5 467.9 100.2 478.1c2.5 1.4 5.3 1.9 8.1 1.9c10.9 0 19.7-8.9 19.7-19.7c0-7.5-4.3-14.4-9.8-19.5C108.8 431.9 96 414.4 96 384c0-53 43-96 96-96h96v64c0 12.6 7.4 24.1 19 29.2s25 3 34.4-5.4l160-144c6.7-6.1 10.6-14.7 10.6-23.8s-3.8-17.7-10.6-23.8l-160-144c-9.4-8.5-22.9-10.6-34.4-5.4z" />
                                    </symbol>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="footer-post d-flex flex-row p-2">
                        <div class="d-flex justify-content-start">
                            <img src="<c:url value='/template/images/Ellipse 20.png' />" class="d-block rounded-circle" alt="" style="height: 28px; width: 28px;">
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
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5>Bình luận</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="comment-post">
                                            <ul class="list-comment p-0 m-0">
                                                <c:forEach items="${post.getInteractModels()}" var="interact" varStatus="loop">
                                                    <li class="d-flex flex-row comment-1">
                                                        <div class="pe-2">
                                                            <img src="<c:url value='/template/images/Ellipse 20.png' />"
                                                                 class="d-block rounded-circle" alt=""
                                                                 style="height: 30px; width: 30px;">
                                                        </div>
                                                        <div class="d-flex flex-column">
                                                            <!--${sessionScope.account.getProfileModel().getFullName()}-->
                                                            <div class="user-comment"><b>Nguoi dung ${interact.getUserId()}</b></div>
                                                            <div class="time-comment">${interact.getCommentModel().getCreatedTime()}</div>
                                                            <div class="content-comment">${interact.getCommentModel().getContent()}</div>
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
                                                <input class="add-comment" name="content" type="text" value=""
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
