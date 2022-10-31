<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script>
            var request;
            function sendInfo() {
                var url = "/register";
                var data = {};
                for (var i = 0; i < $("#image").get(0).files.length; i++) {
                    var varA = $("#image").get(0).files[i];
                    data['image' + i] = varA;
                }
                console.log(JSON.stringify(data));

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfo;

                    request.open("POST", url, true);
                    request.send(JSON.stringify(data));
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState === 4) {
                    var val = request.responseText;
                    document.getElementById('ketqua').innerHTML = val;
                    $('#rs-image').attr('src', val);
                }
            }
        </script>


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
    <h1>Hello World!</h1>

    <form name="test" id="form" enctype="multipart/form-data" method="POST">
        <input type="file" name="image" id="image" multiple> 

        <input type="button" value="upload" id="btn-submit" onclick="sendInfo()">
    </form>

    <span id="status"></span>

    <span id="ketqua"> </span>

    <textarea rows="5" id="editor"></textarea>
                <div id="editor" style="border: 1px solid; margin-top: 20px; height: 40px">
                </div>

    <img src="" id="rs-image">
    <script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/balloon-block/ckeditor.js"></script>
    <script>
            BalloonEditor
                    .create(document.querySelector('#editor'))
                    .catch(error => {
                        console.log("error");
                    });
    </script>

    <script>
        $('#btn-submit').click(function (e) {
            e.preventDefault();
//                var data = {};
//                console.log($("#image").get(0).files.length);


            for (var i = 0; i < $("#image").get(0).files.length; i++) {
                var varA = $("#image").get(0).files[i];
                var formData = new FormData();
                formData.append("image", varA);
            }

//                for (var item in $('#form #image').prop("files")) {
//                    data["image"] = item.name;
//                }

            $.ajax({
                url: "/api-post",
                method: "POST",
                processData: false,
                contentType: 'multipart/form-data',
                data: formData,
                dataType: 'json'

            });
            $('#form').submit();
        });

    </script>
</body>
</html>
