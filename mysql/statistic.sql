
-- 创建ratings
create table ratings(
userId int(64),
movieId int(64),
rating float(4),
timestamp_ int(64)
);
-- 将ratings.csv第一行数据删除并插入数据表ratings
load data infile 'D:/python/ThoughtWorks/pandas/movielens/ml-25m/ratings1.csv' 
into table ratings
fields terminated by ',' optionally enclosed by '"' escaped by '"'
lines terminated by '\r\n';
-- 创建movie
create table movie(
movieId int(64),
title varchar(200),
genres varchar(120)
);
-- 将movie.csv第一行数据删除并插入数据表movie
load data infile 'D:/python/ThoughtWorks/pandas/movielens/ml-25m/movies1.csv' 
into table movie
fields terminated by ',' optionally enclosed by '"' escaped by '"'
lines terminated by '\r\n';
-- 创建link
create table link(
movieId int(64),
imdbId int(64),
tmdbId int(64)
);
-- 将link.csv第一行数据删除并插入数据表link
load data infile 'D:/python/ThoughtWorks/pandas/movielens/ml-25m/links1.csv' 
into table movie
fields terminated by ',' optionally enclosed by '"' escaped by '"'
lines terminated by '\r\n';

-- 建立索引
alter table ratings add index userId(userId);
alter table ratings add index movieId(movieId);
-- i.一共有多少不同的用户
select count(distinct userId) from ratings;
-- ii.一共有多少不同的电影
select count(distinct movieId) from movie;
-- iii.一共有多少不同的电影种类
select count(distinct genres) from movie;
-- iv.一共有多少电影没有外部链接
select count(1) from movie t1 left join link t2 on t1.movieId=t2.movieId
where t2.imdbId is null and t2.tmdbId is null;
-- v.2018年一共有多少人进行过电影评分
select count(distinct userId) from ratings
where left(from_unixtime(timestamp_), 4);
-- vi.2018年评分5分以上的电影及其对应的标签
select 
t2.title
, t2.genres 
from ratings t1 left join movie t2 on t1.movieId=t2.movieId
where t1.rating > 5;