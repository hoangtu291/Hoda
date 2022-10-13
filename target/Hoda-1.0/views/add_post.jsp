<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css">
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.min.css"/> -->

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link href="../template/lib/css/emoji.css" rel="stylesheet">
        <link rel="stylesheet" href="../template/css/style.css">

        <link
            href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />


        <title>Dialog</title>
    </head>

    <body>
        <header></header>
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

            <h2>Xin chào ${sessionScope.account.getProfileModel().getFullName()}</h2>
            <div class="content">
                <h1>Modal Animations</h1>
                <div class="buttons">
                    <c:if test="${empty sessionScope.account}">
                        <a href="/register"><div id="two" class="btn-add-post">Revealing</div></a>
                    </c:if>
                    <c:if test="${not empty sessionScope.account}">
                        <div id="two" class="btn-add-post">Revealing</div>
                    </c:if>
                </div>
            </div>

            <h2>Danh sách bài viết</h2>

            <table class="table table-striped">
                <thead>
                <th width="100px">Avatar</th>
                <th>FullName</th>
                <th>Post</th>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.POSTS}" var="post">
                        <tr>
                            <td><img class="w-100" src="${post.getUserModel().getProfileModel().getAvatar()}"></td>
                            <td><b>${post.getUserModel().getProfileModel().getFullName()}</b></td>
                            <td>
                                <h3>${post.getTitle()}</h3>
                                <p>${post.getContent()}</p>
                                <div class="list-img-post d-flex">
                                    <c:forEach items="${post.getImageModels()}" var="imgPost">
                                        <img src="${imgPost.getUrl()}" style="width: 70px;">
                                    </c:forEach>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
        <footer></footer>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.min.js"></script>
        <script src="../template/js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>


        <script>
                                                            $('.btn-add-post').click(function () {
                                                                var buttonId = $(this).attr('id');
                                                                $('#modal-container').removeAttr('class').addClass(buttonId);
                                                                $('body').addClass('modal-active');
                                                            });

                                                            $('.fa-solid.fa-at').click(function () {
                                                                $('.js-example-basic-multiple').removeClass('d-none');
                                                                $('.js-example-basic-multiple').select2({
                                                                    maximumSelectionLength: 2
                                                                });
                                                            });



                                                            //show selected pictures
                                                            function showPictures(fileInput) {
                                                                for (var i = 0; i < fileInput.files.length; i++) {
                                                                    if (fileInput.files && fileInput.files[i]) {
                                                                        var reader = new FileReader();
                                                                        reader.onload = function (e) {
                                                                            $('.list-image').append(`<div class="image-item">
                                                        <img src="${e.target.result}" alt="" class="w-100">
                                                    </div>`);
                                                                        }
                                                                        reader.readAsDataURL(fileInput.files[i]);
                                                                    }
                                                                }

                                                            }


        </script>


        <script src="../template/lib/js/config.min.js"></script>
        <script src="../template/lib/js/util.min.js"></script>
        <script src="../template/lib/js/jquery.emojiarea.min.js"></script>
        <script src="../template/lib/js/emoji-picker.min.js"></script>

        <script>
                                                            $(function () {

                                                                window.emojiPicker = new EmojiPicker({
                                                                    emojiable_selector: '[data-emojiable=true]',
                                                                    assetsPath: './lib/img/',
                                                                    popupButtonClasses: 'fa-regular fa-face-smile-wink'
                                                                });
                                                                window.emojiPicker.discover()
                                                            });
        </script>
    </body>

</html>