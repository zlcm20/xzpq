create database xzpq;
use xzpq;

--super管理员表
create table admin(
  aid int primary key auto_increment,
	aname varchar(20),
	apassword varchar(40)
);
select 
			   hindate,
			   houtdate,
		       from  house
		       left join orderadmin on house.hid=orderadmin.hid where houtdate>=now() and house.hid=1
 		
 		select oaid,orderadmin.hid,hindate,houtdate,ocondition,
			users.uid,users.uname,users.usex,users.uidcard,users.utel,users.uaccount,users.isfkorfd,users.regdate,
				house.hid,house.pzid,house.addrid,house.hname,house.uid,house.hprice,house.hpubdate,house.hdescription,house.hpic,house.hfloorage,house.hsum
 		from orderadmin 
 		left join users  on orderadmin.uid = users.uid 
 		left join house on orderadmin.hid = house.hid
select count(*) from house,addr where house.addrid=addr.addrid and city='赤峰市';
insert into admin(aname,apassword) values('a','a');
drop table users
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
)

delete from users where uid=3;
insert into users( uname,upassword,usex,uidcard,utel,uaccount,isfkorfd,regdate)
values('a','a','男','152224199702013517','18373472282','18373472282','0',now() );
insert into users( uname,upassword,usex,uidcard,utel,uaccount,isfkorfd,regdate)
values('y','a','女','152224199702033516','18373472282','18373472281','1',now() );
select * from users;
select * from house;
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

select hid,hname,uid,hprice,hpubdate,hdescription,hpic,hfloorage,hsum,hcondition,
				       addr.addrid,
				       addr.province,
				       addr.city,
				       addr.town,
				       addr.xxaddr,
				       addr.doornumber,
				       peizhi.pzid,
							 peizhi.rent,
						 	 peizhi.bed,
						 	 peizhi.shi,
							 peizhi.ting,
							 peizhi.chu,
							 peizhi.yangtai,
							 peizhi.toilet,
							 peizhi.floor,
							 peizhi.towards
				   from house left join peizhi on house.pzid=peizhi.pzid
           left join addr on house.addrid=addr.addrid 
           where addr.city='赤峰市';
           
           
    select * from addr       
           
update house set hfloorage=1222 where hid=7
alter table house
add hcondition varchar(20)
select * from house left join peizhi on house.pzid=peizhi.pzid;

select * from house
pic/2018/9/19520182601152636.jpg

update house set hpic='pic/2018/9/19520182601152636.jpg' where hid=8
left join peizhi on house.pzid=peizhi.pzid
left join addr on house.addrid=addr.addrid  where hid=1;

select oaid,orderadmin.hid,hindate,houtdate,ocondition,
			house.hid,house.pzid,house.addrid,house.hname,house.uid,house.hprice,house.hpubdate,house.hdescription,house.hpic,house.hfloorage,house.hsum,
			users.uid,users.uname,users.usex,users.uidcard,users.utel,users.uaccount,users.isfkorfd,users.regdate
 		from orderadmin 
 		left join house on orderadmin.hid = house.hid
 		left join users  on house.uid = users.uid 
 		
 			select oaid,orderadmin.hid,hindate,houtdate,ocondition,
			users.uid,users.uname,users.usex,users.uidcard,users.utel,users.uaccount,users.isfkorfd,users.regdate,
				house.hid,house.pzid,house.addrid,house.hname,house.uid,house.hprice,house.hpubdate,house.hdescription,house.hpic,house.hfloorage,house.hsum
 		from orderadmin 
 		left join users  on orderadmin.uid = users.uid 
 		left join house on orderadmin.hid = house.hid
select hid,hname,uid,hprice,hpubdate,hdescription,hpic,hfloorage,hsum,hcondition,
				       addr.addrid,
				       addr.province,
				       addr.city,
				       addr.town,
				       addr.xxaddr,
				       addr.doornumber,
				       peizhi.pzid,
							 peizhi.rent,
						 	 peizhi.bed,
						 	 peizhi.shi,
							 peizhi.ting,
							 peizhi.chu,
							 peizhi.yangtai,
							 peizhi.toilet,
							 peizhi.floor,
							 peizhi.towards
				   from house left join peizhi on house.pzid=peizhi.pzid
           left join addr on house.addrid=addr.addrid 
           where hid=6; 
insert into house(pzid,addrid,hname,uid,hprice,hpubdate,hdescription,hfloorage,hsum)
values(1,1,'第一家',3,220,now(),'舒适的大床和床垫，相信您一定会舒舒服服的睡个好觉！除此之外卧室还有空调、衣柜、挂墙液晶电视、免费百兆wifi、以及独立的卫生间哦（24小时热水)',
200,4);
select * from house;
select hid,pzid,addrid,hname,uid,hprice,hpubdate,hdescription,hfloorage,hsum
from house where hid=1;
select * from users;
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
insert into peizhi (rent,bed,shi,ting,chu,yangtai,toilet,floor,towards)
values( '整套出租','单人床',2,1,1,1,1,2,'南');
select * from peizhi;
select * from peizhi  where pzid =4
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
insert into addr( province,city,town,xxaddr,doornumber)
values( '湖南省','衡阳市','珠晖区','中山路阳光小区8号楼2单元','201房');
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
drop table orderadmin


create table orderadmin(
	oaid int primary key auto_increment, 
	uid int,
	hid int,
	hindate date,
	houtdate date,
	ocondition varchar(20)
);

alter table orderadmin
add money double

delete from orderadmin where oaid=22;
select * from users;
select * from house;
select * from orderadmin;
update  orderadmin  set ocondition='已完成' where oaid=1
drop table users;
drop table house;
drop table orderadmin;
drop table admin;
drop table addr;
drop table peizhi;
select * from orderadmin
insert into orderadmin(uid,hid,hindate,houtdate,ocondition)
values(1,1,now(),'2018-9-1','待付款');

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
	score int check(score>=1 and score<=5)
)
select * from eval

select uid, hname from house left join users where 
select province from addr 