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

$('.btn-close').click(function () {
    $('#modal-container').addClass('out');
    $('body').removeClass('modal-active');
    $('.icon-plus').removeClass("active");
});

$('.fa-solid.fa-at').click(function () {
    $('.js-example-basic-multiple').removeClass('d-none');
    $('.js-example-basic-multiple').select2({
        maximumSelectionLength: 2
    });
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
            alert("jsdhfkshd");
            window.location.href = "/home";
        },
        error: function () {
            window.location.href = "/home";
        }

    });
    $('#form-addPost').submit();
});