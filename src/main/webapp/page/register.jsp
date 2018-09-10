<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 


<script type="text/javascript">

		$(function(){
			$("#sub").click(function(){
				$.ajax({
					url:"user_register.action",
					data:$("#User_register_action").serialize(),
					dataTyep:"JSON",
					success:function(data){
						if( data.code==1){
							alert("注册成功");
							location.href="page/login.jsp";
						}else{
							$("#result").html("注册失败");
							alert("重新填写信息");
						}
					}
				});
			});
			
		});

</script>



<div id="regLogin" class="wrap">
	<div class="dialog">
		<dl class="clearfix">
			<dt>新用户注册</dt>
			<dd class="past">填写个人信息</dd>
		</dl>
		<div class="box">
			<form id="User_register_action" name="User_register_action" action="user_register.action" method="post">
				<div class="infos">
					<table class="field">
			
						<tr>
							<td  colspan="2" style="text-align:center; color:red"></td>
						</tr>
						<tr>
							<td class="field">用 户 名：</td>
							<td><input type="text" class="text" name="uname" /></td>
						</tr>
						<tr>
							<td class="field">密　　码：</td>
							<td><input type="password" class="text" name="upassword" /></td>
						</tr>
						<!-- <tr>
							<td class="field">确认密码：</td>
							<td><input type="password" class="text" name="repassword" /> </td>
						</tr> -->
						<tr>
							<td class="field">性　　别：</td>
							<td style="margin-left:20px;"><input type="radio" style="width:5px;" class="text" value="男" name="usex" />男 </td>
							<td style="margin-left:20px;"><input type="radio" style="width:5px;" class="text" value="女" name="usex" />女 </td>
						</tr>
						<tr>
							<td class="field">身份证号：</td>
							<td><input type="text" class="text" name="uidcard" /> </td>
						</tr>
						<tr>
							<td class="field">电　　话：</td>
							<td><input type="text" class="text" name="utel" /> </td>
						</tr>
						<tr>
							<td class="field">账　　户：</td>
							<td><input type="text" class="text" name="uaccount" /> </td>
						</tr>
					</table>
					<div class="buttons">
						<input type="button" id="sub" name="submit" value="立即注册" />
					</div>
					<div id="result"></div>
				</div>
			</form>




		</div>
	</div>
</div>



<%@ include file="bottom.jsp" %>  