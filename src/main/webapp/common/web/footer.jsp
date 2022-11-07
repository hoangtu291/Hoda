<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer>
    <nav class="navbar navbar-expand fixed-bottom p-0" id="footer-nav">
        <div class="container-fluid" id="tabbar" style="height: 100%">
            <ul class="navbar-nav" id="footer-icon">
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <a href="/home">
                        <button class="btn-home d-block">
                            <i class="bi bi-house-door"></i>
                        </button>
                    </a>
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <a href="#">
                        <button class="btn-people d-block">
                            <i class="bi bi-people"></i>
                        </button>
                    </a>
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
            
                    <button class="btn-add-post d-block" id="two">
                        <i class="bi bi-plus-circle"></i>
                    </button>        
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <button class="btn-notification d-block">
                        <i class="bi bi-bell"></i>
                    </button>
                </li>
                <li class="nav-item my-auto" onclick="changeColorIcon()">
                    <a href="/setting">
                        <button class="btn-setting d-block">
                            <i class="bi bi-gear"></i>
                        </button>
                    </a>
                </li>            
            </ul>
        </div>
    </nav>
    <script>
        function changeColorIcon() {
            console.log(document.querySelector('#footer-icon'));
//    if (document.querySelector('#' + 'btn-like_id_' + pid).classList.contains('green')) {
//        document.querySelector('#' + 'btn-like_id_' + pid).classList.remove('green');
//
//    } else {
//        if (document.querySelector('#' + 'btn-dislike_id_' + pid).classList.contains('green')) {
//            document.querySelector('#' + 'btn-dislike_id_' + pid).classList.remove('green');
//        }
//        document.querySelector('#' + 'btn-like_id_' + pid).classList.toggle('green');
//
//    }
}
    </script>
</footer>