<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</head>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
body {
	background: #f5f5f5;
	margin: 0;
	padding: 0;
	font-family: "微软雅黑", Arial, Helvetica, sans-serif;
	
}

a {
	color: #006600;
	text-decoration: none;
}

a:hover {
	color: #990000;
}

.top {
	margin: 5px auto;
	color: #990000;
	text-align: center;
}

.info select {
	border: 1px #993300 solid;
	background: #FFFFFF;
}


.info select,.text {
	width: 120px;
	height: 35px;
	border-color:#d1d1d1;
	color:#666;
}

.text {
	width: 80px;
}
.span{
	width: 155px;
	height: 50px;
	display: inline-block;
	line-height:50px;
}
tr{
	margin:20px 0;
}

.info #show {
	color: #3399FF;
}


.bottom {
	text-align: right;
	font-size: 12px;
	color: #CCCCCC;
	width: 1000px;
}
.dialog  .infos  #field{
	width: 960px;
}
</style>

</head>
<body>


<script type="text/javascript">

	var Gid  = document.getElementById ;

	var showArea = function(){

		Gid('show').innerHTML = "<h3>省" + Gid('province').value + " -市" +

				Gid('city').value + " -县/区" +

				Gid('town').value + "</h3>"

	}

	Gid('town').setAttribute('onchange','showArea()');

</script>

<div id="regLogin" class="wrap" style="background: url(../house/back.jpg);background-size: 100% 100%;">
	<div class="dialog">
		<dl class="clearfix">
			<dt>新房屋信息发布</dt>
			<dd class="past">房源信息</dd>

		</dl>
		<div class="box">
			<form id="House_add_action" name="House_add_action" action="user/house_doAdd.action" method="post">
				<div class="infos">
					<table  id="field">
						<tr >
							<td class="field">房间标题：</td>
							<td><input type="text" name="hname" value=""
									   id="House_add_action_hname" class="text" /></td>
						</tr>
						<tr>
							<td class="field">房源位于：</td>
							<td>
								<div class="info">
									<div>
										<select id="province" name="province"></select>  
										<select id="city" name="city"></select>  
										<select id="town" name="town"></select>
										<script class="resources library" src="js/area.js"
												type="text/javascript"></script>
										<script type="text/javascript">
											_init_area();
										</script>
									</div>
									<div id="show"></div>

								</div>
							</td>
						</tr>


						<tr>
							<td class="field">详细地址：</td>
							<td><input type="text" name="xxaddr" value=""
									   id="House_add_action_xxaddr" class="text" /></td>
						</tr>
						<tr>
							<td class="field">门牌号：</td>
							<td><input type="text" name="doornumber" value=""
									   id="House_add_action_doornumber" class="text" /></td>
						</tr>

						<tr id="tr">
							<td class="field">房屋户型：</td>
							<td class="td">
								<span class="span">
									<select style="margin-left:0;" class="text" name="rent" id="rent">
									<option value ="r0" selected="selected">请选择</option>
									<option value ="整套出租">整套出租</option>
									<option value ="独立单间">独立单间</option>
									<option value ="合住房间">合住房间</option>
								</select> 出租类型
								</span>
								<span class="span">
									<select class="text" name="shi" id="shi">
										<option value ="s0" selected="selected">请选择</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
									</select> 室
								</span>
								<span class="span">
									<select class="text" name="ting" id="ting" >
										<option value ="t1" selected="selected">请选择</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
									</select> 厅
								</span>
								<span class="span">
									<select class="text" name="toilet" id="toilet" >
										<option value ="to1" selected="selected">请选择</option>
										<option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
									</select> 卫
								</span>
								<span class="span">
									<select style="margin-left:0;" class="text" name="chu" id="chu">
										<option value ="c0" selected="selected">请选择</option>
										<option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
									</select> 厨
								</span>
								<span class="span">
									<select class="text" name="yangtai" id="yangtai">
										<option value ="y0" selected="selected">请选择</option>
										<option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
									</select> 阳台
								</span>
								<span class="span">
									<select style="margin-left:0;" class="text" name="towards" id="towards">
										<option value ="t0" selected="selected">请选择</option>
										<option value ="东">东</option>
										<option value ="南">南</option>
										<option value ="西">西</option>
										<option value ="北">北</option>
										<option value ="东南">东南</option>
										<option value ="东北">东北</option>
										<option value ="西南">西南</option>
										<option value ="西北">西北</option>
									</select> 朝 向
								</span>
								<span class="span">
									<select class="text" name="floor" id="floor">
										<option value ="h0" selected="selected">请选择</option>
										<option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
										<option value ="6">6</option>
										<option value ="7">7</option>
										<option value ="8">8</option>
										<option value ="9">9</option>
										<option value ="10">10</option>
									</select> 楼 层
								</span>
								<span class="span">
									<select class="text" name="bed" id="bed" >
										<option value ="b0" selected="selected">请选择</option>
										<option value ="1">单人床</option>
										<option value ="2">双人床</option>
										<option value ="3">双层床</option>
										<option value ="4">沙发</option>
										<option value ="5">榻榻米</option>
										<option value ="5">其他</option>
									</select> 床铺信息
								</span>
								<span class="span">
									<select class="text" name="hsum" id="hsum">
										<option value ="h0" selected="selected">请选择</option>
										<option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
										<option value ="6">6</option>
										<option value ="7">7</option>
										<option value ="8">8</option>
										<option value ="9">9</option>
										<option value ="10">10</option>
									</select> 宜居人数
								</span>
							</td>
						</tr>

						<tr>
							<td class="field">出租面积：</td>
							<td><input type="text" name="hfloorage" value=""
									   id="House_add_action_floorage" class="text" /></td>
						</tr>
						<tr>
							<td class="field">价 格：</td>
							<td><input type="text" name=hprice value=""
									   id="House_add_action_price" class="text" /></td>
						</tr>

						<tr>
							<td class="field">联系方式：</td>
							<td><input type="text" name="utel" value=""
									   id="House_add_action_utel" class="text" /></td>
						</tr>
							<tr>
							<td class="field">详细信息：</td>
							<td><textarea type="text" name="hdescription"></textarea>
							</td>
						</tr>
						<tr>
							<td class="field">图片：</td>
							<td><textarea id="hosuepic" class="ckeditor" name="hpic"></textarea>
							
							</td>
						</tr>
					</table>
					<div class="buttons">
						<input type="submit" id="House_add_action_0" value="保存并继续" />

					</div>
				</div>
			</form>




		</div>
	</div>
</div>


<%@ include file="bottom.jsp"%>
