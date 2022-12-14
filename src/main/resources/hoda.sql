create table profile (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    firstname VARCHAR(40) NOT NULL,
    lastname VARCHAR(40) NOT NULL,
    fullname VARCHAR(80) NOT NULL,
    email VARCHAR(40) NOT NULL,
    birth date,
    phone VARCHAR(12),
    address VARCHAR(255),
    gender boolean,
    study VARCHAR(255),
    work VARCHAR(255),
    avatarimg text NOT NULL,
    coverimg VARCHAR(255) NOT NULL
);

create table user (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    socialid varchar(40) not null,
    createdtime datetime not null,
    modifiedtime datetime not null,
    type_accountid bigint not null,
    profileid bigint unique not null,
    role varchar(20)
    -- CONSTRAINT FK_ProfileUser FOREIGN KEY (profileid) REFERENCES profile(id)
);

create table login_type (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    name varchar(15) not null
    -- CONSTRAINT FK_ProfileUser FOREIGN KEY (profileid) REFERENCES profile(id)
);

create table follow_user (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    following bigint not null,
    follower bigint not null
);

create table category (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    code VARCHAR(80) NOT NULL,
    name VARCHAR(255) NOT NULL,
    nameEng VARCHAR(255) NOT NULL,
    total int default 0 not null
);

create table post (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    title varchar(255) not null,
    content text NOT NULL,
    createdtime datetime not null,
    modifiedtime datetime not null,
    categoryid bigint not null,
    userid bigint not null
    -- CONSTRAINT fk_post_category FOREIGN KEY (categoryid) REFERENCES category(id),
    -- CONSTRAINT FK_post_user FOREIGN KEY (userid) REFERENCES user(id)
);

create table image (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    url VARCHAR(255) NOT NULL,
    postid bigint not null
    -- CONSTRAINT FK_image_post FOREIGN KEY (userid) REFERENCES user(id)
);

create table tag (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    postid bigint not null,
    userid bigint not null
);

create table follow_post (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    postid bigint not null,
    userid bigint not null
);

create table interact(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    postid bigint not null,
    userid bigint not null
);

create table share (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    content text,
    createdtime datetime not null,
    modifiedtime datetime not null,
    interactid bigint unique not null
);

create table feel (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    status int not null,
    interactid bigint unique not null
);

create table comment (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    content text,
    createdtime datetime not null,
    modifiedtime datetime not null,
    interactid bigint unique not null
);


create table report_type (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    content VARCHAR(255) NOT NULL,
    contentEng VARCHAR(255) NOT NULL
);

create table report (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    createdtime datetime not null,
    report_typeid bigint not null,
    postid bigint not null,
    userid bigint not null
);

create table premium (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    status int NOT NULL,
    userid bigint not null
);

create table announment (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    message text not null,
    messageEng text not null,
    status int NOT NULL,
    createdtime datetime not null,
    -- announment_typeid bigint not null,
    userid bigint not null
);

create table announment_type (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    name VARCHAR(255) not null,
    message text not null
);

create table view (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    total int not null default 0
);


-- -----------------------------------------------------------------------------------------------
-- CONTRAINT FOREIGN-KEY

alter table post add constraint fk_post_category foreign key (categoryid) references category(id);
alter table post add constraint fk_post_user foreign key (userid) references user(id);

alter table image add constraint fk_image_post foreign key (postid) references post(id);

alter table user add constraint fk_user_profile foreign key (profileid) references profile(id);
alter table user add constraint fk_user_logintype foreign key (type_accountid) references login_type(id);

alter table follow_user add constraint fk_follower_user foreign key (follower) references user(id);
alter table follow_user add constraint fk_following_user foreign key (following) references user(id);

alter table follow_post add constraint fk_follow_user foreign key (userid) references user(id);
alter table follow_post add constraint fk_follow_post foreign key (postid) references post(id);

alter table interact add constraint fk_interact_user foreign key (userid) references user(id);
alter table interact add constraint fk_interact_post foreign key (postid) references post(id);

