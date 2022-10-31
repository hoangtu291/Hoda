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
    profileid bigint unique not null
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
    nameEng VARCHAR(255) NOT NULL
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
    content VARCHAR(255) NOT NULL
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
    status int NOT NULL,
    createdtime datetime not null,
    announment_typeid bigint not null,
    userid bigint not null
);

create table announment_type (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    name VARCHAR(255) not null,
    message text not null
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

alter table announment add constraint fk_announment_type foreign key (announment_typeid) references announment_type(id);


-- --------------------------------------------------------------------------------------------
-- DATA
insert into login_type(name) values('facebook');
insert into login_type(name) values('google');




-- ----------------------------------------

insert into category(code, name) values('cong-nghe', 'Công nghệ');
insert into category(code, name) values('suc-khoe', 'Sức khỏe');
insert into category(code, name) values('cuoc-song', 'Cuộc sống');

insert into category(code, name) values('the-thao', 'Thể thao');
insert into category(code, name) values('thoi-trang', 'Thời trang');
insert into category(code, name) values('xe-co', 'Xe cộ');
insert into category(code, name) values('toi-pham', 'Tội phạm');
insert into category(code, name) values('lap-trinh', 'Lập trình');
insert into category(code, name) values('toan-hoc', 'Toán học');
insert into category(code, name) values('giao-duc', 'Giáo dục');
insert into category(code, name) values('sach-bao', 'Sách, báo');
insert into category(code, name) values('thiet-bi-dien-tu', 'Thiết bị điện tử');
insert into category(code, name) values('thuc-pham', 'Thực phẩm');
insert into category(code, name) values('nau-an', 'Nấu ăn');
insert into category(code, name) values('chung-khoan', 'Chứng khoán');
insert into category(code, name) values('thoi-tiet', 'Thời tiết');
insert into category(code, name) values('giao-thong', 'Giao thông');
insert into category(code, name) values('khac', 'Khác');



insert into user(fullname) values('Người dùng 01');
insert into user(fullname) values('Người dùng 02');




