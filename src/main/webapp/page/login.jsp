<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="header.jsp" %>    

	<div id="regLogin" class="wrap" style="display: none;" >
		<div class="dialog">
			<div class="box" style="width:400px;height:250px; margin:0 auto;background-color:rgba(255,255,255,0.15)
			    line-height:15px;">
				<h4>用户登录</h4>
				<form id="User_login_action" name="User_login_action" action="user_login.action" method="post">
					<div >
						<table class="field">
							<tr>
								<td  colspan="2" style="text-align:center;"></td>
							</tr>
							<tr>
								<td class="field" style="font-weight:bold">用 户 名：</td>
								<td>
									 <input type="text" name="uname" value="" id="uname" class="text" required="true"/>
								</td>
							</tr>
							<tr>
								<td class="field" style="font-weight:bold">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
								<td>
									<input type="password" name="upassword" value="a" id="upassword" class="text" required="true"/>
								</td>
							</tr>
						 <tr>
						 
							<td class="field" style="font-weight:bold">验 证 码：</td>
							<td>
									<input type="text" name="zccode" id="zccode"  style="font-size:14px;width:100px;" required="true"/>
									<img src="image.jsp" onclick="changeVilidateCode(this)" border="0" title="点击图片刷新验证码" size="10"/>
							</td>
						</tr> 
						
						
						</table>
						<div class="buttons" style=" width:150px;height:30px;text-align:center;margin:0 auto;">
							<input type="submit" id="User_login_action_0" value="立即登录"/>
						</div>
					</div>
				</form>

			</div>
		</div>
</div>

<!-- 筛选城市 -->

<form action="shaixuan.action">
	<input id="shaixuan" name="city" type="text" readonly="readonly"  class="area-danxuan" placeholder="请选择城市" value="" style="position:absolute;left: 270px;top:431px;width:560px;height: 57px;font-size: 20px"/>
	<input type="submit" value="" style="background-image: url(images/sousuo.jpg); border:none; position:absolute;top: 431px;left: 831px; width:221px;height: 60px;">
</form>
</div>

<p id="p1" style="font-size: 35px;width:300px;">别住酒店，住我家</p>
<h4 id="h4" style="margin-left:580px;">有朋自远方来，不亦说乎</h4>

<div style="width:100%;height:1000px;margin-top: 50px;">
	<div style="margin-left:60px;width:400px;height:400px;border:1px solid #010101;float:left;">
	  <img src="house/0.jpg" width="400"  height="400"/>
	</div>
	
	<div style="margin-left:20px;width:400px;height:400px;border:1px solid #010101;float:left;">
		<img src="house/1.jpg" width="400"  height="400"/>
	</div>
	
	<div style="margin-left:20px;width:400px;height:400px;border:1px solid #010101;float:left;">
	 <img src="house/4.jpg" width="400"  height="400"/>
	</div>
	
	
</div>



<div style="height:500px;background-image: url(img/bg_comment.jpg)">
	<div style="height:100px;">
		<p style="line-height:100px;text-align:center;;font-size:40px;width:100%;height:50px;color:white;">世间地所有相遇都是久别重逢</p>
	</div>
	<div style="height:50px;">
		<h4 id="h4" style="margin-left:580px;color:white;">房东和房客都在彼此感动着</h4>
	</div>
</div>

	
<%@ include file="bottom.jsp" %>  