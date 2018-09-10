<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<link href="css/zyzn_1.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/City_data.js"></script>
<script type="text/javascript" src="js/areadata.js"></script>
<script type="text/javascript" src="js/auto_area.js"></script>
<script
	src="http://api.map.baidu.com/api?v=2.0&ak=A1LU7iHS0avqQwPLAxbhKn0UYSQCuRVH"></script>

<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico"
	rel="external nofollow" />
<script type="text/javascript"
	src="http://api.map.baidu.com/api?key=&v=1.3&services=true"></script>
<style type="text/css">
a {
	text-decoration: none;
}

li {
	list-style: none;
}

#d1 {
	border: 1px solid #C6CFCA;
	border-radius: 10px;
	background-color: #C6CFCA;
	width: 85px;
}

#allmap {
	height: 700px;
	width: 600px;
	overflow: hidden;
}

#r-result {
	width: 100%;
	font-size: 14px;
	position: absolute;
	top: 10px;
	left: 200px
}
</style>

</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		goPages(1);
	})

	function goPages(pages) {

		$.ajax({
			type : 'POST',
			url : "house_list.action",
			data : "pages=" + pages + "&pagesize=6",
			dataType : "html",
			success : function(data) {
				$("#houseArea").html(data);
			}
		});
	}
</script>
<div style="width: 100%; height: 140px;">
	<c:if test="${user!=null && user!=''}">
		<script>
			function add() {
				document.location = "user/house_toAdd.action";
			}
			function xianxian() {
				var div = document.getElementById("xiala").style.display;
				if (div == 'none') {
					document.getElementById("xiala").style.display = 'block';
				} else {
					document.getElementById("xiala").style.display = 'none';
				}
			}
			function chancefd() {
				var c = window.confirm("确认成为房东？");
				if (c == true) {
					document.location = "user/fkbianfd.action";
				} else {

				}
			}
		</script>

		<div style="background-color: yellow;">
			<c:if test="${user.isfkorfd==1 }">
				<div class="search">
					<label class="ui-green"
						style="float: right; margin: 20px 20px 0px 0px;"> <input
						onclick="add()" type="button" name="search"
						style="background-image: url(../images/btn.png); border: none; width: 140px; height: 40px;" />
					</label>
				</div>
			</c:if>

			<c:if test="${user.isfkorfd==0 }">
				<div class="search">
					<label class="ui-green"
						style="float: right; margin: 20px 20px 0px 0px;"> <input
						onclick="chancefd()" type="button" name="search"
						style="background-image: url(../images/btn.png); border: none; width: 140px; height: 40px;" />
					</label>
				</div>
			</c:if>


			<!-- 筛选城市 -->

			<form action="shaixuan.action">
				<input id="shaixuan" name="city" type="text" readonly="readonly"
					class="area-danxuan" placeholder="请选择城市" value=""
					style="position: absolute; width: 160px; top: 30px; left: 50px; height: 35px;" />
				<input type="submit" value=""
					style="background-image: url(images/sousuo.jpg); background-size: 81px 35px; border: none; position: absolute; left: 210px; top: 30px; width: 81px; height: 35px;">
			</form>


			<div id="" style="float: right; margin: 30px 20px 0px 0px; font-size: 20px;">
				<a onclick="xianxian()"
					style="cursor: pointer; color: rgb(0, 204, 136); margin-right: 50px;">欢迎您：${user.uname}</a>
				<div id="xiala" style="display: none;">
					<a href="page/person.jsp" style="cursor: pointer">个人中心</a><br /> <a
						href="orderdetail.action" style="cursor: pointer">订单详情</a><br />
					<a onclick='document.location="/user_logout.action"'
						style="cursor: pointer">退出</a>

				</div>
			</div>
		</div>
	</c:if>



	<c:if test="${user==null || user=='' }">
		<script>
			function add() {
				alert("请先登录");
			}
		</script>


		<div class="search">

			<label class="ui-green"
				style="float: right; margin: 20px 20px 0px 0px;"> <input
				onclick="add()" type="button" name="search"
				style="background-image: url(../images/btn.png); border: none; width: 140px; height: 40px;" />
			</label>
		</div>

		<div id="d1"
			style="float: right; margin: 30px auto; margin-right: 30px">
			<a href="page/register.jsp"
				style="cursor: pointer; margin-left: 30px; color: rgb(0, 204, 136);">注册</a>
		</div>

		<div id="d1"
			style="float: right; margin: 30px auto; margin-right: 30px">
			<a href="page/login.jsp"
				; style="cursor: pointer; margin-left: 30px; color: rgb(0, 204, 136);">登录</a>
		</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		<form action="shaixuan.action">
			<input id="shaixuan" name="city" type="text" readonly="readonly"
				class="area-danxuan" placeholder="请选择城市" value=""
				style="position: absolute; width: 160px; top: 30px; left: 50px; height: 35px;" />
			<input type="submit" value=""
				style="background-image: url(images/sousuo.jpg); background-size: 81px 35px; border: none; position: absolute; left: 210px; top: 30px; width: 81px; height: 35px;">
		</form>

	</c:if>

</div>

<div id="houseArea" style="width: 100%; height: 1000px;"></div>




<%@ include file="bottom.jsp"%>
