<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script>
            var request;
            function sendInfo() {
                var varA = $("#image").get(0).files[0];
                var url = "/register";
                var formData = new FormData();
                formData.append("image", varA);

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfo;

                    request.open("POST", url, true);
                    request.send(formData);
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

        <h1>Hello World!</h1>

        <form name="test" id="form" enctype="multipart/form-data">
            <input type="file" name="image" id="image" onchange="sendInfo()"> 

            <input type="button" value="upload">
        </form>

        <span id="status"></span>

        <span id="ketqua"> </span>

        <!--<textarea rows="5" id="editor"></textarea>-->
<!--        <div id="editor" style="border: 1px solid; margin-top: 20px;">
        </div>-->

        <img src="" id="rs-image">
<!--        <script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/balloon-block/ckeditor.js"></script>
        <script>
                BalloonEditor
                        .create(document.querySelector('#editor'))
                        .catch(error => {
                            console.log("error");
                        });
        </script>-->
    </body>
</html>
