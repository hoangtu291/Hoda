<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Thông tin</title>
        <link href="IMG/Logo_Xanh.png" rel="shortcut icon" type="images/vnd.microsoft.icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="../template/css/login.css">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link href="https://fonts.googleapis.com/css2?family=RocknRoll+One&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="background-1"></div>
                    <div class="background-2"></div>
                    <div class="content-top mt-3">
                        <h2>Thông tin cá nhân</h2>
                    </div>
                    <form action="">
                        <div class="row">

                            <div class="info-person">
                                <div class="main-info">
                                    <div class="info-top">
                                        <div class="left-side">
                                            <div class="img-person rounded-circle">
                                                <img src="#" alt="">
                                            </div>
                                        </div>
                                        <div class="right-side">
                                            <div class="person-name">
                                                <input class="form-control" type="text" name="fullname" value="${requestScope.USER.getProfileModel().getFullName()}">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="form-label">Địa chỉ</label>
                                    <input class="form-control" type="text" name="address" value="${requestScope.USER.getProfileModel().getAddress()}">
                                </div>

                                <p>Giới tính</p>

                                <div class="form-check gender-select col-md-6">
                                    <input type='radio' id='male' checked='checked' name='gender' value="1">
                                    <label for='male'>Nam</label>

                                </div>

                                <div class="form-check gender-select col-md-6">
                                    <input type='radio' id='female' name='gender' value="0">
                                    <label for='female'>Nữ</label>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Điện thoại</label>
                                    <input class="form-control" type="text" name="phone" id="" pattern="[0-9]+" value="${requestScope.USER.getProfileModel().getPhone()}">
                                </div>
                                <div class="col-md-6">
                                    <Label class="form-label">Ngày sinh</Label>
                                    <input class="form-control" type="date" name="birth" id="" value="${requestScope.USER.getProfileModel().getDateOfBirth()}">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Học vấn</label>
                                    <input class="form-control" type="text" name="study" id="" value="${requestScope.USER.getProfileModel().getStudy()}">
                                </div>
                                <div class="col-md-6">
                                    <Label class="form-label">Nghề nghiệp</Label>
                                    <input class="form-control" type="text" name="work" id="" value="${requestScope.USER.getProfileModel().getWork()}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 my-3" style="text-align: center;">
                                    <a href="/home">
                                        <button class="btn btn-success signUp" type="button">Xác nhận</button>
                                    </a>
                                    <!--<button class="btn btn-success signUp" type="submit">Xác nhận</button>-->
                                </div>
                            </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </main>
    <footer>

    </footer>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>