alter table tag add constraint fk_tag_user foreign key (userid) references user(id);
alter table tag add constraint fk_tag_post foreign key (postid) references post(id);

alter table report add constraint fk_report_user foreign key (userid) references user(id);
alter table report add constraint fk_report_post foreign key (postid) references post(id);
alter table report add constraint fk_report_type foreign key (report_typeid) references report_type(id);

alter table comment add constraint fk_comment_interact foreign key (interactid) references interact(id);
alter table share add constraint fk_share_interact foreign key (interactid) references interact(id);
alter table feel add constraint fk_feel_interact foreign key (interactid) references interact(id);

alter table premium add constraint fk_premium_user foreign key (userid) references user(id);

-- alter table announment add constraint fk_announment_type foreign key (announment_typeid) references announment_type(id);


-- --------------------------------------------------------------------------------------------
-- DATA
insert into login_type(name) values('facebook');
insert into login_type(name) values('google');




-- ----------------------------------------

insert into category(code, name, nameEng) values('cong-nghe', 'C??ng ngh???', 'Technology');
insert into category(code, name, nameEng) values('suc-khoe', 'S???c kh???e', 'Health');
insert into category(code, name, nameEng) values('cuoc-song', 'Cu???c s???ng', 'Life');

insert into category(code, name, nameEng) values('the-thao', 'Th??? thao', 'Sport');
insert into category(code, name, nameEng) values('thoi-trang', 'Th???i trang', 'Fashion');
insert into category(code, name, nameEng) values('xe-co', 'Xe c???', 'Vehicle');
insert into category(code, name, nameEng) values('toi-pham', 'T???i ph???m', 'Criminal');
insert into category(code, name, nameEng) values('lap-trinh', 'L???p tr??nh', 'Programing');
insert into category(code, name, nameEng) values('toan-hoc', 'To??n h???c', 'Mathematics');
insert into category(code, name, nameEng) values('giao-duc', 'Gi??o d???c', 'Education');
insert into category(code, name, nameEng) values('sach-bao', 'S??ch, b??o', 'Books, news');
insert into category(code, name, nameEng) values('thiet-bi-dien-tu', 'Thi???t b??? ??i???n t???', 'Electronic device');
insert into category(code, name, nameEng) values('thuc-pham', 'Th???c ph???m', 'Food');
insert into category(code, name, nameEng) values('nau-an', 'N???u ??n', 'Cooking');
insert into category(code, name, nameEng) values('chung-khoan', 'Ch???ng kho??n', 'Stock');
insert into category(code, name, nameEng) values('thoi-tiet', 'Th???i ti???t', 'Weather');
insert into category(code, name, nameEng) values('giao-thong', 'Giao th??ng', 'Traffic');
insert into category(code, name, nameEng) values('khac', 'Kh??c', 'Others');

insert into report_type(content, contentEng) values('N???i dung c?? t??nh b???o l???c, khi??u kh??ch', 'Violent and provocative content');
insert into report_type(content, contentEng) values('H??nh ???nh v?? t??? ng??? ph???n c???m', 'Erotic images and words');
insert into report_type(content, contentEng) values('N???i dung ph??n bi???t ch???ng t???c', 'Racist content');
insert into report_type(content, contentEng) values('Bu??n b??n h??ng c???m', 'Sale of prohibited goods');


insert into profile(firstname, lastname, fullname, email, birth, gender, avatarimg, coverimg)
values('Admin', 'Hoda', 'Admin Hoda', 'hoda.web.com@gmail.com', '2001-01-01', 1, 'https://lh3.googleusercontent.com/a/ALm5wu1-5QE_7P_9ZtuS4xIir70Im6hRWERgbvopUPaS=s96-c', '/upload/images/cover_default.png');

insert into user(socialid, createdtime, modifiedtime, type_accountid, profileid, role)
values(112995987703291376985, '2022-11-02 23:59:08', '2022-11-02 23:59:08', 2, 1, 'admin');

insert into view(total) VALUES (0);




