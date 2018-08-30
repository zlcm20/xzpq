<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
	margin:0;
	padding:0;
	}
a{
	text-decoration:none;
	}
li{
	list-style:none;
	
	}
#i1{
	width:112px;
	height:40px;
	margin:20px 180px;
	}
#img{
	width:100%;
	height:590px;
	background:url(../img/1.jpg);
	}
#d1{
	 border:1px solid #C6CFCA;
	 border-radius:10px;
	 
	 background-color:#C6CFCA;
	 width:85px; 
	}
#img ul{
	float:right;
	margin-top:40px;
	position:relative;
	left:-350px;
	}
#img ul li{
	float:left;
	margin-left:20px;
	}
#img ul li a{
	color:white;
	font-size:14px;
	}
#img p{
	color:white;
	font-size:46px;
	float:right;
	margin-top:165px;
	}
#img span{
	color:white;
	font-size:24px;
	float:right;
	margin-top:240px;
	position:relative;
	left:140px;
	}
#b1{
	width:120px;
	height:25px;
	background-color:rgb(0,204,136);
	border-radius:10px;
	position:relative;
	top:300px;
	left:750px;
	}
#b1 a{
	color:white;
	font-size:16px;
	margin-left:25px;
	}
#b2{
	width:120px;
	height:25px;
	background-color:rgb(0,204,136);
	border-radius:10px;
	position:relative;
	top:275px;
	left:950px;
	}
#b2 a{
	color:white;
	font-size:16px;
	margin-left:20px;
	}
#p1{
	margin:40px 550px;
	font-size:36px;
	}
#s1{
	display:inline-block;
	width:3.75rem;
    height:0.45rem;
    background-color:#2c2c2c;
    margin:1.5rem 0;
	position:relative;
	left:590px;
	}
#h4{
	font-size:1.0rem;
    color:#999;
    margin-left:480px;
	}
#d2{
	width:75%;
	margin-left:13.5%;
	height:280px;
	overflow:hidden;
	}
#i2{
	width:900px;
	height:390px;
	}
</style>
</head>
<body>
<div id="img">
<img src="img/xiaozhu.png"  id="i1"/><span  id="s1">小猪佩奇短租</span>
<ul>
<li><a href="" style="color:rgb(0,204,136);">首页</a></li>
<!-- <li><a href="">找兼职</a></li>
<li><a href="">小任务</a></li> -->
<li><div id="d1"><a href="login.jsp" style="margin-left:30px;color:rgb(0,204,136);">登录</a></div></li>
<li><div id="d1"><a href="register.jsp" style="margin-left:30px;color:rgb(0,204,136);">注册</a></div></li>
</ul>
<!-- <div id="b1"><a href="login.jsp">登录</a></div>
<div id="b2"><a href="register.jsp">注册</a></div> -->
</div>
<p id="p1">精品兼职</p>

<h4 id="h4">甄选优质兼职，做兼职其实也很有趣</h4>
<div id="d2"><img src="img/index_boutique.jpg" id="i2"/></div>
<div style="height:200px;"></div>
</body>
</html>