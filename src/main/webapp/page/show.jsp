<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ page import="com.yc.utils.*,java.util.*,com.yc.bean.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function reserve(hid){
		location.href="house_reserve.action?hid="+hid;
}

function tishi(){
	alert("请先到首页登录或者注册");
}
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: snow;
}

.wrapper {
	width: 70%;
	height: 1000px;
	background-color: antiquewhite;
	margin: 0 auto;
	float: left;
}

.heading {
	margin: 0;
	width: 100%;
	height: 90px;
	background-color: snow;
	margin: 0 auto;
}

.heading_title {
	float: left;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 30px;
	color: burlywood;
}

.heading_nav {
	padding-bottom: 30px;
	padding-top: 30px;
	width: 100%;
	height: 30px;
	position: relative;
}

ul {
	margin-left: 0px;
	float: left;
	list-style-type: none;
	padding-top: 6px;
	padding-bottom: 6px;
}

li {
	padding-left: 0px;
	display: inline-block;
}

a:link, a:visited {
	font-weight: bold;
	color: darkgray;
	text-align: center;
	padding: 6px;
	text-decoration: none;
}

a:hover, a；active {
	color: dimgray;
}

.heading_img img {
	border-radius: 30px;
	display: inline;
	width: 26px;
	height: 26px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
	float: right;
}

.heading_soptlight form {
	float: right;
	width: 100px;
	height: 26px;
	position: relative;
	margin-right: 80px;
}

form input {
	height: 26px;
	border-radius: 30px;
}

.body {
	padding: 30px;
	height: auto;
	width: auto;
}

.pic {
	padding: 30px;
	height: 500px;
	width: auto;
	background-color: white;
}

.pic2 {
	padding: 30px;
	height: 500px;
	width: auto;
	background-color: white;
}

.xiangqing {
	padding: 30px;
	height: 91px;
	width: auto;
	background-color: antiquewhite;
}

.xq1 {
	padding: 0px;
	height: 100px;
	width: 280px;
	padding: 5;
	background-color: white;
	float: left;
}

.xq2 {
	padding: 0px;
	height: 100px;
	width: 280px;
	padding: 5;
	background-color: white;
	float: left;
}

.xq3 {
	padding: 0px;
	height: 100px;
	width: 280px;
	padding: 5;
	background-color: white;
	float: left;
}

.xiangqing2 {
	padding: 30px;
	height: 100px;
	width: auto;
	background-color: white;
}

.body_title h3 {
	font-size: 30px;
	font-family: Arial, Helvetica, sans-serif;
	color: #333;
}

.body_title p {
	margin-top: 20px;
	margin-bottom: 20px;
}

.footing {
	padding-top: 20px;
	text-align: center;
	font-size: 10px;
	color: darkgray;
	padding-bottom: 20px;
}

.wrapper2 {
	width: 30%;
	height: 800 px;
	background-color: antiquewhite;
	margin: 0 auto;
	float: right;
}

.heading2 {
	margin: 0;
	width: 100%;
	height: 90px;
	background-color: snow;
	margin: 0 auto;
}

.heading_title2 {
	float: left;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 30px;
	color: burlywood;
}

.heading_nav2 {
	padding-bottom: 30px;
	padding-top: 30px;
	width: 100%;
	height: 30px;
	position: relative;
}

ul {
	margin-left: 0px;
	float: left;
	list-style-type: none;
	padding-top: 6px;
	padding-bottom: 6px;
}

li {
	padding-left: 0px;
	display: inline-block;
}

a:link, a:visited {
	font-weight: bold;
	color: darkgray;
	text-align: center;
	padding: 6px;
	text-decoration: none;
}

a:hover, a；active {
	color: dimgray;
}

.heading_img2 img {
	border-radius: 30px;
	display: inline;
	width: 26px;
	height: 26px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
	float: right;
}

.heading_soptlight2 form {
	float: right;
	width: 100px;
	height: 26px;
	position: relative;
	margin-right: 80px;
}

form input {
	height: 26px;
	border-radius: 30px;
}

.body2 {
	padding: 30px;
	height: auto;
	width: auto;
}

.body_title2 h3 {
	font-size: 30px;
	font-family: Arial, Helvetica, sans-serif;
	color: #333;
}

.body_title2 p {
	margin-top: 20px;
	margin-bottom: 20px;
}

.footing2 {
	padding-top: 20px;
	text-align: center;
	font-size: 10px;
	color: darkgray;
	padding-bottom: 20px;
}
</style>


