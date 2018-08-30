<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="header.jsp" %>    


	<div id="regLogin" class="wrap" style="background-image:url(images/1.png);">
		<div class="dialog">
			<div class="box" style="width:400px;height:250px; margin:0 auto;background-color:rgba(255,255,255,0.15)
			    line-height:15px;">
				<h4>用户登录</h4>
				<form id="User_login_action" name="User_login_action" action="user_login.action" method="post">
					<div >
						<table class="field">
							<tr>
								<td  colspan="2" style="text-align:center; color:red"></td>
							</tr>
							<tr>
								<td class="field">用 户 名：</td>
								<td>
									 <input type="text" name="uname" value="a" id="uname" class="text" required="true"/>
								</td>
							</tr>
							<tr>
								<td class="field">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
								<td>
									<input type="password" name="upassword" value="a" id="upassword" class="text" required="true"/>
								</td>
							</tr>
						 <tr>
						 
							<td class="field">验 证 码：</td>
							<td>
									<input type="text" name="zccode" id="zccode"  style="font-size:14px;width:100px;"/>
									<img src="image.jsp" onclick="changeVilidateCode(this)" border="0" title="点击图片刷新验证码" size="10"/>
							</td>
						</tr> 
						
						
						</table>
						<div class="buttons" style=" width:150px;height:30px;text-align:center;margin:0 auto;">
							<input type="submit" id="User_login_action_0" value="立即登录"/>

							<p value='注册' onclick='document.location="toRegister.action"'>没有账户？立即注册</p>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

	
<%@ include file="bottom.jsp" %>  