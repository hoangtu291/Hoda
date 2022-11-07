<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Thông tin</title>
        <link href="IMG/Logo_Xanh.png" rel="shortcut icon" type="images/vnd.microsoft.icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link rel="stylesheet" href="../template/css/follow.css">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link
            href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet">
    </head>

    <body lang="${sessionScope.lang}">
        <main class="center">
            <div class="content-top">
                <a style="text-decoration: none; color: #000;" href="/personal?id=${requestScope.USER.getId()}"><div class="btn-back"><i class="fa-solid fa-arrow-left-long"></i></div></a>
                <h4>${requestScope.USER.getProfileModel().getFullName()}</h4>
            </div>

            <div class="main-follow-list">
                <div class="wrapper">
                    <div class="tabs">
                        <div class="tab">
                            <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch">
                            <label for="tab-1" class="tab-label"><span label-lang="FOLLOWUSER_TAB_FOLLOWER" class="multilang"></span></label>
                            <div class="tab-content">
                                <div class="follow-status d-flex">
                                    <div class="num-follow"><span class="num-follower">${requestScope.FOLLOWERS.size()}</span> <span label-lang="PERSONAL_TXT_FOLLOWER" class="multilang"></span></div>
                                    <div class="search-follow">
                                        <div class="search">
                                            <input type="text" id="filterFollower" onkeyup="filterFollow('filterFollower', 'list-follower')" title="Type in a name" placeholder=" ">
                                            <div>
                                                <svg>
                                                <use xlink:href="#path">
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 160 28" id="path">
                                    <path d="M32.9418651,-20.6880772 C37.9418651,-20.6880772 40.9418651,-16.6880772 40.9418651,-12.6880772 C40.9418651,-8.68807717 37.9418651,-4.68807717 32.9418651,-4.68807717 C27.9418651,-4.68807717 24.9418651,-8.68807717 24.9418651,-12.6880772 C24.9418651,-16.6880772 27.9418651,-20.6880772 32.9418651,-20.6880772 L32.9418651,-29.870624 C32.9418651,-30.3676803 33.3448089,-30.770624 33.8418651,-30.770624 C34.08056,-30.770624 34.3094785,-30.6758029 34.4782612,-30.5070201 L141.371843,76.386562" transform="translate(83.156854, 22.171573) rotate(-225.000000) translate(-83.156854, -22.171573)"></path>
                                </symbol>
                                </svg>
                                <div class="list-follow list-follower" id="list-follower">

                                    <c:forEach items="${requestScope.FOLLOWERS}" var="follower">
                                        <a style="text-decoration: none; color: #000;" href="/personal?id=${follower.getUserModel().getId()}">
                                            <div class="item-follow">
                                                <div class="content-item">
                                                    <div class="person-info">
                                                        <div class="avatar-person">
                                                            <img class="rounded-circle" src="${follower.getUserModel().getProfileModel().getAvatar()}" alt="">
                                                        </div>
                                                        <div class="name-person">
                                                            <span>${follower.getUserModel().getProfileModel().getFullName()}</span>
                                                        </div>
                                                    </div>

                                                    <!--                                                <div class="btn-follow-item">
                                                                                                        <label class="switch">
                                                                                                            <input type="checkbox" id="chb-follower_${follower.getUserModel().getId()}">
                                                                                                            <label class="slider" for="chb-follower_${follower.getUserModel().getId()}">Theo dõi</label>
                                                                                                        </label>
                                                                                                    </div>-->
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="tab">
                            <input type="radio" name="css-tabs" id="tab-2" class="tab-switch">
                            <label for="tab-2" class="tab-label"><span label-lang="FOLLOWUSER_TAB_FOLLOWING" class="multilang"></span></label>
                            <div class="tab-content">
                                <div class="follow-status d-flex">
                                    <div class="num-follow"><span label-lang="PERSONAL_TXT_FOLLOWING_1" class="multilang"></span> <span class="num-following">${requestScope.FOLLOWINGS.size()}</span> <span label-lang="PERSONAL_TXT_FOLLOWING_2" class="multilang"></span></div>
                                    <div class="search-follow">
                                        <div class="search">
                                            <input type="text" id="filterFollowing" onkeyup="filterFollow("filterFollowing", "list-following")" title="Type in a name" placeholder=" ">
                                            <div>
                                                <svg>
                                                <use xlink:href="#path">
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-follow list-following" id="list-following">
                                    <c:forEach items="${requestScope.FOLLOWINGS}" var="following">
                                        <a href="/personal?id=${following.getUserModel().getId()}">
                                            <div class="item-follow">
                                                <div class="content-item">
                                                    <div class="person-info">
                                                        <div class="avatar-person ">
                                                            <img class="rounded-circle" src="${following.getUserModel().getProfileModel().getAvatar()}" alt="">
                                                        </div>
                                                        <div class="name-person">
                                                            <span>${following.getUserModel().getProfileModel().getFullName()}</span>
                                                        </div>
                                                    </div>

                                                    <!--                                                <div class="btn-follow-item">
                                                                                                        <label class="switch">
                                                                                                            <input type="checkbox" id="chb-follower_${follower.getUserModel().getId()}">
                                                                                                            <label class="slider" for="chb-follower_${follower.getUserModel().getId()}">Theo dõi</label>
                                                                                                        </label>
                                                                                                    </div>-->
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script>
            function filterFollow(searchid, list) {
                var input, filter, ul, li, a, i, txtValue;
                input = document.getElementById(searchid);
                filter = input.value.toUpperCase();
                ul = document.getElementById(list);
                li = ul.getElementsByClassName("item-follow");
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByClassName("name-person")[0];
                    txtValue = a.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
        <script src="../template/js/language.js"></script>
    </body>

</html>
