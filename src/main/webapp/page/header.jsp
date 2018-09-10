<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<title>小猪短租</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>


<link href="css/zyzn_1.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/City_data.js"></script>
<script type="text/javascript" src="js/areadata.js"></script>
<script type="text/javascript" src="js/auto_area.js"></script>
</head>





<body>
<!-- 城市 -->
	
	
	
	



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
	background:url(../images/background.jpg);
	position:relative;
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

<!-- 选择城市 -->


<script type="text/javascript">
	function login(){
		var div=document.getElementById("regLogin").style.display;
		if(div=='none'){
			document.getElementById("regLogin").style.display='block';
		}else{
			document.getElementById("regLogin").style.display='none';
		}
		
	}
	
	function xianshi(){
		var div=document.getElementById("xiala").style.display;
		if(div=='none'){
			document.getElementById("xiala").style.display='block';
		}else{
			document.getElementById("xiala").style.display='none';
		}
	}
	

	function eval(hid,oaid,uid){
			var r=window.open ('eval.action?hid='+hid+'&oaid='+oaid+'&uid='+uid, 'newwindow', 'height=300, width=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
			//init();
			
		}

	
	
	
	
</script>
</head>



<div id="img" >

	<a href="page/list.jsp"><img   src="images/pighead.png" style="margin-left: 50px;margin-top: 3px;width:80px;height: 80px"></a>
<ul>
<c:if test="${user==null || user=='' }">
<li><a href="manager/admin/adminlogin.jsp" style="cursor:pointer;color:rgb(0,204,136);">管理员</a></li>
<li><div id="d1"><a onclick="login()"; style="cursor:pointer;margin-left:30px;color:rgb(0,204,136);">登录</a></div></li>
<li><div id="d1"><a href="/page/register.jsp" style="cursor:pointer;margin-left:30px;color:rgb(0,204,136);">注册</a></div></li>
</c:if>

<c:if test="${user!=null && user!=''}">
	
		
<li><a    onclick="xianshi()"  style="cursor:pointer;color:rgb(0,204,136);margin-right: 50px;">欢迎您：${user.uname}</a>
	<div id="xiala" style="display: none;">
		<a href="page/person.jsp" style="cursor:pointer"  >个人中心</a><br/>
		<a href="orderdetail.action" style="cursor:pointer">订单详情</a><br/>
		<a  onclick='document.location="/user_logout.action"'  style="cursor:pointer">退出</a>
	
	</div>
</li>
<li><div id="d1"><a href="http://www.xiaozhu.com/xzweb.php?op=Help_UserGuide&type=tenant"  style="cursor:pointer; margin-left:20px;color:rgb(0,204,136);">房客指南</a></div></li>
<li><div id="d1"><a href="http://www.xiaozhu.com/xzweb.php?op=Help_UserGuide&type=landlord" style="cursor:pointer;margin-left:20px;color:rgb(0,204,136);">房东指南</a></div></li>
</c:if>

</ul>



