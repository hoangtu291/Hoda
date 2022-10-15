const category = [
    "Thể thao",
    "Thời trang",
    "Xe cộ",
    "Tội phạm",
    "Lập trình",
    "Toán học",
    "Giáo dục",
    "Công nghệ",
    "Sách, báo",
    "Thiết bị điện tử",
    "Cuộc sống",
    "Thực phẩm",
    "Nấu ăn",
    "Thị trường",
    "Chứng khoán",
    "Thời tiết",
    "Giao thông",
    "Khác"
];
category.sort();

var i = 1;
category.forEach(cate => {
    $('.list-topic').append(`<div class="col box-topic">
                                            <input type="radio" id="control_${i}" name="categoryid" value="${i}">
                                            <label class="text-nowrap" for="control_${i}">
                                                ${cate}
                                            </label>
                                        </div>`);
    i++;
});