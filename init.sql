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
insert into users( uname,upassword,usex,uidcard,utel,uaccount,isfkorfd,regdate)
values('yao','a','男','152214199711123027','18373472202','18373472282','1',now() );

insert into users( uname,upassword,usex,uidcard,utel,uaccount,isfkorfd,regdate)
values('cm','a','男','152214199711123026','18373472202','18373472282','0',now() );
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
	hcondition varchar(20),
	foreign key(uid) references users(uid),
	foreign key(pzid) references peizhi(pzid),
	foreign key(addrid) references addr(addrid)
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
	money double,
	ocondition varchar(20),
	foreign key(uid) references users(uid),
	foreign key(hid) references house(hid)
);
insert into orderadmin(uid,hid,hindate,houtdate,money,ocondition)
values(1,1,'2018-09-10','2018-09-14','12280','已提交订单')
update orderadmin set uid=2 where oaid=1;
update orderadmin set	houtdate='2018-09-09' where oaid=1;
select * from orderadmin;


/**
  evaluate--评价
	score  --评分
 * 
 */
--评分表
create table eval(
	evid int primary key auto_increment,
	uid int ,
	 hid int,
	evaluate varchar(2000),
	score int check(score>=1 and score<=5),
	foreign key(uid) references users(uid),
	foreign key(hid) references house(hid)
);
select * from eval