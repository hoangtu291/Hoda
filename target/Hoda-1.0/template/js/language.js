var labelLang = {
    "HOME_TOPIC": {
        "vi-VN": "Thể loại",
        "en-US": "Categories"
    },
    "HOME_MODAL_TXT_ADDPOST": {
        "vi-VN": "Thêm bài viết",
        "en-US": "Add post"
    },
    "HOME_MODAL_SUGGEST_1": {
        "vi-VN": "Gợi ý 1: Trong tiêu đề nên có dấu '?'",
        "en-US": "Hint 1: Should have '?' in the title"
    },
    "HOME_MODAL_SUGGEST_2": {
        "vi-VN": "Gợi ý 2: Nên có các từ để hỏi",
        "en-US": "Hint 2: Should have question words"
    },
    "HOME_MODAL_SUGGEST_3": {
        "vi-VN": "Gợi ý 3: Nên trình bày cụ thể về chủ đề bài viết",
        "en-US": "Hint 3: Should be specific about the topic of the article"
    },
    "HOME_MODAL_INPUT_TITLE": {
        "vi-VN": `<textarea form="form-addPost" placeholder="Viết tiêu đề... ?" name="title" id="input-title"
                                                          data-emojiable="true" data-emoji-input="unicode"></textarea>`,
        "en-US": `<textarea form="form-addPost" placeholder="Write title... ?" name="title" id="input-title"
                                                          data-emojiable="true" data-emoji-input="unicode"></textarea>`
    }
    ,
    "HOME_MODAL_INPUT_CONTENT": {
        "vi-VN": `<textarea form="form-addPost" placeholder="Viết nội dung..." style="height: 150px;"
                                                          name="content" id="input-content" data-emojiable="true"
                                                          data-emoji-input="unicode"></textarea>`,
        "en-US": `<textarea form="form-addPost" placeholder="Write content..." style="height: 150px;"
                                                          name="content" id="input-content" data-emojiable="true"
                                                          data-emoji-input="unicode"></textarea>`
    },
    "HOME_MODAL_PREVIEW": {
        "vi-VN": "Xem trước",
        "en-US": "Preview"
    },
    "HOME_MODAL_BTN_POST": {
        "vi-VN": "Đăng",
        "en-US": "Post"
    },
    "POST_BOTTOMSHEET_POST_EDIT": {
        "vi-VN": "Chỉnh sửa bài viết",
        "en-US": "Edit post"
    },
    "POST_BOTTOMSHEET_POST_DELETE": {
        "vi-VN": "Xóa bài viết",
        "en-US": "Delete post"
    },
    "POST_BOTTOMSHEET_POST_REPORT": {
        "vi-VN": "Báo cáo",
        "en-US": "Report"
    },
    "POST_VIEW_CONTENT": {
        "vi-VN": "Xem nội dung",
        "en-US": "View content"
    }
};

var lang="vi-VN";
for (let i = 0; i < $('span.multilang').length; i++) {
    console.log($("span#" + $("span.multilang:eq(" + i + ")").attr('label-lang')));
    $($("span.multilang:eq(" + i + ")")).html(labelLang[$("span.multilang:eq(" + i + ")").attr('label-lang')][lang]);
    // $("img#" + itemLang[i].id).attr("data-bs-original-title", labels[itemLang[i].id][lang]);
}
