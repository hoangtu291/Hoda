var labelLang = {
    "HOME_TITLE": {
        "vi-VN": "HODA | Trang chủ",
        "en-US": "HODA | Home"
    },
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
    },
    "PERSONAL_TXT_FOLLOWER": {
        "vi-VN": "người theo dõi",
        "en-US": "followers"
    },
    "PERSONAL_TXT_FOLLOWING_1": {
        "vi-VN": "Đang theo dõi",
        "en-US": "Following"
    },
    "PERSONAL_TXT_FOLLOWING_2": {
        "vi-VN": "người dùng",
        "en-US": "users"
    },
    "PERSONAL_BTN_UPDATEINFO": {
        "vi-VN": "Cập nhật thông tin",
        "en-US": "Update profile"
    },
    "PERSONAL_BTN_FOLLOW": {
        "vi-VN": "Theo dõi",
        "en-US": "Follow"
    },
    "PERSONAL_BTN_FOLLOWING": {
        "vi-VN": "Đang theo dõi",
        "en-US": "Following"
    },
    "PERSONAL_TAB_POSTS": {
        "vi-VN": "Bài viết",
        "en-US": "Posts"
    },
    "PERSONAL_TAB_PHOTOS": {
        "vi-VN": "Ảnh",
        "en-US": "Photos"
    },
    "UPDATEPROFILE_TXT_PROFILE": {
        "vi-VN": "Thông tin cá nhân",
        "en-US": "Profile"
    },
    "UPDATEPROFILE_LABEL_ADDRESS": {
        "vi-VN": "Địa chỉ",
        "en-US": "Address"
    },
    "UPDATEPROFILE_LABEL_GENDER": {
        "vi-VN": "Giới tính",
        "en-US": "Gender"
    },
    "UPDATEPROFILE_LABEL_GENDER_MALE": {
        "vi-VN": "Nam",
        "en-US": "Male"
    },
    "UPDATEPROFILE_LABEL_GENDER_FEMALE": {
        "vi-VN": "Nữ",
        "en-US": "Female"
    },
    "UPDATEPROFILE_LABEL_PHONE": {
        "vi-VN": "Điện thoại",
        "en-US": "Phone number"
    },
    "UPDATEPROFILE_LABEL_BIRTH": {
        "vi-VN": "Ngày sinh",
        "en-US": "Date of birth"
    },
    "UPDATEPROFILE_LABEL_STUDY": {
        "vi-VN": "Học vấn",
        "en-US": "Study"
    },
    "UPDATEPROFILE_LABEL_WORK": {
        "vi-VN": "Nghề nghiệp",
        "en-US": "Work"
    },
    "FOLLOWUSER_TAB_FOLLOWER": {
        "vi-VN": "Người theo dõi",
        "en-US": "Follower"
    },
    "FOLLOWUSER_TAB_FOLLOWING": {
        "vi-VN": "Đang theo dõi",
        "en-US": "Following"
    }
};
//var lang = "vi-VN";
var lang = "en-US";
function changeLang () {
    for (let i = 0; i < $('span.multilang').length; i++) {
        $($("span.multilang:eq(" + i + ")")).html(labelLang[$("span.multilang:eq(" + i + ")").attr('label-lang')][lang]);
    }
}

changeLang();
