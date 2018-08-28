create database xzpq;
use xzpq;

--super管理员表
create table admin(
  aid int primary key auto_increment,
	aname varchar(20),
	apassword varchar(40)
);

create table users(
	uid int primary key auto_increment,
	uname  varchar(20),
	upassword varchar(40),
	usex varchar(2) default '男'check(fksex in('男','女')),
	uidcard varchar(18) unique,
	utel varchar(11),
	uaccount varchar(50),
	isfkorfd int,
	regdate date
);
select * from users;
/**
 *pzid int,--配置id
	addrid int,--地址id
	hname varchar(20),--房子标题
	uid int,用户id
	hprice double,--价格
	hpubdate date,--发布日期
	hdescription text,--描述
	hpic varchar(100),--图片
	hfloorage int,--面积
	hsum int,--可住人数

 */
--房屋表
create table house(
	hid  int primary key auto_increment,
	pzid int,
	addrid int,
	hname varchar(20),
	uid int,
	hprice double,
	hpubdate date,
	hdescription text,
	hpic varchar(100),
	hfloorage int,
	hsum int,
	hcondition varchar(20)
);

select * from house;

/**
 *bed,--床铺信息表
	rent,--出租类型
	shi,--室
	ting,--厅
	chu,--厨
	yangtai,--阳台
	toilet--卫生间
	floor  楼层
	towards 朝向
 */
--房屋基本配置
create table peizhi(
	pzid int primary key auto_increment,
	rent varchar(50),
	bed varchar(50),
	shi int ,
	ting int,
	chu int,
	yangtai int,
	toilet int,
	floor int,
	towards varchar(50)
);

select * from peizhi;

/**
  province,--省/自治区
	city,--市
	town,--县
	district,--区
	street--街
 */
--地址
create table addr(
	addrid int primary key auto_increment,
	province varchar(50),
	city varchar(50),
	town varchar(50),
	xxaddr varchar(50),
	doornumber varchar(50)
)

select * from addr;
/**
 *oaid int, 
	fkid int,
	fdid int,
	hid int,
	htid int,
	hindate,--入住日期
	houtdate,--退房日期
	condition ---状态
 */
--订单管理表
create table orderadmin(
	oaid int primary key auto_increment, 
	uid int,
	hid int,
	hindate date,
	houtdate date,
	ocondition varchar(20)
);
select * from orderadmin;


/**
  evaluate--评价
	score  --评分
 * 
 */
--评分表
create table eval(
	evid int primary key auto_increment,
	evaluate varchar(2000),
	score int check(score>=1 and score<=5)
)

