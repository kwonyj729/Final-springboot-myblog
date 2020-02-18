# 스프링 부트 블로그 만들기

## 1. 개발 환경

- Springboot
- MyBatis
- MySQL
- JSP
- Spring Security
- Lombok

## 2. 요구사항(기능)

- 회원가입
- 로그인
- 사용자 프로파일(사진) 업로드
- 게시글 등록
- 게시글 수정
- 게시글 삭제
- 게시글 목록
- 게시글 상세보기
- 게시글 페이징
- 게시글 검색
- 게시글 권한 관리
- 댓글 등록
- 댓글 삭제

## 3. 테이블

```sql
create user 'spring'@'%' identified by 'bitc5600';
GRANT ALL PRIVILEGES ON *.* TO 'spring'@'%';
create database spring;
use spring;
```

```sql
CREATE TABLE user(
	id int auto_increment primary key,
    username varchar(100) unique not null,
    password varchar(100) not null,
    email varchar(100),
    profile varchar(200),
    createDate timestamp
) engine=InnoDB default charset=utf8;
```

```sql
CREATE TABLE post(
	id int auto_increment primary key,
    title varchar(100) not null,
    content longtext,
    userId int,
    createDate timestamp,
    foreign key (userId) references user (id) on delete set null
) engine=InnoDB default charset=utf8;
```

```sql
CREATE TABLE comment(
	id int auto_increment primary key,
    userId int,
    postId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key (userId) references user (id) on delete set null,
    foreign key (postId) references post (id) on delete cascade
) engine=InnoDB default charset=utf8;
```

```sql
use spring;
show tables;

CREATE TABLE regions (
	id int AUTO_INCREMENT PRIMARY KEY,
    regName varchar(100) not null,
	city varchar(100) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select * from regions;

CREATE TABLE mountain (
	id int AUTO_INCREMENT PRIMARY KEY,
    mName varchar(100) not null,
    height int not null,
	regionId int not null,
    FOREIGN KEY (regionId) REFERENCES regions (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select * from mountain;

insert INTO regions VALUES (1, '관악구', '서울');
insert INTO regions VALUES (2, '금정구', '부산');
insert INTO regions VALUES (3, '달성군', '대구');
insert INTO mountain VALUES (1, '관악산', 632, 1);
insert INTO mountain VALUES (2, '삼성산', 481, 1);
insert INTO mountain VALUES (3, '우면산', 293, 1);
insert INTO mountain VALUES (4, '금정산', 802, 2);
insert INTO mountain VALUES (5, '봉래산', 395, 2);
insert INTO mountain VALUES (6, '엄광산', 504, 2);
insert INTO mountain VALUES (7, '비슬산', 1084, 3);
insert INTO mountain VALUES (8, '대니산', 408, 3);
insert INTO mountain VALUES (9, '와룡산', 799, 3);
```

```sql
use spring;
show tables;

CREATE TABLE mtProduct (
	id int AUTO_INCREMENT PRIMARY KEY,
    pName varchar(100) not null,
	price int not null,
	orderCount int,
    type varchar(100) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select * from mtProduct;
drop table mtProduct;
commit;

-- 전체보기, 등산용품보기, 캠핑용품보기, 가격순정렬, 주문순정렬.
insert INTO mtProduct VALUES (1, '등산화', 1700, 20, '등산용품');
insert INTO mtProduct VALUES (2, '등산스틱', 8500, 20, '등산용품');
insert INTO mtProduct VALUES (3, '배낭', 10000, 20, '등산용품');
insert INTO mtProduct VALUES (4, '스패츠', 2000, 30, '등산용품');
insert INTO mtProduct VALUES (5, '등산장갑', 3000, 45, '등산용품');
insert INTO mtProduct VALUES (6, '아이젠', 3500, 55, '등산용품');
insert INTO mtProduct VALUES (7, '등산모자', 4000, 32, '등산용품');
insert INTO mtProduct VALUES (8, '보온병', 6000, 37, '등산용품');
insert INTO mtProduct VALUES (9, '보호대', 500, 100, '등산용품');
insert INTO mtProduct VALUES (10, '등산복', 2300, 80, '등산용품');

insert INTO mtProduct VALUES (11, '바베큐그릴', 15000, 250, '캠핑용품');
insert INTO mtProduct VALUES (12, '버너', 3300, 10, '캠핑용품');
insert INTO mtProduct VALUES (13, '코펠', 25000, 80, '캠핑용품');
insert INTO mtProduct VALUES (14, '캠핑테이블', 32000, 202, '캠핑용품');
insert INTO mtProduct VALUES (15, '캠핑연료', 5000, 50, '캠핑용품');
insert INTO mtProduct VALUES (16, '침낭', 3000, 220, '캠핑용품');
insert INTO mtProduct VALUES (17, '텐트', 1500, 29, '캠핑용품');
insert INTO mtProduct VALUES (18, '담요', 27000, 44, '캠핑용품');
insert INTO mtProduct VALUES (19, '모기장', 2800, 78, '캠핑용품');
insert INTO mtProduct VALUES (20, '도시락통', 20000, 95, '캠핑용품');
```

**주소**
file:
path: C:/src/springbootProject/springboot-HOblog-final/media/
