<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<div id="regLogin" class="wrap">
		<div class="dialog">
			<dl class="clearfix">
				<dt>新房屋信息发布</dt>
				<dd class="past">填写房屋信息</dd>

			</dl>
			<div class="box">
				<form id="House_add_action" name="House_add_action" action="user/house_doUpdate.action" method="post">
					<input type="hidden" name="hid" value="${house.hid }"/>
					<input type="hidden" name="addrid" value="${addr.addrid }"/>
					<input type="hidden" name="pzid" value="${peizhi.pzid }"/>
					<div class="infos">
						<table class="field">
							<tr>
								<td class="field">标题：</td>
								<td><input type="text" name="hname" value="${house.hname }"
									id="House_add_action_hname" class="text" /></td>
					  	</tr>
					  	
					  	<tr>
							<td class="field">房源位于：</td>
							<td>
								<div class="info">
										<div>
											<select id="province" name="province">
													<option value="${addr.province }">${addr.province }</option>
											</select>   
											<select id="city" name="city">
											    <option value="${addr.city }">${addr.city }</option>
											</select>   
											<select id="town" name="town">
													<option value="${addr.town }">${addr.town }</option>
											</select>
										<!-- 	<script class="resources library" src="js/area.js"
												type="text/javascript"></script>
											 <script type="text/javascript">
												_init_area();
											</script> --> 
										 </div>
								 <div id="show"></div>

								</div>
							</td>
						</tr>
					  	
					  <tr>
							<td class="field">详细地址：</td>
							<td><input type="text" name="xxaddr" value="${addr.xxaddr } "
								id="House_add_action_xxaddr" class="text" /></td>
						</tr>
						<tr>
							<td class="field">门牌号：</td>
							<td><input type="text" name="doornumber" value="${addr.doornumber }"
								id="House_add_action_doornumber" class="text" /></td>
						</tr>
						
						<tr>
							<td class="field">房屋户型：</td>
							<td>
							  <select class="text" name="rent" id="rent">
								    <option value="${peizhi.pzid }">${peizhi.rent }</option>
										<option value ="整套出租">整套出租</option>
										<option value ="独立单间">独立单间</option>
										<option value ="合住房间">合住房间</option>
								 </select>室
								<select class="text" name="shi" id="shi">
								    <option value="${peizhi.pzid }">${peizhi.shi }</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
								 </select>室
								<select class="text" name="ting" id="ting" >
								    <option value="${peizhi.pzid }">${peizhi.ting }</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
								</select> 厅
								<select class="text" name="toilet" id="toilet" >
								    <option value="${peizhi.pzid }">${peizhi.toilet }</option>
								    <option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
								</select> 卫
								<select class="text" name="chu" id="chu">
									  <option value="${peizhi.pzid }">${peizhi.chu }</option>
								    <option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
								</select> 厨
								<select class="text" name="yangtai" id="yangtai">
										<option value="${peizhi.pzid }">${peizhi.yangtai }</option>								
										<option value ="0">0</option>
										<option value ="1">1</option>
										<option value ="2">2</option>
										<option value ="3">3</option>
										<option value ="4">4</option>
										<option value ="5">5</option>
								</select> 阳台
							  <select class="text" name="bed" id="bed" >
							      <option value="${peizhi.pzid }">${peizhi.bed }</option>
							  		<option value ="单人床">单人床</option>
										<option value ="双人床">双人床</option>
										<option value ="双层床">双层床</option>
										<option value ="沙发">沙发</option>
										<option value ="榻榻米">榻榻米</option>
										<option value ="其他">其他</option>
							  </select> 床铺信息
							  <select class="text" name="hsum" id="hsum">
										<option value="${house.hid }">${house.hsum }</option>								
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
								
								<select class="text" name="towards" id="towards">
										<option value="${peizhi.pzid }">${peizhi.towards }</option>							
										<option value ="东">东</option>
										<option value ="南">南</option>
										<option value ="西">西</option>
										<option value ="北">北</option>
										<option value ="东南">东南</option>
										<option value ="东北">东北</option>
										<option value ="西南">西南</option>
										<option value ="西北">西北</option>
								</select> 朝 向
								<select class="text" name="floor" id="floor">
										<option value="${peizhi.pzid }">${peizhi.floor }</option>								
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
				     </td>
						</tr>
						
						
						<tr>
							<td class="field">出租面积：</td>
							<td><input type="text" name="hfloorage" value="${house.hfloorage}"
								id="House_add_action_hfloorage" class="text" /></td>
						</tr>
						<tr>
							<td class="field">价 格：</td>
							<td><input type="text" name="hprice" value="${house.hprice }"
								id="House_add_action_hprice" class="text" /></td>
						</tr>
						
						<tr>
							<td class="field">详细信息：</td>
							<td><textarea name="hdescription"></textarea>
							</td>
						</tr>
					  	
						
						</table>
						<div class="buttons">
							<input type="submit" id="House_add_action_0" value="立即发布"/>

						</div>
					</div>
				</form>




			</div>
		</div>
	</div>




<%@ include file="bottom.jsp" %> 