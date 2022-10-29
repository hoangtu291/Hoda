const {to, set, registerPlugin} = gsap
gsap.registerPlugin(MorphSVGPlugin)
gsap.config({trialWarn: false});
const tabbar = document.querySelector('#tabbar')
const indicator = tabbar.querySelector('.indicator')
const listEntries = tabbar.querySelectorAll('li')

listEntries.forEach(entry => {

    let button = entry.querySelector('button')

    button.addEventListener('click', e => {

        let active = tabbar.querySelector('li.active'),
                left = entry.offsetLeft + entry.offsetWidth / 2 - indicator.getBBox().width / 2 + 'px'

        to(active, {
            '--icon-circle': '0px',
            duration: .25,
            onComplete() {
                active.classList.remove('active')
            }
        })

        to(indicator.querySelector('path'), {
            keyframes: [{
                    morphSVG: 'M34 58C45.4078 58 48.3887 68.7534 68 72H0C19.6113 68.7534 22.5922 58 34 58Z',
                    duration: .1
                }, {
                    morphSVG: 'M34 48C41.4078 48 44.3887 66.7534 68 72H0C23.6113 66.7534 26.5922 48 34 48Z',
                    duration: .25,
                    delay: .125,
                    onStart() {
                        to(entry, {
                            keyframes: [{
                                    '--icon-y': '4px',
                                    '--icon-s': .9,
                                    duration: .185,
                                    delay: .025
                                }, {
                                    '--icon-circle': '28px',
                                    '--icon-y': '0px',
                                    '--icon-s': 1,
                                    duration: .2,
                                    clearProps: true,
                                    onComplete() {
                                        entry.classList.add('active')
                                    }
                                }]
                        })
                        to(tabbar, {
                            keyframes: [{
                                    '--indicator-circle-y': '-36px',
                                    duration: .25,
                                    delay: .05
                                }, {
                                    '--indicator-circle-o': 0,
                                    duration: .1,
                                    clearProps: true,
                                    onComplete() {
                                        set(tabbar, {
                                            '--indicator-x': left
                                        })
                                    }
                                }]
                        })
                    }
                }, {
                    morphSVG: 'M34 54C45.4078 54 48.3887 66.7534 68 72H0C19.6113 66.7534 22.5922 54 34 54Z',
                    duration: .2
                }]
        })

        to(tabbar, {
            keyframes: [{
                    '--indicator-x': left,
                    duration: .3
                }]
        })

    })


})


//var btn_dislike_id = $($('.btn-dislike')).attr("id");
//var btn_comment_id = $($('.btn-comment')).attr("id");
//var btn_close_id = $($('.btn-close')).attr("id");
function like(pid) {
    console.log(pid);
    console.log('#btn-dislike_id_' + pid);
    if (document.querySelector('#' + 'btn-dislike_id_' + pid).classList.contains('green')) {
        document.querySelector('#' + 'btn-dislike_id_' + pid).classList.remove('green');
    }
    document.querySelector('#' + 'btn-like_id_' + pid).classList.toggle('green');
}
function dislike(pid) {
    console.log(pid);
    console.log('#btn-like_id_' + pid);
    if (document.querySelector('#' + 'btn-like_id_' + pid).classList.contains('green')) {
        document.querySelector('#' + 'btn-like_id_' + pid).classList.remove('green');
    }
    document.querySelector('#' + 'btn-dislike_id_' + pid).classList.toggle('green');
}
function openComment(pid) {
    console.log(pid);
    console.log('#btn-comment_id_' + pid);
    document.querySelector('#' + 'btn-comment_id_' + pid).classList.toggle('green');
}
function closeComment(pid) {
    console.log(pid);
    console.log('#btn-close_id_' + pid);
    document.querySelector('#' + 'btn-comment_id_' + pid).classList.remove('green');
}
function sendCommentToInput(id, pid, uid, sessionId,cmtid) {
    console.log(uid === sessionId);
    if (uid === sessionId) {
        var comment = document.querySelector('#' + 'comment_' + id + "_" + pid + "_" + uid);
        var content = comment.querySelector('.content-comment').textContent;
        console.log();
        document.querySelector('#' + 'content-comment_id_' + pid).value = content;
//        console.log(document.querySelector('#' + 'btn-send_' + pid).classList);
        document.querySelector('#' + 'btn-send_' + pid).remove('btn-send');
//        document.querySelector('#' + 'btn-send_' + pid).classList.toggle('btn-update-comment');
        $('.send').append(`<button class="d-block btn-update-comment" id="btn-send_` + pid + `">
                                                        <svg>
                                                            <use xlink:href="#icon-send" />
                                                        </svg>
                                                        <svg style="display: none;" xmlns="http://www.w3.org/2000/svg"
                                                             version="1.1">
                                                            <symbol id="icon-send" viewBox="0 0 512 512"
                                                                    xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M501.6 4.186c-7.594-5.156-17.41-5.594-25.44-1.063L12.12 267.1C4.184 271.7-.5037 280.3 .0431 289.4c.5469 9.125 6.234 17.16 14.66 20.69l153.3 64.38v113.5c0 8.781 4.797 16.84 12.5 21.06C184.1 511 188 512 191.1 512c4.516 0 9.038-1.281 12.99-3.812l111.2-71.46l98.56 41.4c2.984 1.25 6.141 1.875 9.297 1.875c4.078 0 8.141-1.031 11.78-3.094c6.453-3.625 10.88-10.06 11.95-17.38l64-432C513.1 18.44 509.1 9.373 501.6 4.186zM369.3 119.2l-187.1 208.9L78.23 284.7L369.3 119.2zM215.1 444v-49.36l46.45 19.51L215.1 444zM404.8 421.9l-176.6-74.19l224.6-249.5L404.8 421.9z" />
                                                            </symbol>

                                                        </svg>
                                                    </button>`);
//        console.log(document.querySelector('#' + 'btn-send_' + pid).classList);
        $('.btn-update-comment').click(function (e) {
            console.log(pid);
            var data = {};
            var formData = $('#form-comment_' + pid).serializeArray();
            $.each(formData, function (i, v) {
                data["" + v.name + ""] = v.value;
            });
            data["cmtid"] = cmtid;
            console.log(data);

            $.ajax({
                url: "/api-comment",
                type: "PUT",
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    $('#form-comment_' + id)[0].reset();
                    console.log(data);
                }
            });
        });
    }
}