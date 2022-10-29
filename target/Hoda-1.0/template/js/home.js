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
function sendCommentToInput(id, pid, uid, sessionId) {
    if (uid == sessionId) {
        var comment = document.querySelector('#' + 'comment_' + id + "_" + pid + "_" + uid);
        var content = comment.querySelector('.content-comment').textContent;
        console.log();
        document.querySelector('#' + 'content-comment_id_' + pid).value = content;
    }
}