<body>
	<div class="container">
		<div class="wrapper">
			<div class="heading">
				<div class="heading_nav">
					<div class="heading_title" style="margin-top: -5px;margin-left: 15px;">${house.hname }&nbsp;&nbsp;&nbsp;&nbsp;     </div>
					<div class="heading_navbar">
						<ul>
							<li><a href="#">详细地址:${addr.xxaddr }</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<li><a href="#">门牌号:${addr.doornumber }</a></li>
						</ul>
					</div>


				</div>
			</div>
			<div class="body" style="width:100%">
				<div class="body_title">
					<h3>${house.hname }</h3>
					<p>${addr.province }>${addr.city }>${addr.town }>${addr.xxaddr }</p>
				</div>

			</div>



			<div class="pic">
				<div class="body_title2">
					<h3>${house.hname }</h3>
					<img alt="" src="${house.hpic }" style="height:480px; width:100%" />
				</div>
			</div>

			<div class="xiangqing" style="width:877px;">
				<div class="xq1" style="border-right: 1px solid #000;">
					<h3>${peizhi.rent }</h3>
					<p>房屋面积：${house.hfloorage }平米</p>
					<p>${peizhi.shi }室${peizhi.ting }厅${peizhi.chu }厨${peizhi.toilet }卫
					</p>
				</div>
				<div class="xq2" style="border-right: 1px solid #000;">
					<h3>宜住${house.hsum }人</h3>
				</div>
				<div class="xq3">
					<h3>
						<c:if test="${peizhi.bed==1 }">单人床</c:if>
						<c:if test="${peizhi.bed==2 }">双人床</c:if>
						<c:if test="${peizhi.bed==3 }">双层床</c:if>
						<c:if test="${peizhi.bed==4 }">沙发床</c:if>
						<c:if test="${peizhi.bed==5 }">榻榻米</c:if>
						<c:if test="${peizhi.bed==6 }">其他</c:if>
					</h3>
				</div>
			</div>


			<div class="xiangqing2">
				<div class="body_title2">
					<h3>描述</h3>
					<p>${house.hdescription }</p>
				</div>
			</div>
		</div>

	</div>



	<div class="container2">
		<div class="wrapper2">
			<div class="heading2">
				<div class="heading_nav2">
					<div class="heading_navbar2" style="margin-left: 150px;">
						<ul>
							<li><a href="page/login.jsp">首页</a></li>
							<li><a href="page/list.jsp">返回上一页</a></li>
							<li><a onclick='document.location="/user_logout.action"' style="cursor: pointer;">账户退出</a></li>
						</ul>
					</div>
				</div>
			</div>
			<%-- <div class="body" sty>
				<div class="body_title2">
					<h3>hname:${house.hname }</h3>
					<p>xxaddr: ${addr.xxaddr }</p>
					<p>doornumber:${addr.doornumber }</p>
				</div>
				<hr />
				<hr />
			</div> --%>

			<div class="pic2" style="margin-top:162px;">
				<div class="body_title2" style="margin: 20px 10px 20px 30px;">
					¥<span style="font-size: 50px">${house.hprice }</span><em>起</em>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp; 每晚
				</div>

				<div class="body_title2">
					<h3>${house.hname }</h3>
					<img alt="" src="${house.hpic }" style="height:281px; width:100%" />
					
					<!-- <div class="infos" style="margin: 20px 0px 20px 0px;">
						<table class="field">
							<tr>

								<td class="input_content"><input type="text" value="入住日期"
									style="width: 180px; height: 50px; text-align: center;"
									name="hindateString" onfocus="WdatePicker({lang:'en'})"
									class="Wdate" /></td>



								<td class="input_content"><input type="text" value="退房日期"
									style="width: 180px; height: 50px; text-align: center;"
									name="houtdateString" onfocus="WdatePicker({lang:'en'})"
									class="Wdate" /></td>
							</tr>
						</table>
					</div> -->

				</div>
			<c:if test="${user==null || user==''}">
				<div class="body_title2">
					<label class="ui-green"> <input
						onclick="tishi()" type="button" name="search"
						style="width: 100%;margin-top:10px; height: 50px; background-color: pink;"
						value="立即预定" />
					</label>
				</div>
				
		</c:if>
				<c:if test="${user!=null && user!=''}">
				
					<div class="body_title2">
					<label class="ui-green"> <input
						onclick="reserve(${house.hid})" type="button" name="search"
						style="width:100%; height: 50px;margin-top:10px; background-color: pink;"
						value="立即预定" />
					</label>
				</div>
					<div class="body_title2" style="margin: 60px 10px 20px 30px;">
						<h3>${user.uname }</h3>
						<p>性别：${user.usex }</p>
						<p>电话：${user.utel}</p>
						<p>账户：${user.uaccount}</p>
						<p>证件号：${user.uidcard}</p>
					</div>
	
				</c:if>
		 </div>
		</div>

	</div>
</body>









