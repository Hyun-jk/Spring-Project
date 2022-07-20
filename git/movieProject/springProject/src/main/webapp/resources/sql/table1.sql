/*회원관리*/
create table M_member(
  mem_num number not null,
  id varchar2(18) unique not null,
  auth number(1) default 1 not null, /*0정지회원,1일반회원,2관리자*/
  
constraint M_member_pk primary key (mem_num)
);

create table M_member_detail(
  mem_num number not null,
  mem_name varchar2(18) not null,
  mem_pw varchar2(18) not null,
  mem_birth varchar2(6) not null,
  mem_phone varchar2(13) not null,
  mem_photo blob,
  mem_address varchar2(100) not null,
  mem_zipcode varchar2(5) not null,
  mem_email varchar2(50) not null,
  mem_grade number not null, /*1: 브론즈 - default (예매 3회 미만)2: 실버 (예매 3회 이상)3: 골드 (예매 5회 이상)*/ 
  
constraint M_member_detail_pk primary key (mem_num),
constraint M_member_detail_fk foreign key (mem_num) references M_member (mem_num)
);
ALTER TABLE m_member_detail MODIFY mem_birth number(8);
ALTER TABLE m_member_detail MODIFY mem_grade number(4) DEFAULT 0;
ALTER TABLE m_member_detail ADD photo_name varchar2(100) null;

create sequence M_member_seq;

/*게시판*/
create table M_board(
  board_num number not null,
  mem_num number not null,
  board_auth number(1) not null, /*auth:1:공지사항/2:일대일문의/3:자주찾는 질문*/
  board_title varchar2(90) not null,
  board_content clob not null,
  board_uploadfile blob,
  board_filename varchar2(40),
  board_hit number(5) default 0 not null,
  board_reg_date date default SYSDATE not null,

  constraint M_board_pk primary key (board_num),
  constraint M_board_M_member_fk foreign key (mem_num) references M_member (mem_num)
);
create sequence M_board_seq;

/*게시판 카테고리*/
create table M_category(
  cate_num number not null,
  cate_name varchar2(40) not null,
  board_num number not null,

  constraint M_category_pk primary key (cate_num),
  constraint M_category_M_board_fk foreign key (board_num) references M_board (board_num)
);
create sequence M_category_seq;

/*게시판 댓글*/
create table M_reply(
  reply_num number not null,
  board_num number not null,
  mem_num number not null,
  re_content varchar2(900) not null,
  re_date date default SYSDATE not null,

  constraint M_reply_pk primary key (reply_num),
  constraint M_reply_M_board_fk foreign key (board_num)
                                references M_board (board_num),
  constraint M_reply_M_member_fk foreign key (mem_num)
                                references M_member (mem_num)
);
create sequence M_reply_seq;

/*영화*/
create table M_movie(
  movie_num number not null,
  movie_name varchar2(50) not null,
  movie_content varchar2(2000) not null,
  movie_genre varchar2(50) not null,
  movie_photo1 blob,
  movie_photo2 blob,
  movie_photo3 blob,
  movie_photo4 blob,
  movie_photo5 blob,
  movie_pg number(10) not null, /*영화 관람 연령(12세/15세/19세)*/
  movie_auth number(1) not null, /*영화 상영정보0:상영중/1:상영예정/2:상영종료*/
  movie_rate number(4),

  constraint M_movie_pk primary key (movie_num) 
);
create sequence M_movie_seq;

/*영화관*/
create table M_theater(
  theater_num number not null,
  theater_name varchar2(18) not null,
  theater_addr varchar2(100) not null,
  heater_local varchar2(20) not null,
  theater_image blob,
  heater_imagefile varchar2(90),
  
  constraint M_theater_pk primary key (theater_num)
);
create sequence M_theater_seq;

/*좌석*/
create table M_seat(
  seat_num number not null,
  theater_num number not null,
  seat_name varchar2(10) not null,  

  constraint M_seat_pk primary key (seat_num),
  constraint M_seat_M_theater_fk foreign key (theater_num) 
                                references M_theater (theater_num)
);
create sequence M_seat_seq;

/*상영시간*/
create table M_time(
  time_num number not null,
  theater_num number not null,
  movie_num number not null,
  movie_name varchar2(50) not null,
  movie_date date not null,
  movie_time varchar2(10) not null,
  
  constraint M_time_pk primary key (time_num),
  constraint M_time_M_theater_fk foreign key (theater_num) 
                                references M_theater (theater_num),
  constraint M_time_M_movie_fk foreign key (movie_num) 
                                references M_movie (movie_num)
);
create sequence M_time_seq;

/*예약좌석*/
create table M_reservseat(
  revseat_num number not null,
  time_num not null,
  seat_num not null,

  constraint M_reservseat_pk primary key (revseat_num),
  constraint M_reservseat_M_time_fk foreign key (time_num) 
                                references M_time (time_num),
  constraint M_reservseat_M_seat_fk foreign key (seat_num) 
                                references M_seat (seat_num)
);
create sequence M_reservseat_seq;

/*예매내역*/
create table M_reserve(
  reserve_num number not null,
  time_num number not null,
  mem_num number not null,
  movie_num number not null,
  reserve_seat varchar2(5) not null, /* 예매완료한 좌석 번호 - 2명 예약시 (1,2) */
  reserve_paymethod number(1) not null, /*결제수단 (1:카드결제/2:현금결제/3:카카오페이)*/
  reserve_paytotal number not null,
  constraint M_reserve_pk primary key (reserve_num),
  constraint M_reserve_M_time_fk foreign key (time_num) references M_time (time_num),
  constraint M_reserve_M_member_fk foreign key (mem_num) references M_member (mem_num),
  constraint M_reserve_M_member_detail_fk foreign key (mem_num) references M_member_detail (mem_num),
  constraint M_reserve_M_movie_fk foreign key (movie_num) references M_movie (movie_num)
);
create sequence M_reserve_seq;

/*리뷰*/
create table M_review(
  review_num number not null,
  movie_num number not null,
  review_content clob not null,
  review_rate number(1) not null, /*0~5점 사이 리뷰 평점*/
  mem_num number not null,
  review_reg_date date default SYSDATE not null,
  
  constraint M_review_pk primary key (review_num),
  constraint M_review_M_movie_fk foreign key (movie_num) references M_movie (movie_num),
  constraint M_review_M_member_fk foreign key (mem_num) references M_member (mem_num)
);
create sequence M_review_seq;

/*좋아요*/
create table M_like(
  like_num number not null,
  review_num number not null,
  mem_num number not null,

  constraint M_like_pk primary key (like_num),
  constraint M_like_M_review_fk foreign key (review_num) references M_review (review_num),
  constraint M_like_M_member_fk foreign key (mem_num) references M_member (mem_num)
);
create sequence M_like_seq;