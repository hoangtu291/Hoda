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
        
        <script>
            var request;
            function sendInfo() {

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfo;

                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState === 4) {
                    var val = request.responseText;
                    ddocument.getElementById('status').innerHTML =val;
                    
                }
            }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <h1>Hello World!</h1>

        <script src="https://accounts.google.com/gsi/client" async defer></script>
        <div id="g_id_onload"
             data-client_id="323016078986-jhofv2p55ps84etahaaj6g0uvo4dhd1u.apps.googleusercontent.com"
             data-auto_prompt="true"
             data-callback="handleCredentialResponse">
        </div>
        <div class="g_id_signin"
             data-type="standard"
             data-size="large"
             data-theme="outline"
             data-text="continue_with"
             data-shape="rectangular"
             data-logo_alignment="left">
        </div>


    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" data-width="" data-size="large" data-button-type="continue_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="true">
    </fb:login-button>



    <div id="status">
    </div>

    <table class="table table-dark table-striped">
        <thead>
            <th width="100px">Avatar</th>
            <th>FullName</th>
            <th>Email</th>
            <th>Login Type</th>
            <th>Created Date</th>
        </thead>
    <tbody>
        <c:forEach items="${requestScope.USERS}" var="user">
        
            <tr>
                <td><img class="w-100" src="${user.getProfileModel().getAvatar()}"></td>
                <td><b>${user.getProfileModel().getFullName()}</b></td>
                <td>${user.getProfileModel().getEmail()}</td>
                <td>${user.getLoginTypeModel().getName()}</td>
                <td>${user.getCreatedTime()}</td>
            </tr>
        </c:forEach>
</tbody>
</table>

<script>

    function parseJwt(token) {
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        var jsonPayload = decodeURIComponent(window.atob(base64).split('').map(function (c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));

        return JSON.parse(jsonPayload);
    }
    ;
    function handleCredentialResponse(response) {
        console.log(response);
        const responsePayload = parseJwt(response.credential);
        login(responsePayload, "google");

    }
</script>

<script>

    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        console.log('statusChangeCallback');
        console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        } else {                                 // Not logged into your webpage or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into this webpage.';
        }
    }


    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function (response) {   // See the onlogin handler
            statusChangeCallback(response);
        });
    }


    window.fbAsyncInit = function () {
        FB.init({
            appId: '1171346970111819',
            cookie: true, // Enable cookies to allow the server to access the session.
            xfbml: true, // Parse social plugins on this webpage.
            version: 'v14.0'           // Use this Graph API version for this call.
        });


        FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
            statusChangeCallback(response);        // Returns the login status.
        });
    };

    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me',
                'GET',
                {"fields": "id, name,first_name,last_name,email,birthday,hometown,picture"},
                function (response) {
                    console.log(response);
                    document.getElementById('status').innerHTML =
                            'Thanks for logging in, ' + "TYPE = FACEBOOK\n" + JSON.stringify(response) + '!';

                    login(response, "facebook");
                });
    }


    function login(data, type) {
        sendInfo();
        data['type'] = type;

        $.ajax({
            type: "GET",
            url: "/api-user",
            contentType: 'application/json',
            data: data,
            dataType: 'json',
            beforeSend: function () {
                document.getElementById('status').innerHTML = "Đang kiểm tra đăng nhập.....";
            },
            success: function () {
                document.getElementById('status').innerHTML = JSON.stringify(data);

            },
            error: function () {
                document.getElementById('status').innerHTML = "Đăng nhập thất bại";

            }
        });
    }


</script>
<!-- Load the JS SDK asynchronously -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.min.js"></script>
</body>
</html>
