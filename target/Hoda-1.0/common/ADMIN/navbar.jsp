<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <div class="me-3">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                <span class="icon-menu"></span>
            </button>
        </div>
        <div>
            <a class="navbar-brand brand-logo" href="/admin/home">
                <img src="../../template/images/hoda-logoText.png" alt="logo" />
            </a>
            <a class="navbar-brand brand-logo-mini" href="/admin/home">
                <img src="../../template/images/hoda-logo_bggreen.png" alt="logo" style="width: 22px"/>
            </a>
        </div>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-top"> 
        <ul class="navbar-nav">
            <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
                <h4 class="welcome-text"><span label-lang="ADMIN_HEADER_TXT_ADMINPAGE" class="multilang"></span></h4>
            </li>
        </ul>
        <ul class="navbar-nav ms-auto">
            
            <li class="nav-item d-none d-lg-block">
                <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
                    <span class="input-group-addon input-group-prepend border-right">
                        <span class="icon-calendar input-group-text calendar-icon"></span>
                    </span>
                    <input type="text" class="form-control">
                </div>
            </li>

            
            
            <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                    <img class="img-xs rounded-circle" src="${sessionScope.admin.getProfileModel().getAvatar()}" alt="Profile image"> </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                    <div class="dropdown-header text-center">
                        <img class="img-md rounded-circle" src="${sessionScope.admin.getProfileModel().getAvatar()}" alt="Profile image">
                        <p class="mb-1 mt-3 font-weight-semibold">${sessionScope.admin.getProfileModel().getFullName()}</p>
                        <p class="fw-light text-muted mb-0">${sessionScope.admin.getProfileModel().getEmail()}</p>
                    </div>
                   
                    <a class="dropdown-item" href="/logout"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i><span label-lang="WEB_HEADER_USER_LOGOUT" class="multilang"></span></a>
                </div>
            </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
        </button>
    </div>
</nav>