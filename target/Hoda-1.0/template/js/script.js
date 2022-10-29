function showPictures(fileInput) {
    for (var i = 0; i < fileInput.files.length; i++) {
        if (fileInput.files && fileInput.files[i]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.list-image').append(`<div class="image-item">
                                                    <img src="` + e.target.result + `" alt="" class="w-100">
                                                </div>`);
            }
            reader.readAsDataURL(fileInput.files[i]);
        }
    }

}

$('.btn-add-post').click(function () {
    var buttonId = $(this).attr('id');
    $('#modal-container').removeAttr('class').addClass(buttonId);
    $('body').addClass('modal-active');
});

//ẩn modal bottom để show modal update post
$('.btn-updatePost').click(function () {
    window.location.hash = "#bottom-sheet";
    var buttonId = $(this).attr('id');
    $('#modal-container').removeAttr('class').addClass("two");
    $('body').addClass('modal-active');
});

setInterval(function () {
    $('#form-addPost .txt-title').html($('#input-title').val());
}, 2000);


//event update post
//-- add pid to form add post
$('.btn-updatePost').click(function () {
    var pid = $(this).attr('id');
    pid = pid.substring(pid.lastIndexOf("_") + 1);
    $('#form-addPost').append(`<input type='hidden' name='pid' value='${pid}'>`);

    //edit modal add post become update
    $('#form-addPost .head-dialog .person-name').html("Cập nhật bài viết");

    $('#input-title + .emoji-wysiwyg-editor').html($(`#post_${pid} .content-post h6`).html());
    $('#input-content + .emoji-wysiwyg-editor').html($(`#post_${pid} #collapseContent_${pid} .card`).html());
    $('#input-title').val($(`#post_${pid} .content-post h6`).html());
    $('#input-content').val($(`#post_${pid} #collapseContent_${pid} .card`).html());
    
    
    var cateid = $(`.post-category_${pid}`).attr('id');
    cateid = cateid.substring(cateid.lastIndexOf("_") + 1);

    $(`#form-addPost .list-topic input[value=${cateid}]`).prop("checked", true);

    //replace btn Đăng by Btn update
    $('#btn-submit-addPost').remove();
    $('#form-addPost .carousel-content-post .person-info').append(`<div id="btn-submit-updatePost" class="add-post--prev carousel-control-next" type="button">
                                                    Xong
                                                </div>`);
    //UPDATE POST AJAX
    $('#btn-submit-updatePost').click(function (e) {
        e.preventDefault();

        var data = new FormData();
        data = $('#form-addPost').serializeArray();

        var formData = new FormData();
        $.each(data, function (i, v) {
            formData.append("" + v.name + "", v.value);
        });
        for (var i = 0; i < $("#images").get(0).files.length; i++) {
            var varA = $("#images").get(0).files[i];
            formData.append("image" + i, varA);
        }
        console.log(formData.get("title"));
    $.ajax({
        url: "/api-post",
        method: "PUT",
        processData: false,
        mimeType: "multipart/form-data",
        contentType: false,
        data: formData,
        success: function () {
            window.location.href = "/home";
        },
        error: function () {
            window.location.href = "/home";
        }

    });
//    $('#form-addPost').submit();
    });
});


//close modal add post
$('.btn-close').click(function () {
    $('#modal-container').addClass('out');
    $('body').removeClass('modal-active');
    $('.icon-plus').removeClass("active");

//    remove tag input name=pid in form add post
    $('#form-addPost input[name="pid"]').remove();
});

$('.fa-solid.fa-at').click(function () {
    $('.js-example-basic-multiple').removeClass('d-none');
    $('.js-example-basic-multiple').select2({
        maximumSelectionLength: 2
    });
});

$('.menu-post').click(function () {
    var id = $(this).attr("id");
    id = id.substring(id.lastIndexOf("_") + 1);
    console.log(id);
    window.location.hash = "#menu-post_" + id;
});

$('.btn-send').click(function (event) {
    event.preventDefault();
    //        sendComment();
    var id = $(this).attr("id");
    id = id.substring(id.lastIndexOf("_") + 1);
    console.log(id);
    var data = {};
    var formData = $('#form-comment_' + id).serializeArray();
    $.each(formData, function (i, v) {
        data["" + v.name + ""] = v.value;
    });

    console.log(data);

    $.ajax({
        type: "POST",
        url: "/api-comment",
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (data, textStatus, jqXHR) {
//            console.log(data.userModel);
            $('.list-comment').prepend(`<li class="d-flex flex-row comment-1">
                                                        <div class="pe-2">
                                                            <img src="${data.userModel.profileModel.avatar}"
                                                                 class="d-block rounded-circle" alt=""
                                                                 style="height: 30px; width: 30px;">
                                                        </div>
                                                        <div class="d-flex flex-column">
                                                            <div class="user-comment"><b>${data.userModel.profileModel.fullName}</b></div>
                                                            <div class="time-comment">bây giờ</div>
                                                            <div class="content-comment">${data.commentModel.content}</div>
                                                        </div>
                                                    </li>`);
            $('#form-comment_' + id)[0].reset();
        }
    });

});




//ADDPOST AJAX
$('#btn-submit-addPost').click(function (e) {
    e.preventDefault();

    var data = new FormData();
    data = $('#form-addPost').serializeArray();

    var formData = new FormData();
    $.each(data, function (i, v) {
        formData.append("" + v.name + "", v.value);
    });
    for (var i = 0; i < $("#images").get(0).files.length; i++) {
        var varA = $("#images").get(0).files[i];
        formData.append("image" + i, varA);
    }
    $.ajax({
        url: "/api-post",
        method: "POST",
        processData: false,
        mimeType: "multipart/form-data",
        contentType: false,
        data: formData,
        success: function () {
            window.location.href = "/home";
        },
        error: function () {
            window.location.href = "/home";
        }

    });
    $('#form-addPost').submit();
});


//UPDATE INFO AJAX
$('#btn-submitInfo').click(function (e) {
    e.preventDefault();

    var data = new FormData();
    data = $('#form-updateInfo').serializeArray();

    if ($('#inp-avatar').get(0).files.length > 0) {
//        data.append('avatar', $('#inp-avatar').get(0).files[0]);
        data['avatar'] = $('#inp-avatar').get(0).files[0];
    }
    var formData = new FormData();
    $.each(data, function (i, v) {
        formData.append("" + v.name + "", v.value);
    });
    formData.append("avatar", data['avatar']);
    console.log(formData.get("avatar"));
    $.ajax({
        url: "/api-user",
        method: "PUT",
        processData: false,
        mimeType: "multipart/form-data",
        contentType: false,
        data: formData
//        success: function (data) {
//            window.location.href = "/" + data;
//        },
//        error: function (data) {
//            window.location.href = "/" + data;
//        }

    });
    $('#form-updateInfo').submit();
});